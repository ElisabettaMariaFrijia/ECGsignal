function ecg_zero(fname,fout,to,t1 )
%function ecg_zero(fname, fout,to,t1 )
%La funzione riceve in ingresso fname,che rappresenta il file ecg,lo azzera 
%nell'intervallo temporale t1-to e restituisce il segnale modificato sotto
%il nome di fout.
  fname = [ 'dati\', fname, '.mat' ];
  fp = fopen(fname);
  if fp == -1; 
      fprintf('Attenzione questo file non esiste.\n');
        return
  end;
  fclose(fp);
  load(fname);
  if (to>t1) 
  fprintf('Intervallo di tempo errato\n');
  return;
  end
 
 [ ets_ecg] =ecg_zero0(ets_ecg,fs,to,t1 );
 
  %======== salvo
    fname = ['dati\',fout,'.mat'];
    
    save( fname, 'ets_ecg', 'fs' );
end

