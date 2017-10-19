%MATH 467 Final Project Part 2
%Numerical solution
%Lagrangian Algorithm
addpath(genpath('/Users/adam/Dropbox/School/Fall 2013/MATH467'))


%% Inputs
U_in = zeros(100,1);
Y_in = zeros(100,1);
nsteps = 3;

%% Initialize

a = .91347;
b = 0.04793;
q = 4; 
r = 2;

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

%% Solve for constraints: h(U)
%first, solve for Z(U)
Z(1) = a*(.15)+b*U(1);
for i = 2:100
    Z(i) = a*Z(i-1)+b*U(i);
end

%now, write constraints as function of U: h(U)
h(1) = Z(1) - a*(.15)-b*U(1);
for i = 2:100
    h(i) = Z(i) -a*Z(i-1)-b*U(i);
end

%% Objective function J
for i = 1:100
    tmp(i) = (4*Z(i)^2+2*U(i)^2);
end
J = (.5)*sum(tmp); %J(U)


%% Lagrangian function L
%lambda
syms y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 y11 y12 y13 y14 y15 y16 y17 y18 y19 y20...
    y21 y22 y23 y24 y25 y26 y27 y28 y29 y30 y31 y32 y33 y34 y35 y36 y37 y38...
    y39 y40 y41 y42 y43 y44 y45 y46 y47 y48 y49 y50 y51 y52 y53 y54 y55 y56...
    y57 y58 y59 y60 y61 y62 y63 y64 y65 y66 y67 y68 y69 y70 y71 y72 y73 y74...
    y75 y76 y77 y78 y79 y80 y81 y82 y83 y84 y85 y86 y87 y88 y89 y90 y91 y92...
    y93 y94 y95 y96 y97 y98 y99 y100;

Y = [y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15, y16, y17, y18, y19, y20...  
    y21, y22, y23, y24, y25, y26, y27, y28, y29, y30, y31, y32, y33, y34, y35, y36, y37, y38...
    y39, y40, y41, y42, y43, y44, y45, y46, y47, y48, y49, y50, y51, y52, y53, y54, y55, y56...
    y57, y58, y59, y60, y61, y62, y63, y64, y65, y66, y67, y68, y69, y70, y71, y72, y73, y74...
    y75, y76, y77, y78, y79, y80, y81, y82, y83, y84, y85, y86, y87, y88, y89, y90, y91, y92...
    y93, y94, y95, y96, y97, y98, y99, y100];


L = J +Y'*Z; %L(U,Y)

%% Lagrangian Algorithm
%Initial parameters
S(1).U = U_in;
S(1).Y = Y_in;


%Algorithm loop
for k = 1:nsteps






    
   S(k+1).Y = S(k).Y + S(k).beta*h  
end