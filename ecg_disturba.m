function ecg_disturba (fname,fout,k)
%function ecg_disturba (fname,fout,k)
%La funzione riceve in ingresso fname che rappresenta il file ecg, applica
%in modo casuale tre disturbi e modifica il file restituendo in uscita il
%file modificato sotto il nome di fout. k è un parametro che cambia il seme
%per k=0 il seme cambia, per k>1 il seme rimane quello del numero
%scelto.

  fname1 = [ 'dati\', fname, '.mat' ];
  fp = fopen(fname1);
  if fp == -1; 
      fprintf ('Attenzione questo file non esiste.\n');
        return
  end;
        
  fclose(fp);
  load(fname1);
  
 
   nomefile = fopen ( 'dati\disturbi.txt','w+');
   fclose (nomefile);
   if k>0
   rand('seed',k);
   
   else rand();
       
   end ;
if rand()>0.5
    ss=std(ets_ecg);
    c=0.05*ss;d =0.5*ss;
    a=c+(d-c)*rand();
    e=0.01; f=(fs/2)-0.01;
    fo=e+(f-e)*rand();
    
    ets_ecg=ecg_add_sin0(ets_ecg,fs,a,fo);
   
    nomefile = fopen ( 'dati\disturbi.txt','a+');
    fprintf ( nomefile ,'La funzione ha aggiunto un disturbo sinusoidale di ampiezza a=%f e frequenza f=%f Hz al segnale ECG.\n',a,fo);
    fclose (nomefile);
end

if rand()>0.5
    c=0;d =length(ets_ecg)/fs;
    to=c+(d-c)*rand();
    e=0;f =length(ets_ecg)/fs;
    t1=e+(f-e)*rand();
    
  

   if t1<to
       
  
  t2=t1; t1=to; to=t2;
  %ribalto l'intervallo
 
   end
  if to==0 && t1==27
      
    nomefile = fopen ( 'dati\disturbi.txt','a+');
    fprintf ( nomefile ,'Non è possibile azzerare la funzione in tutto l ’intervallo temporale.\n');
    fclose (nomefile);
  end
    
    ets_ecg=ecg_zero0(ets_ecg,fs,to,t1);
    
     nomefile = fopen ( 'dati\disturbi.txt','a+');
    fprintf ( nomefile ,'La funzione ha azzerato il segnale ECG dal secondo %f al secondo %f.\n',to,t1);
    fclose (nomefile);
end



if rand()>0.5
    
    c=0.001 ; d =0.5;
    fo=c+(d-c)*rand();
    e=0.001; f=0.5;
    f1=e+(f-e)*rand();
    if f1<fo
        f2=f1; f1=fo; fo=f2;
    end
    g=10 ; h =30;
    SNRdB=g+(h-g)*rand();
  
    
    [ets_ecg]=ecg_noise0(ets_ecg,fo,f1,SNRdB);
    fo=fo*fs;
    f1=f1*fs;
    nomefile = fopen ( 'dati\disturbi.txt','a+');
    fprintf ( nomefile ,'La funzione ha aggiunto un rumore passa banda tra la frequenza f=%f Hz e la frequenza f=%f Hz al segnale ECG.Il rapporto segnale-rumore in dB vale %f.\n',fo,f1,SNRdB);
    fclose (nomefile);
end

 fprintf('Il segnale ECG originale %s viene disturbato e viene salvato il segnale output %s.\n',fname,fout);
%salvo

fname=['dati\',fout,'.mat'];

save(fname,'ets_ecg','fs');
end

