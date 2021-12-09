function [p_wilc,h_wilc] = NoParametric(real,synthetic,N)
    p_wilc = zeros(1,N-1);
    h_wilc = zeros(1,N-1);
    for i = 1:N-1
        [p_wilc(i),h_wilc(i)] = ranksum(synthetic(:,i), real(:,i));
    end
end

