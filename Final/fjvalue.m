%fjvalue.m
%MATH467 Final Project
%computes the numeric value of the objective function: 
%J=(1/2)*sigma[4*(Zi)^2+2*(Ui)^2]
function [jval] = fjvalue(Z_star)

Z_1 = Z_star(1:100);
U_1 = Z_star(101:200);

temp = zeros(100,1);

for i = 1:100
    temp(i) = (4*Z_1(i)^2+2*U_1(i)^2);
end

jval = (.5)*sum(temp(1:100));