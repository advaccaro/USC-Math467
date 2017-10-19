%grad.m contains gradient
function y = Df(x)
y = [4*(x(1)-4)^3; 2*(x(2)-3); 16*(x(3)+5)^3];