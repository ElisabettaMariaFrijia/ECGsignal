function [ y ] =ecg_noise0(x,fo,f1,SNRdB)
%function  ecg_noise0(x,fo,f1,SNR)
%La funzione riceve in ingresso x,vettore che contiene il file ecg, vi somma un
%rumore passa banda e restituisce il vettore che rappresenta il segnale modificato.
%fo ed f1 rappresentano l'intervallo di frequenze nel quale avviene il
%filtraggio,SNRdb è un parametro che permette di ricavare il valore del rumore.
  SNR=10^(SNRdB/10);
  
  
  n=rand(length(x),1);
  
  %=====filtro il rumore bianco con un filtro passabanda
   y=pbanda(n,fo,f1);
  
   %calcolo la potenza del segnale e del rumore filtrato
 
  N=length(x);
   
 
  Px=var(x);
  Py=var(y);
  
  %scrivo l'espressione dell'SNR
  a=sqrt(Px/(Py*SNR));
  
  %scalo il rumore filtrato
  z=a.*y;
  %potenza del rumore filtrato e scalato
  Pz=Px/SNR;
  
  y= x+z; 
 
 
 
    

end

