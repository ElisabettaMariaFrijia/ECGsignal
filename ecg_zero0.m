function [ y] =ecg_zero0(x,fs,to,t1 )
%function ecg_zero0(x,to,t1 )
%La funzione riceve in ingresso x,vettore che rappresenta il file ecg,
%lo azzera nell'intervallo temporale t1-to e restituisce il segnale
%modificato sotto forma di vettore. 
 
        
  to=to*fs+1;
  t1=t1*fs+1;
  to = floor(to);
  t1 = floor(t1);
    
  for t=[to:t1]
      
      x(t)=0;
      
 end
 y=x;
end





