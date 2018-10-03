%% Juan Carlos Bedoya Ceballos and Dr. Ahmed Abdelhadi
%
%	SIMULATIONS
%
%
%   Created by: Juan Carlos Bedoya 
%   Ph.D. Student. ECE VirginiaTech
%   April 11th, 2018

function [ri,wi,pi,it,it_NR,MismatchNR]=F04SolvingOptimization(U,pini,N_LogU,N_SigU,b,R,tolerance,max_it)
    it=1;
    pi(it)=pini;
    if N_SigU>0
        ri(:,it)=[0.1*ones(1,N_LogU) b(N_LogU+1:N_LogU+N_SigU)  ]';
        ri_pre=ri;
    else
        ri(:,it)=[0.1*ones(1,N_LogU) ]';
        ri_pre=ri;
    end
    wi(:,it)=1e3*ones(N_LogU+N_SigU,1);
    w_pre=zeros(N_LogU+N_SigU,1);
    MismatchNR(1,1)=1e3;
    it_NR(1,1)=0;
    while it<=max_it
        % Solving the problem for Individual Units
        for i=1:N_LogU+N_SigU
            [ri(i,it),it_NR(i,it),MismatchNR(i,it)]=...
                F05SolveByNR(U{i,5},U{i,6},pi(it),ri_pre(i),tolerance,max_it);
            wi(i,it)=pi(it)*ri(i,it);
        end

        % Updating Price at Base Station
        if sum(abs(wi(:,it)-w_pre))<tolerance
            break;
        end
        w_pre=wi(:,it);
        ri_pre=ri(:,it);
        pi(it+1)=sum(wi(:,it))/R;
        it=it+1;
    end