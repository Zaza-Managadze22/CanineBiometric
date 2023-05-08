plot(train_target(1,:), 'blue'), hold on;
plot(test_target(1,:), 'red'), hold on;
plot(train_others(1,:), "Color", [0, 153, 82]/255);
xlabel("MFCC feature index");
ylabel("MFCC feature value");
legend("Target 1", "Target 2", "Non-target");
set(gca, 'FontSize', 12);