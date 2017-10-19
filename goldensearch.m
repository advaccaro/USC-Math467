%%initialize
p = (3-(5^(1/2)))/2;
a = zeros(5,1);
a(1) = 1;
fa = zeros(5,1);
ra = zeros(5,1);
ra(1) = 1;
b = zeros(5,1);
b(1) = 2;
fb = zeros(5,1);
rb = zeros(5,1);
rb(1) = 2;
%%iteration 1 (index starts at 2)
for i = 2
    a(i) = a(i-1) + p*(b(i-1)-a(i-1));
    b(i) = a(i-1) + (1-p)*(b(i-1)-a(i-1));
    fa(i) = f(a(i)); fb(i) = f(b(i));
    if fa(i) < fb(i)
        ra(i) = a(i-1); rb(i) = b(i);
        a(i+1) = a(i-1)+p*(b(i)-a(i-1)); b(i+1) = a(i);
        
    else
        ra(i) = a(i); rb(i) = b(i-1);
        a(i+1) = b(i); b(i+1) = a(i)+(1-p)*(b(i-1)-a(i));
    end
end

%% iteration 2
for i = 3
    fa(i) = f(a(i)); fb(i) = f(b(i));
    if fa(i) < fb(i)
        ra(i) = a(i-1); rb(i) = b(i);
        a(i+1) = a(i-1)+p*(b(i)-a(i-1)); b(i+1) = a(i);
        
    else
        ra(i) = a(i); rb(i) = b(i-1);
        a(i+1) = b(i); b(i+1) = a(i)+(1-p)*(b(i-1)-a(i));
    end
end

%% iteration 3
for i = 4
    fa(i) = f(a(i)); fb(i) = f(b(i));
   if fa(i) < fb(i)
        ra(i) = a(i-1); rb(i) = b(i);
        a(i+1) = a(i-1)+p*(b(i)-a(i-1)); b(i+1) = a(i);
        
    else
        ra(i) = a(i); rb(i) = b(i-1);
        a(i+1) = b(i); b(i+1) = a(i)+(1-p)*(b(i-1)-a(i));
    end
end
%% iteration 4
for i = 5
    fa(i) = f(a(i)); fb(i) = f(b(i));
    if fa(i) < fb(i)
        ra(i) = a(i-1); rb(i) = b(i);
        %a(i+1) = a(i-1)+p*(b(i)-a(i-1)); b(i+1) = a(i);
        
    else
        ra(i) = a(i); rb(i) = b(i-1);
        %a(i+1) = b(i); b(i+1) = a(i)+(1-p)*(b(i-1)-a(i));
    end
end
    

% %%iterations 2-4
% for i = 3:5
%     fa(i) = f(a(i)); fb(i) = f(b(i));
%     if fa(i) < fb(i)
%         ra(i) = ra(i-1); rb(i) = b(i);
%         a(i+1) = a(i-1); b(i+1) = b(i);
%     else
%         ra(i) = a(i); rb(i) = b(i-1);
%         a(i+1) = a(i); b(i+1) = b(i-1);
%     end
% end
%     
    

