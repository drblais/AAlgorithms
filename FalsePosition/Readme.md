# False Position Algorithm  
Finds the root of a function using false position.  
Last Modified Date: 10/5/19   
This function, when supplied appropriate and realistic inputs, will determine  
the root of a function between two user input bounds. It's always a good  
idea to plot your function in order to visually estimate your initial  
bound guesses. This will also help keep your iterations down if you keep  
maxxing out to maxit.  
### INPUTs:  
func : function you're finding the root of  
xlower : lower bound  
xupper : upper bound  
es : error estimate (default is 1E-4) this is a terminal variable (sets a  
loop termination paramteter)  
maxit : max iterations allowed (default is 200) also a terminal variable.  
### OUTPUTs:  
root : most accurate x value near root approximated, or analytical root  
fx : the function value evaluated at the approximation  
errapp : the relative approximate percent error   
iter : the number of iterations it took to find the root or terminate.  
