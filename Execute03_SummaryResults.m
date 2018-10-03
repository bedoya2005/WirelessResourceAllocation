%% Juan Carlos Bedoya Ceballos and Dr. Ahmed Abdelhadi
%
%	Summary results of the Large-scale Simulation
%
%
%   Created by: Juan Carlos Bedoya 
%   Ph.D. Student. ECE VirginiaTech
%   April 11th, 2018
%
	clc;
	clear all;
	close all;

	Nuser = [50 200 500 1000 3000 5000];

	figure('Name','Prices vs iterations','numbertitle','off','units','normalized','outerposition',[0 0 1 1]);
	AxLog=gca; 	hold on; 	grid on; 	axis square;
	set(AxLog,'FontName', 'Times New Roman');
	set(AxLog,'Fontsize',20);

	ttt=1;
	variables = {'it_a','elapsed_time','it_NR_a','ri_a','pi_a'};
	for counter= Nuser

		load(['C:\Users\Juank\Desktop\Academia_VT\2018-I\ECE_5566_ComputerNetworkingII\HW02\ConferencePaper\Results_NLog' num2str(counter) '_NSig' num2str(counter) '.mat'],variables{:});
		display('Iterations');
		display(it_a); 
		
		display('Iterations Newton');
		display(mean(mean(it_NR_a)));
		
		display('Elapsed time');
		display(elapsed_time);
		
		display('Rates Log');
		display(mean(ri_a(1:counter,end)));
		
		display('Rates Sig');
		display(mean(ri_a(counter+1:end,end)));
		
		plot(pi_a,'Linewidth',1.5);
		Legend_Text{ttt}=['Scenario with ' num2str(2*counter) ' UEs' ];
		ttt = ttt+1;
	end

	legend(AxLog,Legend_Text,'Fontsize',20,'FontAngle', 'italic','FontWeight','normal','Location','northeast');
	xlabel(AxLog,'\textbf{\textit{Iterations}}','Fontsize',20,'Interpreter', 'LaTeX');
	ylabel(AxLog,'\textbf{\textit{Price(Iterations)}}','Fontsize',20,'Interpreter', 'LaTeX');