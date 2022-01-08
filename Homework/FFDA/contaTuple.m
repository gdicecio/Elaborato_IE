function [tcount]=contaTuple(logfile,cwin)

%Stampa numero di tuple per ogni cwin
% [tcount]=contaTuple(logfile,cwin)

fid=fopen(logfile,'rt');
if (fid==-1)
    disp('Unable to open the file')
else
    i=1;
    while feof(fid)==0
             %Read one line into a string file
            linea=fgetl(fid);
            aline=split(linea);
            timestamps{i}=str2num(aline{1});
            i=i+1;
    end
    closeresult=fclose(fid);
    if closeresult~=0
         disp('Unable to close the file')
    end

    i=1;
    tcount=1;
    prev = timestamps{i};
    i = i + 1;
    [m,n]=size(timestamps);
    while i <= n
        succ = timestamps{i};
        %calcolo delta
        delta = succ - prev;    %differenza tra timestamp(i) e timestamp(i+1)
        if delta<cwin           %se è minore di cwin scelta allora le due entries stanno nella stessa tupla
            j=0;	
        else
            tcount = tcount + 1;%altrimenti incremento il numero di tuple
        end
        prev = succ;            %vado avanti
        i = i + 1;
    end
   
   %disp(tcount);
end

