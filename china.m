function [coins, yuan_units] = china( money )
    %100위안, 50위안, 20위안, 10위안, 5위안, 1위안
    yuan_units = [100 50 20 10 5 1];
    values = int32([19183, 9592, 3837, 1918, 959, 192]);
    remain = int32(money);
    coins = zeros(1,6);
    for v = 1:6
        coins(v) = idivide(remain, values(v));
        remain = mod(remain, values(v));
    end
end