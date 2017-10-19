%MATH467 FINAL PROJECT
% ADAM VACCARO
%this script calls on functions: fjvalue.m, gradjval.m, Hval.m, dHval.m
%addpath(genpath('/Users/adam/Dropbox/School/Fall 2013/'))

addpath(genpath('/home/geovault-02/avaccaro/MATH467/'))

%% PART 1 - ANALYTICAL SOLUTION

% 2D w/ transform

a = .97561;
b = .04878;
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


steps = [1:100];
Z_1 = Z_star(1:100);
X_1 = Z_1 +.85;
Y_1 = 1-X_1;

fig('Math467 Final Project'); clf
subplot(2,1,1);
plot(steps,X_1,'r',steps,Y_1,'b')
fancyplot_deco('Probabilities P0 and P1 (analytical)','Time (steps)','')
%hepta_figprint('M434_FinalProject_ANprobs.eps')

U_1 = Z_star(101:end); %u*

%fig(2); clf;
subplot(2,1,2);
plot(steps,U_1)
fancyplot_deco('Control input u (analytical)','Time (steps)','')
%hepta_figprint('M434_FinalProject_ANu.eps')
hepta_figprint('M434_FinalProject_AN.eps')
fjvalue(Z_star) %=0.4335

%% PART 2 - ALGORITHMIC SOLUTION - Lagrangian algorithm

%Initialize (Inputs/Step 0)
%nsteps = 6; %number of algorithm steps
% U_in = .01*ones(200,1);
% Y_in = .01*ones(200,1);
%Z_in = .01*ones(200,1);
%Z_in = Z_star-.1*ones(200,1);
Z_in = Z_star;
%Z_in = .01*ones(200,1);
%Z_in = zeros(200,1);

%Z_in = Z_in(:);
%L_in = .01*ones(100,1);
%L_in = L_in(:);
%L_in = .01*ones(100,1);
L_in = zeros(100,1);
stepmax = 2000;
nsteps =2 ;
stagtol = .05;

S(1).alpha = -.0006; %initial alpha
S(1).beta = -.0003; %initial beta

S(1).Z = Z_in; %initial Z
S(1).L = L_in; %initial lambda





%Algorithm Loop
for k = 2:stepmax
%S(k).U = S(k-1).U - S(k-1).alpha*gradjval(S(k-1).U) + A'*S(k-1).Y;
%S(k).Y = S(k-1).Y + S(k-1).beta*Hval(S(k-1).U);
%S(k).U = S(k-1).U - S(k-1).alpha*gradjval(S(k-1).U) + dHval(S(k-1).U)'*S(k-1).Y;
%S(k).Y = S(k-1).Y + S(k-1).beta*Hval(S(k-1).U);


S(k).Z = S(k-1).Z - S(k-1).alpha*gradfval(S(k-1).Z) + dHval(S(k-1).Z)'*S(k-1).L;
S(k).L = S(k-1).L +S(k-1).beta*Hval(S(k-1).Z);




%Check Lagrangian condition

S(k).lagcheck1 = dfval(S(k).Z) + S(k).L'*dHval(S(k).Z);
S(k).lagcheck2 = double(norm(S(k).lagcheck1));

S(k).alpha = .5*S(k-1).alpha;
S(k).beta = .5*S(k-1).beta;

if S(k).lagcheck2 > stagtol & nsteps < stepmax
    display(['S(' num2str(k) ').U does not satisfy the Lagrangian condition'])
    display(['J = ' num2str(fval(S(k).Z))]);
    nsteps = nsteps+1;
elseif S(k).lagcheck2 <= stagtol
    display(['S(' num2str(k) ').U satisfies the Lagrangian condition'])
    display(['J = ' num2str(fval(S(k).Z))]);
     
    X_alg = S(k).Z(1:100); P0_alg = X_alg + .85; P1_alg = 1 - P0_alg;
    fig('Algorithmic solution'); clf;
    subplot(2,1,1);
    plot(steps,P0_alg,'r',steps,P1_alg,'b')
    fancyplot_deco('Probabilities P0 and P1 (algorithmic)','Time (steps)','')
    %hepta_figprint('M434_FinalProject_ANprobs.eps')

    U_alg = S(k).Z(101:end);
    %fig(2); clf;
    subplot(2,1,2);
    plot(steps,U_alg)
    fancyplot_deco('Control input u (algorithmic)','Time (steps)','')
    %hepta_figprint('M434_FinalProject_ANu.eps')
    hepta_figprint('M434_FinalProject_ALG.eps')
end     
end
     % if lagcheck > .0005 & nsteps < nmax
%     display(['S(' num2str(k) ').U does not satisfy the Lagrangian condition'])
%     display(['J = ' num2str(jval(S(k).U))]);
%     nsteps = nsteps+1;
% elseif 
%     display(['S(' num2str(k) ').U does not satisfy the Lagrangian condition'])
%     display(['J = ' num2str(jval(S(k).U))]);
% end


%Change alpha,beta?

