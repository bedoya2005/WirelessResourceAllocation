%% Juan Carlos Bedoya Ceballos and Dr. Ahmed Abdelhadi
%
%	SIMULATIONS
%
%
%   Created by: Juan Carlos Bedoya 
%   Ph.D. Student. ECE VirginiaTech
%   April 11th, 2018
function [x1,x2,x3,x4,x5,x6,x7]=F01CreateLogUtility(k,rmax,r,p)

    U{1,1}=log(1+k*r)/log(1+k*rmax);   			% U{:,1} are the utility functions.
    U{1,2}=log(U{1,1});                         % U{:,2} are the logaritm of utility functions.
    U{1,3}=diff(U{1,2},r)-p;                    % U{:,3} are the derivate of logaritm of utility functions
    U{1,4}=diff(U{1,3},r);                      % U{:,4} are the second derivate of logaritm of utility functions
    U{1,5}=matlabFunction(U{1,3});              % U{:,5} are the derivate of logaritm of utility stored as a Matlab @function.
    U{1,6}=matlabFunction(U{1,4});              % U{:,6} are the second derivate of logaritm of utility stored as a Matlab @function. 
    U{1,7}=2;                                   % Type of Utility. 1: Sigmoidal      2: Logaritmic
    
    x1=U{1,1};x2=U{1,2};x3=U{1,3};x4=U{1,4};x5=U{1,5};x6=U{1,6};x7=U{1,7};