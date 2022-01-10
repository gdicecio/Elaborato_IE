function [device_list,device] = search(file)
fid = fopen(file,'r');
device = [""];
device_list = [""];
device_mercury = [""];
j=1;
k=1;
o=1;
if (fid==-1)
    disp('Unable to open the file')
else
    i=1;
    while feof(fid)==0
             %Read one line into a string file
            linea=fgetl(fid);
            aline=split(linea);
            device(i)=convertCharsToStrings(cell2mat(aline(3)));
            if contains(device_list, device(i))==0
                device_list(j) = device(i);
                j = j+1;
            end
            if contains(device_mercury, device(i))==0
                device_mercury(o) = device(i);
                o = o+1;
            end
            i=i+1;
    end
    closeresult=fclose(fid);
    if closeresult~=0
         disp('Unable to close the file')
    end
end
end

