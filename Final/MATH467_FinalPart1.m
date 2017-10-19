%MATH 467 Final Project Part 1
%Analytical Solution
clear all


%% Original (2D)

% a = 5;
% b = 4.855;
% 
% 
% Q = eye(200);
% 
% %Assemble A in parts
% A_left = eye(100);
% for i = 1:99
%     A_left(i+1,i) = -a;
% end
% A_right = eye(100)*-b;
% A = horzcat(A_left,A_right);
%  
% B = zeros(100,1);
% B(1) = a;
% 
% %Z_star
% Z_star = (Q^-1)*A'*((A*(Q^-1)*A')^-1)*B;
% 
% 
% ones = [1:100];
% X_1 = Z_star(1:100);
% Y_1 = 1-X_1;
% plot(ones,X_1,ones,Y_1)

%% 2D w/ transform

a = .91347;
b = .04793;


Q = eye(200);

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


ones = [1:100];
Z_1 = Z_star(1:100);
X_1 = Z_1 +.85;
Y_1 = 1-X_1;
plot(ones,X_1,ones,Y_1)

U_1 = Z_star(101:end);

finaljvalue(U_1)



%% 3D Version 1.0

% a = .9841;
% b = .03295;
% c = .04756;
% 
% Q = eye(300);
% 
% % Assemble A in parts
% A_left = eye(100);
% A_mid = zeros(100,100);
% A_right = eye(100)*-c;
% for i = 1:99
%     A_left(i+1,i) = -a;
%     A_mid(i+1,i) = -b;
% end
% A = horzcat(A_left,A_mid,A_right);
% 
% B = zeros(100,1);
% B(1) = a;
% 
% Z_star = (Q^-1)*A'*((A*(Q^-1)*A')^-1)*B;
% 
% ones = [1:100];
% X_1 = Z_star(1:100);
% Y_1 = Z_star(101:200);
% plot(ones,X_1,ones,Y_1)

%% 3D Version 2.0 w/ transform

% a= 130.1697;
% b = -126.98412;
% c = 38.8177;
% d = -43.5359;
% e = -4.3788;
% 
% 
% Q = eye(300);
% 
% % Assemble A in parts
% %A_top
% A_topleft = eye(100)*a;
% for i = 1:99
%     A_topleft(i+1,i) = b;
% end
% A_topmid = eye(100)*c;
% for i = 1:99
%     A_topmid(i+1,i) = d;
% end
% A_topright = eye(100)*e;
% A_top = horzcat(A_topleft,A_topmid,A_topright);
% %A_bot
% % A_botleft = ;
% % A_botmid = ;
% % A_botright = ;
% % A_bot = horzcat(A_botleft,A_botmid,A_botright);
% 
% A_bot = A_top;
% 
% A = vertcat(A_top,A_bot);
% 
% 
% 
% B = zeros(200,1);
% B(1) = -b*.15;
% 
% 
% %Solve
% Z_star = (Q^-1)*A'*((A*(Q^-1)*A')^-1)*B;
% 
% 
% ones = [1:100];
% Z_1 = Z_star(1:100);
% W_1 = Z_star(101:200);
% X_1 = Z_1 +.85;
% Y_1 = W_1 +.15;
% 
% U_star = Z_star(201:end);
% 
% 
% 
% plot(ones,X_1,ones,Y_1)
% 
% finaljvalue(U_star)
% 


