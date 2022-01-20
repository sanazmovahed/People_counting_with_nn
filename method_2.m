function [closed_net] = method_2(closed_fg, ground_truth, train_indexes_map, test_indexes_map)
%Gets white pixels of closed foreground and returns people count found in each image 
% 
% net = fitnet(10, 'trainbr');
% net.trainParam.showWindow = false;
% net.divideParam.trainRatio = 1;
% net.divideParam.valRatio = 0;
% net.divideParam.testRatio = 0;

net = fitnet(10, 'trainbr');
net.trainParam.showWindow = false;
net.divideParam.trainRatio = 1;
net.divideParam.valRatio = 0;
net.divideParam.testRatio = 1;
net.divideFcn = 'divideind';
net.divideParam.trainInd = train_indexes_map;
net.divideParam.valInd = [];
net.divideParam.testInd = test_indexes_map;

closed_net = train(net, closed_fg, ground_truth);

end

