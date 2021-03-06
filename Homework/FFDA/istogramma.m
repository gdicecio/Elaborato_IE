function [] = istogramma(device_list,device)
    [d1,d2] = size(device);
    [d3,d4] = size(device_list);
    num = zeros(1,d4);

    for i = 1:d2
        for j = 1:d4
            if device(i) == device_list(j)
                num(j) = num(j) + 1;
            end
        end
    end
    histogram('Categories',device_list,'BinCounts',num);
    ylabel('n')
end

