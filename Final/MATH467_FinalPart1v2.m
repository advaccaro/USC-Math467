%MATH 467 FINAL PROJECT PART 1 (v2.0)
%Analytical Solution
clear all

%% 2D w/ transform

a = .91347;
b = .04793;
q = 4;
r = 2;


Q = zeros(200,200);
[Q(1:100,1:100)] = q*eye(100);
[Q(101:200,101:200)] = r*eye(100);

%Assemble A in parts
A_left = eye(100);
for i = 1:99
    A_left(i+1,i) = -a;
end
A_right = eye(100)*-b;
A = horzcat(A_left,A_right);

B = zeros(100,1);
B(1) = a*.15;

%Z_star
Z_star = (Q^-1)*A'*((A*(Q^-1)*A')^-1)*B;


digits = [1:100];
Z_1 = Z_star(1:100);
X_1 = Z_1 +.85;
Y_1 = 1-X_1;
plot(digits,X_1,digits,Y_1)

U_1 = Z_star(101:end);

fjvalue(Z_star) %=0.1973
