% KRW to EUR
function [coins, euro_units] = europe( money )
    euro_units = [500 200 100 50 20 10 5]; % 유로 단위
    values = int32(euro_units * 1340.72); % 환율 적용
    remain = int32(money);
    coins = zeros(1,length(values));
    for v = 1:length(coins)
        coins(v) = idivide(remain, values(v));
        remain = mod(remain, values(v));
    end
end