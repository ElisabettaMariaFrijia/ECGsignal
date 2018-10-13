function ecg_filtro_pbanda (fname,fout,fo,f1)
%function  ecg_filtro_pbanda (fname,fout,fo,f1)
%La funzione riceve in ingresso fname che rappresenta il file ecg, effettua
%un filtraggio lasciando passare le frequenze comprese tra fo e f1,
%e restituisce il file modificato sotto il nome di fout.
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
 
  ets_ecg=pbanda(ets_ecg,fo,f1);
  
  
  fname = ['dati\',fout,'.mat'];
    
  save( fname, 'ets_ecg', 'fs' );
  
  
  
 

end

