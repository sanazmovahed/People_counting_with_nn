function plot_errors(avg_test_outputs, test_gt)

test_gt = cell2mat(test_gt);

for i=1:4
    test_net = avg_test_outputs(i, :);
    error = abs(test_gt - test_net) ./ test_gt .* 100;
    hold on;
    fig = figure(i+8);  
    plot(error, 'r*');
    xlabel('sample sequence')
    ylabel('error %')
end
end