%% MATH 467 MIDTERM PROJECT, PROBLEM 3
% BFGS ALGORITHM
format long
addpath(genpath('/Users/adam/Dropbox/School/Fall 2013/MATH467'))
%% Inputs (can rewrite this as a function if I want)
 u_in = zeros(20,1);
 H_in = eye(20,20);
 nsteps = 3;

%% Initialize
t = [0:1:20]; %time-steps
dt = 1/20; %time-step size
%p0 = zeros(length(t),1);
%p1 = zeros(length(t),0);
%p0(1) = 1; p1(1) = 0;
syms u0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 u17 u18 u19;
U = [u0,u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u13,u14,u15,u16,u17,u18,u19,];

%% solving for p0,20 and p1,20
p0(1)= dt*(-.3*1+.65*0+U(1))+1; %first iteration/ p0,1
p1(1)= dt*(-.65*0+.3*1-U(1))+0; %p1,1
for i = 2:20
p0(i) = dt*(-.3*p0(i-1)+.65*p1(i-1)+U(i))+p0(i-1); %p0,2 ... p0,20
p1(i) = dt*(-.65*p1(i-1)+.3*p0(i-1)-U(i))+p1(i-1); %p1,2 ... p1,20
end
p0_f = p0(20);
p1_f = p1(20);

%% rewrite J as function of U (calling this K for now, see below)
K = (abs(p0(20)-.85)^2+abs(p1(20)-.15)^2+symnorm(U)^2);

%get rid of abs
J = sqrt((p0(20)-.85)^2)^2 +sqrt((p1(20)-.15)^2)^2+symnorm(U)^2;

%see jvalue.m to evaluate J of U
 % once this step is done, will be ready to implement algorithm
 
% solve for gradient (as function of U)
% this step might not be necessary
dJ = gradient(J);
 
% write gradient as function of U
 %(doing it in other script, djvalue.m)
 
 %% rewrite J as quadratic function (solve for Q and B)
 
 Q_knot = .5*jacobian(jacobian(J,U),U); %assuming this is correct
 Q = .5 * (Q_knot + Q_knot.'); %assuming this is correct, COULD BE WRONG
 
 % gradient from quadratic
 %% DFP Algorithm
 %Known parameters
 %Step 0 (index 1) k=0
 %U_work(1,:) = u_in;
 S(1).U = u_in;
% H_initial = H_in; %must be real symmetric positive definite matrix
S(1).H = H_in;
 %g(1,:) = djvalue(U_work(1,:));
 for k = 1:nsteps
      S(k).g = djvalue(S(k).U);

if  isequal(S(k).g, zeros(length(S(k).g))) == 1
    %STOP- how to code this?
    error('end at step %d', k)
    
else
    S(k).d = -1*S(k).H *S(k).g; %search direction, d0
end

%solve for alpha: (secant search or rewrite J
S(k).alpha = (-S(k).g.'*S(k).d)/(S(k).d.'*Q*S(k).d);
S(k).alpha = eval(S(k).alpha); %not sure if this is actually necessary
 
%next U
S(k+1).U = S(k).U + S(k).alpha*S(k).d;
 
%del U
S(k).delU = S(k).alpha*S(k).d;
 %U_work(2,:) = U_work(1,:) +alpha(1)*d(1,:);
 %delU(1,:) = alpha(1)*d(1,:);
 
 %next g
%g(2,:) = djvalue(U_work(2,:));
S(k+1).g = djvalue(S(k+1).U);

%del g
 %delg(1,:) = g(2,:) - g(1,:);
 S(k).delg = S(k+1).g - S(k).g;
 
 %next H
 %H_new = H_initial + (delU(1,:)*delU(1,:).')/(delU(1,:)*delg(1,:).') - ((H_initial*delg(1,:).')*(H_initial*delg(1,:).').');
  S(k+1).H = S(k).H + S(k).delU*S(k).delU.'/(S(k).delU*S(k).delg.') - ((S(k).H*S(k).delg)*(S(k).H*S(k).delg).')/(S(k).delg.'*S(k).H*S(k).delg);
 end
 
 
 
 
     
