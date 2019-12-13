function [root, fx, errapp, iter] = falsePosition(func, xlower, xupper, es, maxit, varargin);
%Created On: 10/5/19
%Created By: Drew Blais
%Last Modified Date: 10/5/19 THIS IS V1.0
%This function, when supplied appropriate and realistic inputs, will determine
%the root of a function between two user input bounds. It's always a good
%idea to plot your function in order to visually estimate your initial
%bound guesses. This will also help keep your iterations down if you keep
%maxxing out to maxit.
%INPUTs:
%func : function you're finding the root of
%xlower : lower bound
%xupper : upper bound
%es : error estimate (default is 1E-4) this is a terminal variable (sets a
%loop termination paramteter)
%maxit : max iterations allowed (default is 200) also a terminal variable.
%OUTPUTs:
%root : most accurate x value near root approximated, or analytical root
%fx : the function value evaluated at the approximation
%errapp : the relative approximate percent error 
%iter : the number of iterations it took to find the root or terminate.

%Defining these for MatlabGrader's set vars (I don't like variables that
%aren't descriptive and I want to use this later?)
xlower = xl;
xupper = xu;
%First we need to start off with all of our errors:
if nargin < 3 || nargin > 5; % Too many or too little arguments in.
    error('Not enough or too many variables provied. Use: falseposition(fxn,lower bound,upper bound, error est, max iterations');
elseif nargin < 4; % user only provided the function and bounds
    es = 1E-4;
    maxit = 200;
elseif nargin < 5 % user porovided the function, bounds, and error est
    maxit = 200;
end
% Now we need to test for a sign change and provide error if no change.
signtest = func(xlower)*func(xupper); 
if signtest > 0;
    error('There is no sign change in between the bounds. Try plotting your function to estimate a better bound.');
end
% Initialize vars : iterations, initial approx, initial error approx
iter = 0; xapp = xlower ; errapp = 100; 
%Start the loop
while iter < maxit;
    xlastapp = xapp; %Save the last approx to do the error approximation later
    xapp = xupper - ((func(xupper)*(xlower - xupper)/(func(xlower)-func(xupper)))); %Find new Approx
    iter = iter + 1; % Iteration counter
    %Find error approximation
    if xapp ~= 0
        errapp = abs((xapp - xlastapp)/xapp)*100;
    end
    % Test to see where the new bounds should be
    boundtest = func(xlower)*func(xapp);
    if func(xapp) == 0; 
    % Since our approximation along the x axis intersects the function at our approximation, 
    % We have found the analytical answer.
        errapp = 0;
        break
    elseif boundtest < 0; % The func evaluated at our approx is positive so the new bound is :
        xupper = xapp; 
    else boundtest > 0; % The func evaluated at our approx is negative so the new bound is :
        xlower = xapp; 
    end
    if errapp <= es; % If this is true, then we have at met the minimum acceptable error as defined by used or default.
        break
    end
end
root = xapp;
fx = func(xapp);



    
        




