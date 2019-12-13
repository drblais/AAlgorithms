function [L, U, P] = luFactor(A)

% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix

[m,n] = size(A); % First we need to initialize the matrix dimensions
if m ~= n %This will leave an error message if the matrix dimensions are not square (2x3, 3x4 etc.)
    error('Your matrix dimensions must be square. Please enter a square matrix (2x2, 3x3, etc.)')
end

%Lets initialize our identity matrices.
L = eye(n); 
P = eye(n);
ELEM = 1; %Initialized inparent func so it can be used in the nested func.
U = A; %Since U isn't built off an identity matrix, we assign it as A. U is our 'working' matrix.

%Lets start this off with a loop that will go through each row. This allows
%us to work a row at a time and pivot/eliminate as needed.
%i is the parent loop iterator for the system. k is the nested loop iterators for pivot and gaussian elimination.
for i = 1:m-1
    wepivot; %Here I use a nested function below to handle the conditions of when and how to pivot
    U([i,ELEM], i:m) = U([ELEM,i],i:m); %This pivots U 
    L([i,ELEM],1:i-1) = L([ELEM,i],1:i-1); %Reassigning L after the pivot
    P([i,ELEM],:) = P([ELEM,i],:); %Reassigns P after the pivot.
    gaussel; %Gaussian elimination handled by a nested function below.
end


    function wepivot %nested pivot function
            pivot = max(abs(U(i:m,i))); % First we initialize the pivot.
            for k = i:m
                if abs(U(k,i)) == pivot %If this condition is met, then the element is prepared to pivot.
                    ELEM = k; %Assigns our pivot element based off of the highest value in the column from above line.
                    return;
                end
            end
    end
    function gaussel %nested gaussian elmimination function
          for k = i+1:m %This keeps us in line with the "next" row.
        L(k,i) = U(k,i)/U(i,i) ; %This does the elimination for L
        U(k,i:m) = U(k,i:m) - L(k,i)*U(i,i:m); %This does the elimination for U.
          end
    end
end