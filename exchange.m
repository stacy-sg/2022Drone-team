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
    else
        % Cent 출력
        fprintf("%-4dCent\t\t%d개\n", dollar_units(i) * 100 , dollar(i));
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
    else
        % Cent 출력
        fprintf("%-4dCent\t\t%d개\n", euro_units(i) * 100 , euro(i));
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
    elseif yuan_units(i) >= 0.1
        % 자오 출력
        fprintf("%-4d角\t\t%d개\n", yuan_units(i) * 10 , yuan(i));
    else
        % 펀 출력
        fprintf("%-4d分\t\t%d개\n", yuan_units(i) * 100 , yuan(i));
    end
    cnt = sum(yuan); %화폐 총 개수 세기
end

fprintf("총 %d개의 화폐가 필요합니다.\n", cnt); %화폐 총 개수 출력
