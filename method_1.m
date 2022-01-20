function [fg_x_net] = method_1(fg_x, ground_truth, train_indexes_map, test_indexes_map)
%This function gets foreground pixels and returns poeple count found in
%each image


net = fitnet(10, 'trainbr');
net.trainParam.showWindow = false;
net.divideParam.trainRatio = 1;
net.divideParam.valRatio = 0;
net.divideParam.testRatio = 1;
net.divideFcn = 'divideind';
net.divideParam.trainInd = train_indexes_map;
net.divideParam.valInd = [];
net.divideParam.testInd = test_indexes_map;

fg_x_net = train(net, fg_x, ground_truth);

end

