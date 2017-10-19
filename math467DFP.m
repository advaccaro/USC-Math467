%% MATH 467 MIDTERM PROJECT, PROBLEM 2
% math467DFP.m
% DFP ALGORITHM
%this script calls on functions symnorm.m, jvalue.m, and djvalue.m
addpath(genpath('/Users/adam/Dropbox/School/Fall 2013/MATH467'))
%% Inputs (could rewrite as function if desired)
u_in = (1000)*ones(20,1);
H_in = eye(20,20);
nsteps = 3;

%% Initialize
%t = [0:1:20]; %time-steps
dt = 1/20; %time-step size

syms u0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 u17 u18 u19;
U = [u0,u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u13,u14,u15,u16,u17,u18,u19];

%% solving for p0,20 and p1,20
p0(1)= dt*(-.3*1+.65*0+U(1))+1; %first iteration/ p0,1
p1(1)= dt*(-.65*0+.3*1-U(1))+0; %p1,1
for i = 2:20
    p0(i) = dt*(-.3*p0(i-1)+.65*p1(i-1)+U(i))+p0(i-1); %p0,2 ... p0,20
    p1(i) = dt*(-.65*p1(i-1)+.3*p0(i-1)-U(i))+p1(i-1); %p1,2 ... p1,20
end
p0_f = p0(20); %p0,20
p1_f = p1(20); %p1,20

%% rewrite J as function of U 
K = (abs(p0(20)-.85)^2+abs(p1(20)-.15)^2+symnorm(U)^2); %K is the doubles version of J (not actually used in script)

%get rid of abs for sym functionality
J = sqrt((p0(20)-.85)^2)^2 +sqrt((p1(20)-.15)^2)^2+symnorm(U)^2;

%see jvalue.m to evaluate J of U

%see djvalue.m to evaluate dJ of U
%% rewrite J as quadratic function (solve for Q)

Q = jacobian(jacobian(J,U),U);
if isequal(Q,Q.') == 0
    error('Q not symmetric')
end



%% DFP Algorithm
%Initial parameters
S(1).U = u_in;
S(1).H = H_in;

%algorithm loop
for k = 1:nsteps
    S(k).g = djvalue(S(k).U);
    
    if  isequal(S(k).g, zeros(length(S(k).g))) == 1
        error('g=0 at step %d', k)
        
    else
        S(k).d = -1*S(k).H *S(k).g; %search direction, d0
    end
    
    %solve for alpha:
    S(k).alpha = (-S(k).g.'*S(k).d)/(S(k).d.'*Q*S(k).d);
    S(k).alpha = eval(S(k).alpha); 
    
    %next U
    S(k+1).U = S(k).U + S(k).alpha*S(k).d;
    
    %del U
    S(k).delU = S(k).alpha*S(k).d;
    
    
    %next g
    S(k+1).g = djvalue(S(k+1).U);
    
    %del g
    S(k).delg = S(k+1).g - S(k).g;
    
    %next H
    S(k+1).H = S(k).H + S(k).delU*S(k).delU.'/(S(k).delU*S(k).delg.') - ((S(k).H*S(k).delg)*(S(k).H*S(k).delg).')/(S(k).delg.'*S(k).H*S(k).delg);
end





