load gasoline\gCosts.mat
plot(Year, Australia, ".--")
    hold on
plot(Year, Canada, ".--")
plot(Year, Germany, ".--")
plot(Year, Mexico, ".--")
hold off
legend(country, "Location", "northwest")
title("Цена на газ")
xlabel("Year")
ylabel("Price [US$/gallon]")
gal2lit = 0.2642;
AustraliaHpL = gal2lit*Australia/hourlyAus;
CanadaHpL = gal2lit*Canada/hourlyCan;
GermanyHpL = gal2lit*Germany/hourlyGer;
MexicoHpL = gal2lit*Mexico/hourlyMex;
AuCaDiff = CanadaHpL - AustraliaHpL;
CaMxAvg = (CanadaHpL + MexicoHpL)/2;
absDiff = abs(AuCaDiff);
figure(1), bar(Year, AuCaDiff)
figure(2), stem(Year,AuCaDiff)
figure(3), stairs(Year, AuCaDiff)
figure(4), area(Year,AuCaDiff)
figure(5), scatter(AustraliaHpL,CanadaHpL)
figure(6), scatter(AustraliaHpL,CanadaHpL,20, Year,"filled")