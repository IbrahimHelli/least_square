close all
clear all
clc
format longg
%% GERÇEK MESAFEYİ ATA:
gercek_mesafe = 180.3;

%% MESAFE ÖLÇÜMLERİNİ ATA:
olcum_1 = 180.60;
olcum_2 = 180.48;
olcum_3 = 180.52;
olcum_4 = 180.49;
olcum_vektor = [olcum_1; olcum_2; olcum_3; olcum_4];

%% AĞIRLIK MATRİSİNİ VE JACOBIAN'I ATA:
R = eye(4, 4);
H = ones(length(olcum_vektor), 1);

%% STANDART EN KÜÇÜK KARELER ÇÖZÜMÜNÜ YAP:
mesafe_kestirim = inv(H' * H) * H' * olcum_vektor;
fprintf('En Küçük Kareler Kestirimi:\n')
fprintf("Gerçek Mesafe: %f, Kestirilen Mesafe: %f\n", gercek_mesafe, mesafe_kestirim);
fprintf('Mutlak Hata: %f\n', abs(gercek_mesafe - mesafe_kestirim));
fprintf('Hata Oranı: %f\n', (abs(gercek_mesafe - mesafe_kestirim) / gercek_mesafe) * 100);

%%
fprintf("\n");
%% FARKLI BİR AĞIRLIK MATRİSİ ATA:
R = diag([0.1, 0.07, 0.04, 0.01]);
mesafe_kestirim = inv(H' * inv(R) * H) * H' * inv(R) * olcum_vektor;
fprintf(['Ağırlıklı ' ...
    'En Küçük Kareler Kestirimi:\n'])
fprintf("Gerçek Mesafe: %f, Kestirilen Mesafe: %f\n", gercek_mesafe, mesafe_kestirim);
fprintf('Mutlak Hata: %f\n', abs(gercek_mesafe - mesafe_kestirim));
fprintf('Hata Oranı: %f\n', (abs(gercek_mesafe - mesafe_kestirim) / gercek_mesafe) * 100);