clc
clear
%% Название секции
% $$e^x$$

load gasoline\AuDeMx.mat Australia Germany Mexico Year
gal2li = 0.2642;
Australia = gal2li*Australia;
d = 30;
y = cosd(d);
figure(1),subplot(2,1,1), plot(Year, Australia, "--bo"), xlabel('\gamma^2'), ylabel('price'),legend("Australia", "Location","northwest"), title("\sigma \approx \pi^{2}"), grid;
          subplot(2,1,2), plot(Year, Germany, "-.g*"), xlabel('Year_a_u'), ylabel('price'), title('Цена на бензин по Германии'),grid;
%%
name_st = "RUS";
%% 
% Различие строковых и числовых переменных
hold on 
plot(Year, Mexico),legend("Germany", "Mexico",  "Location","northwest");
hold off
name_ch = 'RUS';