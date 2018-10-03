%% Juan Carlos Bedoya Ceballos and Dr. Ahmed Abdelhadi
%
%	SIMULATIONS
%
%
%   Created by: Juan Carlos Bedoya 
%   Ph.D. Student. ECE VirginiaTech
%   April 11th, 2018

function F07PlotRatesVsIterations(name,nametitle,ri,it,N_LogU,N_SigU,k,a,b,Ua)

    figure('Name',name,'numbertitle','off','units','normalized','outerposition',[0 0 1 1]);
    if N_LogU+N_SigU>50
        plot(0:it-1,ri,'-','Linewidth',1.0);
    else
        plot(0:it-1,ri,'-s','Linewidth',1.5);
    end
%     plot(0:it-1,ri,'-s','Linewidth',1.5);
    grid on;
    % axis square;
    h=gca;
    set(h,'FontName', 'Times New Roman');
    set(h,'Fontsize',20);
    if N_LogU+N_SigU <= 15    
        xticks(0:it-1);
    end
    xlim([0 it-.9]);
    ylim([0 ceil(max(max(ri)))+1]);
    xlabel('Iterations','Fontsize',20,'FontWeight','bold');
    ylabel(['r_i(Iterations)    i=1...' num2str(size(Ua,1))],'Fontsize',20,'FontAngle', 'italic','FontWeight','bold');

    Title_Text=[nametitle '.  Allocated Rates vs Iterations'];
    if N_LogU>0
        if N_SigU==0
            Title_Text=[Title_Text '.     -     N° of Log functions:'  num2str(2*N_LogU)];        
        else
            Title_Text=[Title_Text '.     -     N° of Log functions:'  num2str(N_LogU)];
        end
    end
    if N_SigU>0
        Title_Text=[Title_Text '.     -     N° of Sigmoid functions:' num2str(N_SigU) ];
    end
    title(Title_Text,'Fontsize',25,'FontWeight','normal');

    % Building the text for the legend of the graphic
    if N_LogU+N_SigU <= 15
        for  pos=1:size(Ua,1)
            if Ua{pos,7} == 2      % Type of Utility. 1: Sigmoidal      2: Logaritmic
                Legend_Text{pos}=['Log k=' num2str(k(pos))];
            else
                Legend_Text{pos}=['Sigmoid a=' num2str(a(pos)) ', b=' num2str(b(pos)) ];
            end
        end
        legend( Legend_Text,...
            'Fontsize',19,'FontAngle', 'italic','FontWeight','normal','Location','northeastoutside');
    end