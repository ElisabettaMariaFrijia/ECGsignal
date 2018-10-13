function ecg_load(fout, N, k)
%function  ecg_load(fout, N, k)
%La funzione carica uno a scelta tra i 20 ecg presenti in archivio e 
%lo salva sotto il nome di fout, N è il numero dei campioni prelevati,k 
%è un parametro che permette la scelta tra i diversi ecg e varia tra 0 e 19.
    if k>19
        fprintf('Attenzione questo file non esiste.\n');
        return
    elseif k<0
        fprintf('Attenzione questo file non esiste.\n');
        return
    else
   
    kstr=int2str(k);
   
    
   if k<10 
        
       stringa=strcat('..\..\Dat\10',kstr,'.ecg.mat');
       load(stringa);

    else
       stringa=strcat('..\..\Dat\1',kstr,'.ecg.mat');
       load(stringa);

    end
    end
   %ets_ecg è composto da una sola colonna del file iniziale ecg
   ets_ecg = ecg(:,1);	
   %frequenza di campionamento del segnale
    fs = 360;
    
   
	%===== lunghezza
	[rr, cc] = size(ets_ecg);
   
   if N > 0 && N < rr
    	ets_ecg = ets_ecg(1:N);
   else
         
         N = rr;
   end
   
    % ===== salvo
    fname = ['dati\',fout,'.mat'];
    fprintf('Salvo %s. Campioni %d, Fs %f \n',fout, N, fs);
    save( fname, 'ets_ecg', 'fs' );
  
return
