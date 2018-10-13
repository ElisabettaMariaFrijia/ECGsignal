function ecg_plot(fname, figno)
%funcion ecg_plot(fname, figno)
%La funzione riceve in ingresso fname,nome del file ecg, e ne rappresenta il
%grafico in una figura; figno è il numero della figura nella quale avviene
%il plottaggio.
	
    fname = [ 'dati\', fname, '.mat' ];
	fp = fopen(fname);
	if fp == -1; 
        fprintf ('Attenzione questo file non esiste.\n');
        return
        
    end;
	fclose(fp);
	load(fname);
	
	% ===== plotto
	[N, cc] = size( ets_ecg );
	T = ( 0:(N-1) ) / fs;
    if figno==0;
	figure();
    else figno>0;
    figure(figno);
    end
    
	subplot(1,1,1);
	plot(T, ets_ecg, '-k');
	txt = sprintf('%s', fname);
	title(txt, 'interpreter', 'none');
	xlabel('sec');ylabel('mV');
	grid on;
return

