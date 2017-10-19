%jvalue.m
function [jval, p0_fin, p1_fin,p0,p1] = jvalue(U)
%computes the numeric value of the objective function J
%% solving for p0,20 and p1,20
dt = 1/20;
p0(1)= dt*(-.3*1+.65*0+U(1))+1; %first iteration/ p0,1
p1(1)= dt*(-.65*0+.3*1-U(1))+0; %p1,1
for i = 2:20
p0(i) = dt*(-.3*p0(i-1)+.65*p1(i-1)+U(i))+p0(i-1); %p0,2 ... p0,20
p1(i) = dt*(-.65*p1(i-1)+.3*p0(i-1)-U(i))+p1(i-1); %p1,2 ... p1,20
end
p0_fin = p0(20);
p1_fin = p1(20);
%% rewrite J as function of U
jval = (abs(p0_fin-.85)^2+abs(p1_fin-.15)^2+norm(U)^2);
