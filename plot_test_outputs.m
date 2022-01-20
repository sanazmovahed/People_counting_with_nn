function [] = plot_test_outputs(outputs, data_set)


fig = figure(5);
plot(data_set);
hold on;
plot(outputs(2,:),'r*');
legend('ground truth', 'estimated count')
xlabel('sample sequence with fg')
ylabel('number of people')


fig = figure(6);
plot(data_set);
hold on;
plot(outputs(3,:),'r*');
legend('ground truth', 'estimated count')
xlabel('sample sequence with closing 4r')
ylabel('number of people')


fig = figure(7);
plot(data_set);
hold on;
plot(outputs(1,:),'r*');
legend('ground truth', 'estimated count')
xlabel('sample sequence with closing 5r')
ylabel('number of people')

hold on;
fig = figure(8);
plot(data_set);
hold on;

plot(outputs(3,:),'r*');
legend('ground truth', 'estimated count')
xlabel('sample sequence with closing 4r erosed twice')
ylabel('number of people')

end

