%% Juan Carlos Bedoya Ceballos and Dr. Ahmed Abdelhadi
%
%	SIMULATIONS
%
%
%   Created by: Juan Carlos Bedoya 
%   Ph.D. Student. ECE VirginiaTech
%   April 11th, 2018

function F08PlotPriceVsIterations(name,nametitle,pi,it,N_LogU,N_SigU)

    figure('Name',name,'numbertitle','off','numbertitle','off','units','normalized','outerposition',[0 0 1 1]);
    plot(0:it-1,pi,'-h','Linewidth',1.5);
    grid on;
    h=gca;
    set(h,'FontName', 'Times New Roman');
    set(h,'Fontsize',20);
    xlim([0 it-.9]);
    ylim([0 max(pi)+0.01]);
    if N_LogU+N_SigU <= 15
        xticks(0:it-1);
    end
    xlabel('Iterations','Fontsize',20);
    ylabel('Price(Iterations)','Fontsize',20,'FontAngle', 'italic','FontWeight','bold');
    Title_Text=[nametitle '.  Calculated Price vs Iterations'];

    if N_LogU>0
        if N_SigU==0
            Title_Text=[Title_Text '.     -     N° of Log functions:' num2str(2*N_LogU)];        
        else
            Title_Text=[Title_Text '.     -     N° of Log functions:' num2str(N_LogU)];
        end
    end
    if N_SigU>0
        Title_Text=[Title_Text '.     -     N° of Sigmoid functions:' num2str(N_SigU) ];
    end
    title(Title_Text,'Fontsize',25,'FontWeight','normal');
	if N_LogU+N_SigU <= 15
        legend({'Calculated Price per iteration'},...
            'Fontsize',19,'FontAngle', 'italic','FontWeight','normal','Location','northeast');
    end