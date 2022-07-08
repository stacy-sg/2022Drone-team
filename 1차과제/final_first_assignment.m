% Main
clear; clc;
krw = input("대한민국 원화(KRW)를 입력해주세요. : ");

fprintf("\n");
rate(krw); %환전 후 금액
fprintf("\n");

% America(USA)
[dollar, dollar_units] = america(krw);
fprintf("==================USA==================\n");
for i = 1:length(dollar_units)
    if dollar(i) == 0
        continue;
    end
    
    if dollar_units(i) >= 1
        % Dollar 출력
        fprintf("%-4dDollar\t\t%d개\n", dollar_units(i), dollar(i));
    end
    cnt = sum(dollar); %화폐 총 개수 세기
end

fprintf("총 %d개의 화폐가 필요합니다.\n", cnt); %화폐 총 개수 출력

% Japan
[yen, yen_units] = japan(krw);
fprintf("==================JAPAN==================\n");
for i = 1:length(yen_units)

    if yen(i) == 0
        continue;
    end
    % Yen 출력
    fprintf("%-6d円\t\t\t%d개\n", yen_units(i), yen(i));
    cnt = sum(yen); %화폐 총 개수 세기
end

fprintf("총 %d개의 화폐가 필요합니다.\n", cnt); %화폐 총 개수 출력

% Europe
[euro, euro_units] = europe(krw);
fprintf("==================EUROPE==================\n");
for i = 1:length(euro_units)
    if euro(i) == 0
        continue;
    end
    if euro_units(i) >= 1
        % Euro 출력
        fprintf("%-4dEuro\t\t%d개\n", euro_units(i), euro(i));
    end
    cnt = sum(euro); %화폐 총 개수 세기
end

fprintf("총 %d개의 화폐가 필요합니다.\n", cnt); %화폐 총 개수 출력

% China
[yuan, yuan_units] = china(krw);
fprintf("==================CHINA==================\n");
for i = 1:length(yuan_units)
    if yuan(i) == 0
        continue;
    end
    
    if yuan_units(i) >= 1
        % 위안 출력
        fprintf("%-4d元\t\t%d개\n", yuan_units(i), yuan(i));
    end
    cnt = sum(yuan); %화폐 총 개수 세기
end

fprintf("총 %d개의 화폐가 필요합니다.\n", cnt); %화폐 총 개수 출력




%rate
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


%%%%%%%%%%%%%%%%%%%%%%%%
%환전
%japan
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

%china
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

%europe
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

%america
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




