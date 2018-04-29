
function [] = TestCostFunctionReg()

theta = [1;1;1];
lambda=4;
m=1;

T1 = (lambda/2*m).*theta(2:end)'*theta(2:end)

T2 = (lambda/2*m)*(theta(2:end)'*theta(2:end))

T3 =  (lambda/2*m)*sum(theta(2:end).*theta(2:end))
end