clc
clear
%% Название секции
load gasoline\AuDeMx.mat Australia Germany Mexico Year
gal2li = 0.2642;
Australia = gal2li*Australia;
d = 30;
y = cosd(d);
figure(1),subplot(2,1,1), plot(Year, Australia, "--bo"), xlabel('\gamma^2'), ylabel('price'),title("\sigma \approx \pi^{2}"), grid;
          subplot(2,1,2), plot(Year, Germany, "-.g*"), xlabel('Year_a_u'), ylabel('price'),title('Цена на бензин по Германии'),grid;
%%
name_st = "RUS";
name_ch = 'RUS';

