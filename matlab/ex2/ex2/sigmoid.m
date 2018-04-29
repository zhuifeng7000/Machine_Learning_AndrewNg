function g = sigmoid(z)
%zhao zhiguang 2018.4.29%zhao zhiguang 2018.4.29
  
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

g = 1./(1+e.^(-z));




% =============================================================

end
