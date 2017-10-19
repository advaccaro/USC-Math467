%% MATH 467 FINAL PROJECT
% math467final.m
%
%this script calls on function symnorm.m
addpath(genpath('/Users/adam/Dropbox/School/Fall 2013/MATH467'))
%% Inputs (could rewrite as function if desired)
% u_in = zeros(20,1);
% H_in = eye(20,20);
% nsteps = 3;

%% Initialize
dt = 1/20; %time-step size

syms u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 u17 u18 u19 u20...
    u21 u22 u23 u24 u25 u26 u27 u28 u29 u30 u31 u32 u33 u34 u35 u36 u37 u38...
    u39 u40 u41 u42 u43 u44 u45 u46 u47 u48 u49 u50 u51 u52 u53 u54 u55 u56...
    u57 u58 u59 u60 u61 u62 u63 u64 u65 u66 u67 u68 u69 u70 u71 u72 u73 u74...
    u75 u76 u77 u78 u79 u80 u81 u82 u83 u84 u85 u86 u87 u88 u89 u90 u91 u92...
    u93 u94 u95 u96 u97 u98 u99 u100;
U = [u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u13,u14,u15,u16,u17,u18,u19,...
    u20, u21, u22, u23, u24, u25, u26, u27, u28, u29, u30, u31, u32, u33, u34,...
    u35, u36, u37, u38, u39, u40, u41, u42, u43, u44, u45, u46, u47, u48, u49,...
    u50, u51, u52, u53, u54, u55, u56, u57, u58, u59, u60, u61, u62, u63, u64,...
    u65, u66, u67, u68, u69, u70, u71, u72, u73, u74, u75, u76, u77, u78, u79,...
    u80, u81, u82, u83, u84, u85, u86, u87, u88, u89, u90, u91, u92, u93, u94,...
    u95, u96, u97, u98, u99, u100];

%% solving for P0 and P1 (Euler's backwards method)
A = [-.3, .65; -.65, .3]; B = [1; -1];

P(1).P = [1; 0];
for i = 2:101
    P(i).P = (eye(2,2)-dt*A)^(-1)*(P(i-1).P + dt*B*U(i-1));
end



%%rewrite in quadratic linear form (zQz and A_prime*z = b, construct A_prime and b)
Q = eye(200,200);

%construct b
b = zeros(200,1);
b(1) = 20; %b(101) = -.65;

% %construct A_prime
a1 = 20.3*eye(100,100);
for i = 1:99
    a1(i+1,i) = -20;
end
a1(1,1) = 1;
a2 = -.65*eye(100,100);
a2(1,1) = 0;
a3 = -1*eye(100,100);
% a4 = horzcat(a1,a2,a3);
a5 = 19.7*eye(100,100);
a5(1,1) = 0;
for i = 1:99
    a5(i+1,i) = -20;
end
a6 = .65*eye(100,100);
a6(1,1) = 1;
% a5 = .65*eye(100,100);
% a5(1,1) = 0;
% a6 = 19.7*eye(100,100);
% for i = 1:99
a6(i+1,i) = -20;
% end
% a6(1,1) = 1;


a7 = eye(100,100);
% a8 = horzcat(a5,a6,a7);
a4 = horzcat(a1,a2,a3);
a8 = horzcat(a6,a5,a7);
A_prime = vertcat(a4,a8);
% A_prime = A_prime';
% a1 = 19.65 * eye(100,100);
% for i = 1:99
%     a1(i+1,i) = -20;
% end
% %a1(1,1) = 1;
% a2 = -2*eye(100,100);
% a3 = horzcat(a1,a2);
% a4 = -20.35*eye(100,100);
% %a4(1,1) = 0;
% for i = 1:99
%     a4(i+1,i) = -20;
% end
% a5 = -2*eye(100,100);
% a6 = horzcat(a4,a5);
% %A_prime = vertcat(a3,a6);
% %A_prime = A_prime';
% A_prime = horzcat(a1,a4,a5);


%% solve for z*
z_star = (Q^-1)*A_prime.'*((A_prime*(Q^-1)*A_prime.')^-1)*b;
z_star = A_prime.'*((A_prime*A_prime.')^1)*b;

%see jvalue.m to evaluate J of U

%see djvalue.m to evaluate dJ of U
%% rewrite J as quadratic function (solve for Q)

Q = jacobian(jacobian(J,U),U);
if isequal(Q,Q.') == 0
    error('Q not symmetric')
end


%form Lagrangian function

%% Lagrangian algorithm


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





