function [] = plot_outputs(outputs, data_set)
    close all
    hold on;
    fig = figure(1);  
    plot(data_set(2,:), data_set(1,:), data_set(2,:), outputs(1,:),'r*');
    legend('ground truth', 'estimated count')
    xlabel('number of foreground pixels')
    ylabel('number of people')

    
    hold on;
    fig = figure(2);  
    plot(data_set(4,:), data_set(3,:), data_set(4,:), outputs(2,:),'r*');
    legend('ground truth', 'estimated count')
    xlabel('number of foreground pixels after closing with 4r SE')
    ylabel('number of people')

    
    hold on;
    fig = figure(3);  
    plot(data_set(6,:), data_set(5,:), data_set(6,:), outputs(3,:),'r*');
    legend('ground truth', 'estimated count')
    xlabel('number of foreground pixels after closing with 5r SE')
    ylabel('number of people')
    
    hold on;
    fig = figure(4);  
    plot(data_set(8,:), data_set(7,:), data_set(8,:), outputs(4,:),'r*');
    legend('ground truth', 'estimated count')
    xlabel('number of foreground pixels after closing with 4r SE')
    ylabel('number of people')

end

