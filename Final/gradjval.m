%gradjval.m
%MATH467 Final Project
%Computes the numeric value of the gradient of J(U)
function grjval = gradjval(U_0)

%% Initialize

a = .97561;
b = .04878;
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
syms x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20...
    x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 x32 x33 x34 x35 x36 x37 x38...
    x39 x40 x41 x42 x43 x44 x45 x46 x47 x48 x49 x50 x51 x52 x53 x54 u55 u56...
    u57 u58 u59 u60 u61 u62 u63 u64 u65 u66 u67 u68 u69 u70 u71 u72 u73 u74...
    u75 u76 u77 u78 u79 u80 u81 u82 u83 u84 u85 u86 u87 u88 u89 u90 u91 u92...
    u93 u94 u95 u96 u97 u98 u99 u100
U = U(:);

%% Write J as a function of U

%first, solve for Z(U)
Z(1) = a*(.15)+b*U(1);
for i = 2:100
    Z(i) = a*Z(i-1)+b*U(i);
end

%now, write J(U)
for i = 1:100
    tmpJ(i) = (4*Z(i)^2+2*U(i)^2);
end

J_U = (.5)*sum(tmpJ); %J(U)

%% grad J
grjval_s = gradient(J_U,U);

grjval = subs(grjval_s, U, U_0);



