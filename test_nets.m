function [fg_o,c_4r_o,c_5r_o,c_4r_e_o] = test_nets(test_set,fg_net, c_4r_net, c_5r_net, c_4c_e_net)

fg_o = fg_net(test_set(2,:));
c_4r_o = c_4r_net(test_set(3,:));
c_5r_o = c_5r_net(test_set(4,:));
c_4r_e_o = c_4c_e_net([test_set(3,:); test_set(5,:) ./ test_set(2,:)]);


% outputs(1,:) = fg_net(train_set(2,:));
% outputs(2,:) = c_4r_net(train_set(3,:));
% outputs(3,:) = c_5r_net(train_set(4,:));
% outputs(4,:) = c_4c_e_net([train_set(2,:); train_set(3,:) ./ train_set(5,:)]);
end

