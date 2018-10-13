function ecg_add_sin( fname ,fout,a,fo)
%function ecg_add_sin( fname ,fout, a,fo)
%La funzione riceve in ingresso il segnale fname,che rappresenta il file ecg,
%l'ampiezza a e la frequenza fo della sinusoide che rappresenta il
%disturbo. La sinusoide viene sommata al segnale in ingresso e viene
%salvato il nuovo segnale disturbato sotto il nome di fout.
         
       
         
  fname = [ 'dati\', fname, '.mat' ];
  fp = fopen(fname);
  if fp == -1; 
        fprintf ('Attenzione questo file non esiste.\n');
        return
  end;
  fclose(fp);
  load(fname);
 
  
  [ets_ecg] = ecg_add_sin0(ets_ecg,fs,a,fo );
  
  %======salvo
  %modifico il file che ho salvato in dati attraverso load inserendo il
  %nuovo ecg con la sinusoide aggiunta
    fname = ['dati\',fout,'.mat'];
    
    save( fname, 'ets_ecg', 'fs' );
end
        

