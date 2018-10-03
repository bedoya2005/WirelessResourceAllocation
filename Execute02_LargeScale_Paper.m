%% Juan Carlos Bedoya Ceballos and Dr. Ahmed Abdelhadi
%
%	LARGE-SCALE SIMULATIONS
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
    max_it=1e4;             % Maximum number of iterations for NewtonRaphson or Solving Algorithm

    Nuser = [50 200 500 1000 3000 5000];	% Number of UEs for each scenario (A, B, C, D, E, and F)
    
    for Nuser_it = Nuser
        N_LogU=Nuser_it;            % Number of Logarithmic Utilities
        N_SigU=Nuser_it;            % Number of Sigmoid Utilities 
        R=10*(N_SigU+N_LogU);       % Maximum available Rate R
        syms r p;

        %% Creating the Utility Functions
        % Creating "a" as random numbers in [1,3]
            a=2*rand(1,N_SigU)+1;
        % Creating "b" as random numbers in [10,20]
            b=10*rand(1,N_SigU)+10;
        % Creating "k" as random numbers in [1,10]
            k=9*rand(1,N_LogU)+1;    
        % Creating "rmax" as random numbers in [30,50]
            rmax=20*rand(1,N_LogU)+30;

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
        %     nametitle='Large-Scalle simulation';
        %     name=[nametitle ' ']; 
        %     F06PlotLogAndSig_TwoFigures(name,nametitle,r,k,a,b,N_LogU,N_SigU,rmax,Ua);

        %% Solving the Optimization Problem - Init of the Algorithm
            pini=.5;
            Ini_time = cputime;
            [ri_a,wi_a,pi_a,it_a,it_NR_a,MismatchNR_a]=F04SolvingOptimization(Ua,pini,N_LogU,N_SigU,b,R,tolerance,max_it);
            elapsed_time = cputime-Ini_time;

        %% Plotting the Allocated rates vs Iterations for the Sigmoid and Logarithmic utility functions
            nametitle='Large-Scalle simulation';
            name=[nametitle ' Allocated rates vs Iterations   ']; 
            F07PlotRatesVsIterations(name,nametitle,ri_a,it_a,N_LogU,N_SigU,k,a,b,Ua);

        %% Plotting the Price vs Iterations
            nametitle='Large-Scalle simulation';
            name=[nametitle ' Price vs Iterations  ']; 
            F08PlotPriceVsIterations(name,nametitle,pi_a,it_a,N_LogU,N_SigU);

        save(['... Put here the location where you ae going to save the MATLAB workspace variables ...' num2str(N_LogU) '_NSig' num2str(N_SigU) '.mat'])
    end