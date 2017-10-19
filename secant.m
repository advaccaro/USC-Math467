                    % ============= %
                    % SECANT METHOD %
                    % ============= %

% Find the roots of using Secant Method
% func --> function is taken by user
% like sin(x) or x^2 + x - 1 or any other but use the same format
% i.e. use paranthesis as used above with 'x' for sin, cos,... etc
% and spacing between '+' or '-' operation
% a --> Xn-1
% b --> Xn
% c --> Xn+1
% maxerr --> Maximum Error in Root


syms x;
    flag = 1;
    %func = input('Enter Function in terms of x: ');
    func = (1739064047282341688707270822694005*x^2)/21778071482940061661655974875633165533184 + 2*((1742517355223495638370117015784533922028752299738527385828691543027*x)/40564819207303340847894502572032000000000000000000000000000000000000000 - 255492661103038476242344904082493732475291664012063/5497558138880000000000000000000000000000000000000000)^2;
    %a = input('Ener Lower Limit: ');
    a = 0;
    %b = input('Ener Upper Limit: ');
    b = 10;
    %maxerr = input('Enter Maximum Error: ');
    maxerr = 10^-5;

    f = inline(func);
    
        c = (a*f(b) - b*f(a))/(f(b) - f(a));

        disp('   Xn-1      f(Xn-1)      Xn      f(Xn)      Xn+1      f(Xn+1)');
        disp([a f(a) b f(b) c f(c)]);

        while abs(f(c)) > maxerr
            a = b;
            b = c;
            c = (a*f(b) - b*f(a))/(f(b) - f(a));
            disp([a f(a) b f(b) c f(c)]);
            
            flag = flag + 1;
            
            if(flag == 100)
                break;
            end
        end
        
        display(['Root is x = ' num2str(c)]);


% ===================================== %
% PROGRAMMED BY SHEIKH MUKHTAR HUSSAIN  %
%       Feel Free to contact            %
%    mh_shiningstar@hotmail.com         %
% ===================================== %