function [coins, yen_units] = japan( money )
    % 1만엔, 5천엔, 2천엔, 1천엔
    yen_units = [10000 5000 2000 1000];
    values = int32([100000,50000,20000,10000]);
    remain = int32(money);
    coins = zeros(1,4);
    for v = 1:4
        coins(v) = idivide(remain, values(v));
        remain = mod(remain, values(v));
    end
end