function ecg_spec_tri( fname,T,figno)
%function ecg_spec_tri( fname,T,figno)
%La funzione esegue la stima spettrale con finestra triangolare, fname è
%il file ecg sul quale si esegue la stima spettrale, T è la finestra
%temporale espressa in secondi,figno è il numero della figura nella
%quale viene rappresentata la stima spettrale.
  fname = [ 'dati\', fname, '.mat' ];
  fp = fopen(fname);
  if fp == -1; 
      fprintf ('Attenzione questo file non esiste.\n');
        return
  end;
        
  fclose(fp);
  load(fname);
	



%Calcolo il numero N di campioni
N = T * fs;
N = round(N);
if mod(N,2)==0
    N=N+1;
else
    N=N;
    
end

%chiamo la funzione spec_est_tri che si trova in libreria e gli fornisco il
%vettore caricato

s = spec_est_tri (ets_ecg,N);


f = [0:fs/N:fs-fs/N]';
if  mod(N,2)== 0
 f = f(1:(N/2+1),1);

else
   
 f = f(1:((N-1)/2+1),1);
 
end

if figno==0;
	figure();
    else figno>0;
    figure(figno);
    end

subplot (1,1,1);
plot (f, 10*log10(s));
ylabel ('mV^2/Hz[dB]'); xlabel ('F[Hz]');
title ( 'Stima spettrale con finestra triangolare del segnale ECG');
grid on;




end

