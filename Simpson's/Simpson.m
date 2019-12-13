function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
minx = min(x); % defines the min of x
maxx = max(x); % defines the max of x
h = length(x); % defines the length of x

errorcheck % nested function below gives us the errorchecking

if mod(h,2) == 1 %Determines we use simpson's
    workvar = ones(1,h); % creates an array of 1's the length of x
    workvar(2:2:end-1) = 4; 
    workvar(3:2:end-2) = 2; % These two lines determine the working variable "spots" for simpon's
    maxx = x(3); %redefines maxx
    I = ((maxx-minx)/6)*(workvar*y'); %calculates

else
    workvar = ones(1,h-1); %same as above
    workvar(2:2:end-1) = 4;
    workvar(3:2:end-2) = 2; % same as above
    maxx = x(2);
   I  = ((maxx-minx) - (y(1)+(y(end)/2)*(x(2)-(1)))); %Trap rule
    warning('Last interval used the trapezoidal rule for accuracy')
end

    function errorcheck; %error checking for dimensions and linearity
        if length(x) ~= length(y) % Dimensional check
            error('Length of X must be the same as the length of Y')
        end
        if sum(x == linspace(minx,maxx,h)) ~= h %Linearity check
            error('Date must be linearly spaced.')
        end
    end

    
end