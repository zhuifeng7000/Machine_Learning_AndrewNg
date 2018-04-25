function J = computeCost(X, y, theta)
%--Zhao zhiguang 2018.4.21--  

%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0; 

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

h_y = X*theta-y;   %表示向量h-y
squre_h_y = h_y.^2;
T = sum(squre_h_y)/(2*m);
J=T;
%d=2; %significant-decimal
%D=10^d;
%T_D = T*D;
%J = round(T_D)/D;

% =========================================================================

end
