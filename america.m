function [coins, dollar_units] = america( money )
    % 100달러, 50달러, 20달러, 10달러, 5달러, 2달러, 1달러
    dollar_units = [100 50 20 10 5 2 1];
    values = int32([123500,61750,24700,12350,6175,2470,1235]);
    remain = int32(money);
    coins = zeros(1,7);
    for v = 1:7
        coins(v) = idivide(remain, values(v));
        remain = mod(remain, values(v));
    end
end