function [fg_net, c_4r_net, c_5r_net, c_4c_e_net] = train_nets(all_dataset,train_indexes_map,test_indexes_map)

fg_net = method_1(all_dataset(2,:), all_dataset(1,:),train_indexes_map,test_indexes_map);

c_4r_net = method_2(all_dataset(3,:), all_dataset(1,:),train_indexes_map,test_indexes_map);
c_5r_net = method_2(all_dataset(4,:), all_dataset(1,:),train_indexes_map,test_indexes_map);

c_4c_e_net = method_3(all_dataset(2,:), all_dataset(3,:), all_dataset(5,:), all_dataset(1,:),train_indexes_map,test_indexes_map);
 
end

