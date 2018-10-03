%% Juan Carlos Bedoya Ceballos and Dr. Ahmed Abdelhadi
%
%	SIMULATIONS
%
%
%   Created by: Juan Carlos Bedoya 
%   Ph.D. Student. ECE VirginiaTech
%   April 11th, 2018
%
%   Funtion to solve the Non-linear equation, by means of the
%   Newton-Raphson method.
%
%   The function [x,it,delta]=F01_SolveByNR(F,dF,x0,tolerance,max_it)
%
%   Inputs:
%       F: Function defined in the shape F=@(x,p)(function of x, p: price)
%       dF: Derivate of F, defined in the shape dF=@(x)(function of x)
%       tolerance: The minimum convergence criteria
%       max_it: Maximum number of iterations allowed in the solution
%
%   Outputs:
%       x: Solution of the equation
%       it: Number ot iterations
%       delta: final value of the eqation solution.
%
%


function [x,it,delta]=F01SolveByNR(F,dF,price,x0,tolerance,max_it) 
    it=1;
    delta=1;
    x=x0;
    while (it<=max_it) && (abs(delta)>tolerance)
        dx=F(price,x)/dF(x);
        x=max(0,x-max(-1,min(1,dx)));
        
        delta=F(price,x);
        it=it+1;
    end
