function  ecg_noise(fname,fout,fo,f1,SNRdB)
%function  ecg_noise(fname,fout,fo,f1,SNRdB)
%La funzione riceve in ingresso fname che contiene il file ecg, vi somma un
%rumore passa banda e salva il segnale modificato sotto il nome di fout.
%fo ed f1 rappresentano l'intervallo di frequenze nel quale avviene il
%filtraggio,SNRdb è un parametro che permette di ricavare il valore del rumore.

  fname = [ 'dati\', fname, '.mat' ];
  fp = fopen(fname);
  if fp == -1;  
      fprintf ('Attenzione questo file non esiste.\n');
        return
  end;
  fclose(fp);
  load(fname);
   fo=fo/fs;
   f1=f1/fs;
  [ ets_ecg ] =ecg_noise0(ets_ecg,fo,f1,SNRdB);
  
   %salvo
  
   fname = ['dati\',fout,'.mat'];
    
   save( fname, 'ets_ecg', 'fs' );
  

end

