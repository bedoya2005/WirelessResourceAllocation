%% Juan Carlos Bedoya Ceballos and Dr. Ahmed Abdelhadi
%
%	SMALL-SCALE SIMULATIONS
%
%
%   Created by: Juan Carlos Bedoya 
%   Ph.D. Student. ECE VirginiaTech
%   April 11th, 2018
%

% Initializing Parameters
    clc;    
    clear all;    
    close all;
    rng(0);
    tolerance=1e-7;         % Toelrance for convergence of the algorithm
    max_it=1e7;             % Maximum number of iterations for NewtonRaphson or Solving Algorithm
    R=4000;                 % Maximum available Rate
    N_LogU=2;             	% Number of Logaritmit Utilities
    N_SigU=2;             	% Number of Sigmoidal Utilities 
    syms r p;

    
	%% Creating the Utility Functions
	% Creating "a" 
		a=[ 5 0.5 ];
	% Creating "b" 
		b=[ 10 20 ];
	% Creating "k" 
		k=[ 15 0.1 ];    
	% Creating "rmax" 
		rmax=[ 50 50 ];

	% Logarithmic Utility functions
    for i=1:N_LogU 
        [Ua{i,1},Ua{i,2},Ua{i,3},Ua{i,4},Ua{i,5},Ua{i,6},Ua{i,7}]=F01CreateLogUtility(k(i),rmax(i),r,p);
    end

	% Sigmoid Utility functions
    rmax(N_LogU+1:N_LogU+N_SigU)=max(rmax);
    a=[zeros(1,N_LogU) a];
    b=[zeros(1,N_LogU) b];
    for i=N_LogU+1:N_LogU+N_SigU
        [Ua{i,1},Ua{i,2},Ua{i,3},Ua{i,4},Ua{i,5},Ua{i,6},Ua{i,7}]=F02CreateSigUtility(a(i),b(i),r,p);
    end

    
	%% Plot of the Utility Functions
		nametitle='Problem J)  ';
		name=[nametitle ' ']; 
		F06PlotLogAndSig_TwoFigures(name,nametitle,r,k,a,b,N_LogU,N_SigU,rmax,Ua);
    
	%% Solving the Optimization Problem - Init of the Algorithm
		pini=.5;
		[ri_a,wi_a,pi_a,it_a,it_NR_a,MismatchNR_a]=F04SolvingOptimization(Ua,pini,N_LogU,N_SigU,b,R,tolerance,max_it);
    
	%% Plotting the Allocated rates vs Iterations for the two Sigmoid and two Logarithmic
		nametitle = 'Small-scale simulation';
		name=[nametitle ' Allocated rates vs Iterations   ']; 
		F07PlotRatesVsIterations(name,nametitle,ri_a,it_a,N_LogU,N_SigU,k,a,b,Ua);

	%% Plotting the Price vs Iterations 
		nametitle='Small-scale simulation';
		name=[nametitle ' Price vs Iterations  ']; 
		F08PlotPriceVsIterations(name,nametitle,pi_a,it_a,N_LogU,N_SigU);
