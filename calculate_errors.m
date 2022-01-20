function [avg_errors, accuracy_10_err] = calculate_errors(avg_test_outputs,test_gt)

test_gt = cell2mat(test_gt);
avg_errors = zeros(1,4);
accuracy_10_err = zeros(2,4);
for i=1:4
    err_10 = zeros(1,51);
    err_15 = zeros(1,51);

    error_10_count = 0;
    error_15_count = 0;
    test_net = avg_test_outputs(i, :);
    test_net
    error(i,:) = abs(test_gt - test_net) ./ test_gt .* 100;
    avg_errors(1,i) = sum(error(i,:)) / length(test_gt);
    avg_errors(1,i);
    err_10 = abs(test_gt - test_net) >= (test_gt * 0.1);
    err_15 = abs(test_gt - test_net) >= (test_gt * 0.15);

    error_10_count = sum(err_10==1,'all');
    error_15_count = sum(err_15==1,'all');

    accuracy_10_err(1,i) = (length(test_gt) - error_10_count) .* 100 / length(test_gt);
    
    accuracy_10_err(2,i) = (length(test_gt) - error_15_count) .* 100 / length(test_gt);

end
end

