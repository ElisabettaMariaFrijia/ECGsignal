function [y] = ecg_add_sin0(x,fs,a,fo )
%function ecg_add_sin0( x ,a,fo)
%La funzione riceve in ingresso il vettore x ,che rappresenta il file ecg,
%l'ampiezza a e la frequenza fo della sinusoide che rappresenta il
%disturbo. La sinusoide viene sommata al segnale in ingresso e 
%viene restituito il segnale modificato sotto forma di vettore.

          t = 0:length(x)-1;
          %vettore dei tempi utilizzo la stessa frequenza del segnale caricato precedentemente
          t = t / fs;
          t= t'; 
         
          d = a.*sin( 2 * pi * fo * t );
        
     
          y = x + d;
         
 
end





