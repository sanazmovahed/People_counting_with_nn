function [fg_4r_e_net] = method_3(fg_x, closed_fg_4r, erosed_fg, ground_truth, train_indexes_map, test_indexes_map)
%Gets foreground white pixels, foreground white pixels after closing, and  
% foreground white pixels after two-times erosion and returns people count found in each image 

net = fitnet(50, 'trainbr');
net.trainParam.showWindow = false;
net.divideParam.trainRatio = 1;
net.divideParam.valRatio = 0;
net.divideParam.testRatio = 1;
net.divideFcn = 'divideind';
net.divideParam.trainInd = train_indexes_map;
net.divideParam.valInd = [];
net.divideParam.testInd = test_indexes_map;

fg_4r_e_net = train(net, [closed_fg_4r; erosed_fg ./ fg_x], ground_truth);

end

