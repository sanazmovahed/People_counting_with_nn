function [train_fg_x, train_close_fg_4r, train_close_fg_5r, train_erosed_fg, train_ground_truth, test_fg_x, test_close_fg_4r, test_close_fg_5r, test_erosed_fg, test_ground_truth] = dispart_dataset(all_fg_x, all_close_fg_4r, all_close_fg_5r, all_erosed_fg, ground_truth)
%Reads only train_data from whole data 

train_ground_truth = cell(1, length(ground_truth));
for k = 1:length(ground_truth)
  if (mod(k, 3) ~= 0)
      train_fg_x{k} = all_fg_x{k};
      train_close_fg_4r{k} = all_close_fg_4r{k};
      train_close_fg_5r{k} = all_close_fg_5r{k};
      train_erosed_fg{k} = all_erosed_fg{k};
      train_ground_truth{k}=ground_truth(k);
  else
      test_fg_x{k/3} = all_fg_x{k};
      test_close_fg_4r{k/3} = all_close_fg_4r{k};
      test_close_fg_5r{k/3} = all_close_fg_5r{k};
      test_erosed_fg{k/3} = all_erosed_fg{k};
      test_ground_truth{k/3}=ground_truth(k);
  end  
  
end

train_fg_x = train_fg_x(~cellfun('isempty',train_fg_x));
train_close_fg_4r=train_close_fg_4r(~cellfun('isempty',train_close_fg_4r));
train_close_fg_5r=train_close_fg_5r(~cellfun('isempty',train_close_fg_5r));
train_erosed_fg=train_erosed_fg(~cellfun('isempty',train_erosed_fg));
train_ground_truth=train_ground_truth(~cellfun('isempty',train_ground_truth));


test_fg_x = test_fg_x(~cellfun('isempty',test_fg_x));
test_close_fg_4r=test_close_fg_4r(~cellfun('isempty',test_close_fg_4r));
test_close_fg_5r=test_close_fg_5r(~cellfun('isempty',test_close_fg_5r));
test_erosed_fg=test_erosed_fg(~cellfun('isempty',test_erosed_fg));
test_ground_truth=test_ground_truth(~cellfun('isempty',test_ground_truth));

end

