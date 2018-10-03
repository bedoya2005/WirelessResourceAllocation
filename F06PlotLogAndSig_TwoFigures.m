%% Juan Carlos Bedoya Ceballos and Dr. Ahmed Abdelhadi
%
%	SIMULATIONS
%
%
%   Created by: Juan Carlos Bedoya 
%   Ph.D. Student. ECE VirginiaTech
%   April 11th, 2018

function F06PlotLogAndSig_TwoFigures(name,nametitle,r,k,a,b,nlog,nsig,rmax,Ua)
    N_LogU=1;N_SigU=1;  % Number of Logaritmic and Sigmoidal Functions.

    if nlog>0
        figure('Name',name,'numbertitle','off','units','normalized','outerposition',[0 0 1 1]);
        AxLog=gca;
        hold on;
        grid on;
        axis square;
        set(AxLog,'FontName', 'Times New Roman');
        set(AxLog,'Fontsize',20);
    end
    if nsig>0
        figure('Name',name,'numbertitle','off','units','normalized','outerposition',[0 0 1 1]);
        AxSig=gca;
        hold on;
        grid on;
        axis square;
        set(AxSig,'FontName', 'Times New Roman');
        set(AxSig,'Fontsize',20);
    end

    for  pos=1:size(Ua,1)
        clear Ua_to_Eval;
        if Ua{pos,7} == 2      % Type of Utility. 1: Sigmoidal      2: Logaritmic
            Ua_to_Eval(r)=Ua{pos,1};
            Ua_to_Eval=eval(Ua_to_Eval([0:rmax(pos)/1e3:rmax(pos)]));
            if nlog+nsig>50
                plot(0:rmax(pos)/1e3:rmax(pos),Ua_to_Eval,'Linewidth',1,'Parent',AxLog);
            else
                plot(0:rmax(pos)/1e3:rmax(pos),Ua_to_Eval,'Linewidth',4,'Parent',AxLog);
            end
            Legend_Text_Log{N_LogU}=['Log utility with k=' num2str(k(pos))];
            N_LogU=N_LogU+1;
        else
            Ua_to_Eval(r)=Ua{pos,1};
            Ua_to_Eval=eval(Ua_to_Eval([0:rmax(pos)/1e3:rmax(pos)]));
            if nlog+nsig>50
                plot(0:rmax(pos)/1e3:rmax(pos),Ua_to_Eval,'Linewidth',1,'Parent',AxSig);
            else
                plot(0:rmax(pos)/1e3:rmax(pos),Ua_to_Eval,'Linewidth',4,'Parent',AxSig);
            end
            Legend_Text_Sig{N_SigU}=['Sigmoid utility with a=' num2str(a(pos)) ', b=' num2str(b(pos)) ];
            N_SigU=N_SigU+1;                        
        end
    end
    N_LogU=N_LogU-1;
    N_SigU=N_SigU-1;
    if N_LogU>0
        if N_LogU+N_SigU <= 15
            legend( AxLog,Legend_Text_Log,'Fontsize',20,'FontAngle', 'italic','FontWeight','normal','Location','southeast');
        end
        xlabel(AxLog,'r: Rate of Use','Fontsize',20);
        ylabel(AxLog,'% of Utilization','Fontsize',20);
        title(AxLog,[nametitle 'Logarithmic Utility Functions'],'Fontsize',25);    
    end

    if N_SigU>0
        if N_LogU+N_SigU <= 15
            legend( AxSig,Legend_Text_Sig,'Fontsize',20,'FontAngle', 'italic','FontWeight','normal','Location','southeast');    
        end
        xlabel(AxSig,'r: Rate of Use','Fontsize',20);
        ylabel(AxSig,'% of Utilization','Fontsize',20);
        title(AxSig,[nametitle 'Sigmoidal Utility Functions'],'Fontsize',25);    
    end