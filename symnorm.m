%symnorm.m
%mimicks the norm function for symbolic objects
function n = symnorm(U)
    ne = length(U);
    for i = 1:ne
        empty(i) = U(i)^2;
    end
   n = sqrt(sum(empty));
