%djvalue.m
%computes the numeric value for the gradient of the objective function J 
function djval = djvalue(A)

syms u0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 u17 u18 u19;
U = [u0,u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u13,u14,u15,u16,u17,u18,u19];

dt = 1/20;
p0(1)= dt*(-.3*1+.65*0+U(1))+1; %first iteration/ p0,1
p1(1)= dt*(-.65*0+.3*1-U(1))+0; %p1,1
for i = 2:20
p0(i) = dt*(-.3*p0(i-1)+.65*p1(i-1)+U(i))+p0(i-1); %p0,2 ... p0,20
p1(i) = dt*(-.65*p1(i-1)+.3*p0(i-1)-U(i))+p1(i-1); %p1,2 ... p1,20
end

J = sqrt((p0(20)-.85)^2)^2 +sqrt((p1(20)-.15)^2)^2+symnorm(U)^2;


djval = gradient(J,U);
djval = subs(djval, U, A);


