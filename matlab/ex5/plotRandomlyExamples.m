%use lambda=3 to compute test set error

% Load from ex5data1: 
% You will have X, y, Xval, yval, Xtest, ytest in your environment
load ('ex5data1.mat');

% m = Number of examples
m = size(X, 1);

%----featureNormalize
p = 8;

% Map X onto Polynomial Features and Normalize
X_poly = polyFeatures(X, p);
[X_poly, mu, sigma] = featureNormalize(X_poly);  % Normalize
X_poly = [ones(m, 1), X_poly];                   % Add Ones

% Map X_poly_test and normalize (using mu and sigma)
X_poly_test = polyFeatures(Xtest, p);
X_poly_test = bsxfun(@minus, X_poly_test, mu);
X_poly_test = bsxfun(@rdivide, X_poly_test, sigma);
X_poly_test = [ones(size(X_poly_test, 1), 1), X_poly_test];         % Add Ones

% Map X_poly_val and normalize (using mu and sigma)
X_poly_val = polyFeatures(Xval, p);
X_poly_val = bsxfun(@minus, X_poly_val, mu);
X_poly_val = bsxfun(@rdivide, X_poly_val, sigma);
X_poly_val = [ones(size(X_poly_val, 1), 1), X_poly_val];           % Add Ones

%-----randomly select i examples, i =1:12
lambda=0.01;
m=size(X,1);
error_train = zeros(m, 1);
error_val = zeros(m, 1);
for i = 1:m
  fprintf('randomly select %d examples---\n',i)
  
  error_train_m = zeros(50,1);
  error_val_m = zeros(50,1); 
  
  for j=1:50
  indexs=randperm(m);
  selX = X_poly(indexs(1:i),:);
  sely = y(indexs(1:i),:);
  selXVal = X_poly_val(indexs(1:i),:);
  selyVal = yval(indexs(1:i),:);
  
  %---get theta
  [theta] = trainLinearReg(selX,sely,lambda);
  %----Compute errors
  error_train_m(j) = linearRegCostFunction(selX, sely, theta, 0);
  error_val_m(j) = linearRegCostFunction(selXVal,selyVal,theta,0);
  end
  
%  fprintf('jth\t\tTrain Error\tValidation Error\n');
%  for j = 1:50
%    fprintf(' %d\t%f\t%f\n', ...
%              j, error_train_m(j), error_val_m(j));
%  end
  
  
  error_train(i) = (1/50)*sum(error_train_m);
  error_val(i) = (1/50)*sum(error_val_m);
 
end

fprintf('------------------------------------\n');
fprintf('Ith\t\tTrain Error\tValidation Error\n');
for i = 1:m
  fprintf(' %f\t%f\t%f\n', ...
            i, error_train(i), error_val(i));
end

pause;

close all;
plot(1:m, error_train, 1:m, error_val);
legend('Train', 'Cross Validation');
xlabel('number of training examples');
ylabel('Error');