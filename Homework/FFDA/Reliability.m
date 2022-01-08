function [empTTF,empRel,t] = Reliability(interarrivals)
    [y,t] = cdfcalc(interarrivals); %ne calcolo la CDF = unreliability
    empTTF = y(2:size(y,1));        %scarto la prima riga (?)
    empRel = 1 - empTTF;            %Reliability
end

