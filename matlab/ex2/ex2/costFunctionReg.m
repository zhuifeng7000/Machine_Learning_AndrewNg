function [J, grad] = costFunctionReg(theta, X, y, lambda)
%zhao zhiguang 2018.4.29

%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

h = sigmoid(X*theta);

%m
%J1 = (1/m).*sum((-y).*log(h)-(1-y).*log(1-h))
%J2 = (lambda/(2*m)).*sum(theta(2:end).*theta(2:end))

J = (1/m).*sum((-y).*log(h)-(1-y).*log(1-h)) + (lambda/(2*m)).*sum(theta(2:end).*theta(2:end));

%J = ((-y)'*log(h)-(1-y)'*log(1-h))/m + (lambda/(2*m)).*theta(2:end)'*theta(2:end)

T = theta;
T(1,1)=0;

grad = (X'*(h-y))/m+(lambda/m).*T;



% =============================================================

end
