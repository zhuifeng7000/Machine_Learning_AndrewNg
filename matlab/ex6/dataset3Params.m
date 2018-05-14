function [C, sigma] = dataset3Params(X, y, Xval, yval)
%zhao zhiguang ’‘÷«π„
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

CList = [0.01;0.03;0.1;0.3;1;3;10;30];
sigmaList = [0.01;0.03;0.1;0.3;1;3;10;30];

%set a matrix, 1st column = accuracy, 2nd = C, 3rd =sigma
rslt = zeros(size(CList,1)*size(sigmaList,1),3); 

k=1;
for i=1:size(CList,1)
  for j=1:size(sigmaList,1)
    rslt(k,:)=[0,CList(i),sigmaList(j)];
    k=k+1;
  end
end


%take every C and sigmal to train SVM, then get a model
%using the model to predict Xval
%compute accuracy of the predictions
for k=1:size(rslt,1)
  thec=rslt(k,2);
  thesigmal=rslt(k,3);
  model= svmTrain(X, y, thec, @(x1, x2) gaussianKernel(x1, x2, thesigmal));
  predictions = svmPredict(model,Xval);
  rslt(k,1) = mean(double(predictions==yval));
end


[maxvalue,maxindex] = max(rslt(:,1))



C = rslt(maxindex,2)
sigma = rslt(maxindex,3)

% =========================================================================

end
