% Train the SVM model
svm_model = fitcsvm(X_train, y_train);

% Predict labels for the test data
y_pred = predict(svm_model, X_test);

% Evaluate the model's performance
accuracy = sum(y_pred == y_test) / length(y_test);
precision = sum(y_pred(y_test == 1) == 1) / sum(y_pred == 1);
recall = sum(y_pred(y_test == 1) == 1) / sum(y_test == 1);
f1_score = 2 * precision * recall / (precision + recall);

fprintf('Accuracy: %f\n', accuracy);
fprintf('Precision: %f\n', precision);
fprintf('Recall: %f\n', recall);
fprintf('F1-score: %f\n', f1_score);

% Display the confusion matrix
confusionchart(y_test, y_pred);