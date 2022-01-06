function [DataPoint]=SensitivityTuple(logfile,cwin)

%Sensitivity Analysis of tuple count


fidwindows=fopen(cwin,'rt');

i=1;
    while feof(fidwindows)==0
             %Read one line into a string file
            linea=fgetl(fidwindows);
            aline=split(linea);
            DataPoint(1,i)=str2num(aline{1}); %dim finestra
            DataPoint(2,i)= contaTuple(logfile,DataPoint(1,i)); %nr tuple associate a quella finestra
            i=i+1;
    end
    closeresult=fclose(fidwindows);
    if closeresult~=0
         disp('Unable to close the file')
    end
    
    plot(DataPoint(1,:),DataPoint(2,:),'-*b');
    
    xlabel('Window Size');
    ylabel('# of tuples');
end