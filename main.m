
clc
clear
close all

ground_truth = xlsread('groundtruth.xls')';
dataset = imageSet('ximagepixels');

%---------- Disparting Train And Test Indexes To Set Network---------------
img_loc = cell2mat(dataset.ImageLocation(:));
img_loc = img_loc(1:end, :);
test_indexes = 0:3:size(img_loc, 1);
test_indexes(1) = [];
train_indexes = 1:size(img_loc, 1);
train_indexes(test_indexes) = [];

%----------- Preprocessor Phase -------------------------------------------
[fg_x, close_fg_4r, close_fg_5r, erosed_fg] = preprocessor();

%----------- Set All Data For Training Phase Of Network--------------------
all_dataset(1,:) = ground_truth;
all_dataset(2,:) = cell2mat(fg_x);
all_dataset(3,:) = cell2mat(close_fg_4r);
all_dataset(4,:) = cell2mat(close_fg_5r);
all_dataset(5,:) = cell2mat(erosed_fg);

%------------- Dispart Train And Test Data --------------------------------
[train_fg, train_c_4r, train_c_5r, train_erosed, train_gt, ...
    test_fg, test_c_4r, test_c_5r, test_erosed, test_gt] ...
    = dispart_dataset(fg_x, close_fg_4r, close_fg_5r, ...
    erosed_fg, ground_truth);

%------------- Convert Cells Of Train Data To Matrix And Sort Train Set -------------
train_set(1,:)= cell2mat(train_gt);
train_set(2,:)= cell2mat(train_fg);
train_set(3,:)= cell2mat(train_c_4r);
train_set(4,:)= cell2mat(train_c_5r);
train_set(5,:)= cell2mat(train_erosed);

[sorted_train_set(2,:), fg_sort_idx] = sort(cell2mat(train_fg));
sorted_train_set(1,:) = cell2mat(train_gt(fg_sort_idx));

[sorted_train_set(4,:), c_4r_sort_idx] = sort(cell2mat(train_c_4r));
sorted_train_set(3,:) = cell2mat(train_gt(c_4r_sort_idx));

[sorted_train_set(6,:), c_5r_sort_idx] = sort(cell2mat(train_c_5r));
sorted_train_set(5,:) = cell2mat(train_gt(c_5r_sort_idx));

[sorted_train_set(8,:), c_4r_e_sort_idx] = sort(cell2mat(train_erosed) ./ cell2mat(train_fg));
sorted_train_set(7,:) = cell2mat(train_gt(c_4r_e_sort_idx));

%------------- Convert Cells Of Test Data To Matrix And Sort Train Set --------------
test_set(1,:)= cell2mat(test_gt);
test_set(2,:)= cell2mat(test_fg);
test_set(3,:)= cell2mat(test_c_4r);
test_set(4,:)= cell2mat(test_c_5r);
test_set(5,:)= cell2mat(test_erosed);

sorted_test_set(2,:) = cell2mat(test_fg);
sorted_test_set(1,:) = cell2mat(test_gt);

sorted_test_set(4,:) = cell2mat(test_c_4r);
sorted_test_set(3,:) = cell2mat(test_gt);

sorted_test_set(6,:) = cell2mat(test_c_5r);
sorted_test_set(5,:) = cell2mat(test_gt);

sorted_test_set(8,:) = sort(cell2mat(test_erosed));
sorted_test_set(7,:) = cell2mat(test_gt);


test_sum = zeros(4,51);
train_sum = zeros(4,102);

iteration_num = 10;

for i=1:iteration_num
    
    [fg_net, c_4r_net, c_5r_net, c_4c_e_net] = train_nets(all_dataset,train_indexes,test_indexes);
    [fg_o,c_4r_o,c_5r_o,c_4r_e_o] = test_train_data(train_set, fg_net, c_4r_net, c_5r_net, c_4c_e_net);
    
    train_outputs(1,:) = fg_o(fg_sort_idx);
    train_outputs(2,:) = c_4r_o(c_4r_sort_idx);
    train_outputs(3,:) = c_5r_o(c_5r_sort_idx);
    train_outputs(4,:) = c_4r_e_o(c_4r_e_sort_idx);
    
    train_sum(1,:) =  train_sum(1,:) + train_outputs(1,:);
    train_sum(2,:) =  train_sum(2,:) + train_outputs(2,:);
    train_sum(3,:) =  train_sum(3,:) + train_outputs(3,:);
    train_sum(4,:) =  train_sum(4,:) + train_outputs(4,:);
    
    [t_fg_o,t_c_4r_o,t_c_5r_o,t_c_4r_e_o] = test_nets(test_set, fg_net, c_4r_net, c_5r_net, c_4c_e_net);
    
    test_outputs(1,:) = t_fg_o;
    test_outputs(2,:) = t_c_4r_o;
    test_outputs(3,:) = t_c_5r_o;
    test_outputs(4,:) = t_c_4r_e_o;
    
    test_sum(1,:) =  test_sum(1,:) + test_outputs(1,:);
    test_sum(2,:) =  test_sum(2,:) + test_outputs(2,:);
    test_sum(3,:) =  test_sum(3,:) + test_outputs(3,:);
    test_sum(4,:) =  test_sum(4,:) + test_outputs(4,:);
    
end

avg_train_outputs = train_sum / iteration_num;

plot_outputs(avg_train_outputs, sorted_train_set);

avg_test_outputs = test_sum / iteration_num;

plot_test_outputs(test_outputs, cell2mat(test_gt));

plot_errors(avg_test_outputs, test_gt)

[avg_errors, accuracy_10_err] = calculate_errors(avg_test_outputs,test_gt);

avg_errors

accuracy_10_err

