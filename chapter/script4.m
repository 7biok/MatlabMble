M = 10;
N = 10;
mas = randn(M, N);
Nt = 1000;
for n = 1:Nt
tic
mas_max = (max(max(mas)));
time1(1,n) = toc;
end
time1_av =sum(time1)/Nt;

for n = 1:Nt
tic
mas_max2 = max(mas(:));
time2(1,n) = toc;
end
time2_av = sum(time2)/Nt;

for n = 1:Nt
tic
mas_max3 = max(mas,[],"all");
time3(1,n) = toc;
end
tim3_av = sum(time3)/Nt;

mas_vec = reshape(mas, N*M, 1);

for n = 1:Nt
tic
mas_max4 = max(mas_vec);
time4(1,n) = toc;
end
time4_av = sum(time4)/Nt;
mas_mean = mean(mean(mas));
diff(mas)
mas(1,1) = nan;
max(mas)
bar(Year, AuCaDiff)

