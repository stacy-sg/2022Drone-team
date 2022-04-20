function [coins] = rate(money) %환율 출력함수
   % r = [1235, 10, 1340.72, 192]; %각 나라별 기준 환율
    coins = zeros(1,4);
    for i = 1:4
        switch i
            case 1
                coins(i) = money / 1235;
                fprintf("USD = %.2f ", coins(i));
            case 2
                coins(i) = money / 10;
                fprintf("JPY = %.2f ", coins(i));
            case 3
                coins(i) = money / 1340.72;
                fprintf("EUR = %.2f ", coins(i));
            case 4
                coins(i) = money / 192;
                fprintf("CNY = %.2f ", coins(i));
        end
    end
end