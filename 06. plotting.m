% =========================================================================
% File        : buat_gambar_plot.m
% Deskripsi   : Membuat seluruh gambar (figs/f01-f28) untuk slide
%               "Membuat Plot di MATLAB". Kode tiap gambar sama dengan
%               kode yang ditampilkan di slide.
% Proyek      : Basic MATLAB -- Modul Plotting
% Penulis     : Andreas Syaloom Kurniawan
% Versi       : 1.0
% Dibuat      : 13 Oktober 2026
% Diperbarui  : 13 Oktober 2026
% =========================================================================
% Kebutuhan: MATLAB R2022a ke atas (plot dari tabel, subtitle,
%            tiledlayout, exportgraphics, xline/yline).
% Jalankan dari folder yang sama dengan file .tex.

clear; close all; clc;
if ~exist('figs', 'dir'), mkdir('figs'); end

% ---- Data (slide "Data yang dipakai sepanjang materi") -------------------
tahun   = 2018:2024;
growth  = [5.17 5.02 -2.07 3.70 5.31 5.05 5.03];
inflasi = [3.13 2.72  1.68 1.87 5.51 2.61 1.57];
bunga   = [6.00 5.00  3.75 3.50 5.75 6.25 6.00];

% File CSV untuk contoh readtable
D = table(tahun', growth', inflasi', bunga', ...
    'VariableNames', {'Tahun','Growth','Inflasi','SukuBunga'});
writetable(D, 'ekonomi.csv');
D = readtable('ekonomi.csv');

KECIL = [100 100 560 420];
LEBAR = [100 100 900 380];
BESAR = [100 100 800 600];

% ---- Plot dasar ----------------------------------------------------------
baru(KECIL); plot(growth)
simpan('f01_sederhana')

baru(KECIL); plot(tahun, growth)
xlabel('Tahun'); ylabel('Pertumbuhan ekonomi (%)')
simpan('f02_xy')

baru(KECIL); plot(tahun, growth, tahun, inflasi, tahun, bunga)
xlabel('Tahun'); ylabel('Persen (%)')
legend('Growth','Inflasi','Suku bunga')
simpan('f03_multi')

baru(KECIL); bar(tahun, growth)
xlabel('Tahun'); ylabel('Pertumbuhan ekonomi (%)')
simpan('f04_bar')

baru(KECIL); scatter(inflasi, growth, 60, 'filled')
xlabel('Inflasi (%)'); ylabel('Pertumbuhan ekonomi (%)')
simpan('f05_scatter')

% ---- Teks dan keterangan -------------------------------------------------
baru(KECIL); plot(tahun, growth)
title('Pertumbuhan Ekonomi'); subtitle('Data ilustrasi, 2018-2024')
xlabel('Tahun'); ylabel('Persen (%)')
simpan('f06_judul')

baru(KECIL); plot(tahun, growth)
grid on; grid minor
simpan('f07_grid')

baru(KECIL); hold on
plot(tahun, growth,  'DisplayName','Growth')
plot(tahun, inflasi, 'DisplayName','Inflasi')
plot(tahun, bunga,   'DisplayName','Suku bunga')
hold off; legend show
simpan('f08_legend')

% ---- Gaya garis ----------------------------------------------------------
baru(KECIL); hold on
plot(tahun, growth,  'LineWidth',0.5)
plot(tahun, inflasi, 'LineWidth',2)
plot(tahun, bunga,   'LineWidth',4)
hold off
simpan('f09_tebal')

baru(KECIL); hold on
plot(tahun, growth,  'r')
plot(tahun, inflasi, 'Color',[0 0.5 0])
plot(tahun, bunga,   'Color','#FF8800')
hold off
simpan('f10_warna')

baru(KECIL); plot(tahun, growth)
xlim([2018 2024]); ylim([-5 10]); xticks(2018:2024); grid on
simpan('f11_sumbu')

baru(KECIL); hold on
plot(tahun, growth,  '-o', 'MarkerFaceColor','#0072BD')
plot(tahun, inflasi, '--s', 'MarkerSize',8)
plot(tahun, bunga,   ':^', 'MarkerSize',10, 'MarkerFaceColor','y')
hold off
simpan('f12_marker')

baru(KECIL); plot(tahun, growth, tahun, inflasi, tahun, bunga)
legend('Growth','Inflasi','Suku bunga', ...
    'Location','southoutside', 'Orientation','horizontal')
simpan('f13_posisi')

baru(KECIL)
yyaxis left;  plot(tahun, growth, '-o'); ylabel('Growth (%)')
yyaxis right; plot(tahun, bunga,  '-s'); ylabel('Suku bunga (%)')
xlabel('Tahun'); title('Growth dan Suku Bunga')
simpan('f14_yyaxis')

baru(KECIL); hold on
plot(tahun, growth,  '-o', 'LineWidth',2, 'Color','#0072BD', 'DisplayName','Growth')
plot(tahun, inflasi, '--s','LineWidth',2, 'Color','#D95319', 'DisplayName','Inflasi')
plot(tahun, bunga,   ':^', 'LineWidth',2, 'Color','#77AC30', 'DisplayName','Suku bunga')
hold off
grid on; xlim([2018 2024]); xticks(2018:2024)
title('Indikator Ekonomi'); subtitle('Data ilustrasi')
xlabel('Tahun'); ylabel('Persen (%)')
legend('Location','southoutside', 'Orientation','horizontal')
simpan('f15_gabungan')

x = 1:10;
baru(KECIL); hold on
plot(x, x,   '-');  plot(x, x+2, '--')
plot(x, x+4, ':');  plot(x, x+6, '-.')
hold off
legend('''-''','''--''',''':''','''-.''', 'Location','northwest')
simpan('f16_linestyle')

x = 1:8;
baru(KECIL); hold on
plot(x, x,    'o'); plot(x, x+2,  's'); plot(x, x+4,  '^')
plot(x, x+6,  'd'); plot(x, x+8,  'p'); plot(x, x+10, '*')
hold off
legend('''o''','''s''','''^''','''d''','''p''','''*''', ...
    'Location','northwest', 'Interpreter','none')
simpan('f17_marker_jenis')

% ---- Dari tabel ----------------------------------------------------------
baru(KECIL); plot(D.Tahun, D.Growth, '-o')
xlabel('Tahun'); ylabel('Growth (%)')
simpan('f18_tabel1')

baru(KECIL); plot(D, 'Tahun', {'Growth','Inflasi','SukuBunga'})
xlabel('Tahun'); ylabel('Persen (%)')
legend('Location','southoutside', 'Orientation','horizontal')
simpan('f19_tabel2')

% ---- Gambar baru ---------------------------------------------------------
% f21: tanpa vs dengan hold on
baru(LEBAR); tiledlayout(1, 2, 'TileSpacing','compact')
nexttile
plot(tahun, growth); plot(tahun, inflasi)      % menimpa
title('Tanpa hold on')
nexttile
plot(tahun, growth); hold on; plot(tahun, inflasi); hold off
title('Dengan hold on')
simpan('f21_hold')

% f22: batang berkelompok
B = [growth; inflasi]';
baru(KECIL); bar(tahun, B)
xlabel('Tahun'); ylabel('Persen (%)')
legend('Growth','Inflasi', 'Location','southwest')
simpan('f22_bar_grup')

% f23: scatter + garis tren
baru(KECIL); scatter(inflasi, growth, 60, 'filled'); hold on
p  = polyfit(inflasi, growth, 1);
xs = linspace(min(inflasi), max(inflasi));
plot(xs, polyval(p, xs), 'r-', 'LineWidth', 1.5); hold off
xlabel('Inflasi (%)'); ylabel('Pertumbuhan ekonomi (%)')
simpan('f23_scatter_tren')

% f24: jenis grafik lain
rng(1)
baru(BESAR); tiledlayout(2, 2, 'TileSpacing','compact')
nexttile; histogram(randn(500,1) + 5, 20); title('histogram')
nexttile; area(tahun, [inflasi; bunga]');  title('area')
nexttile; stairs(tahun, bunga);            title('stairs')
nexttile; pie([45 30 25]);                 title('pie')
simpan('f24_jenis_lain')

% f26: skala linear vs log
t   = 0:30;
pdb = 100 * 1.05.^t;
baru(LEBAR); tiledlayout(1, 2, 'TileSpacing','compact')
nexttile; plot(t, pdb);     grid on; title('Skala linear')
nexttile; semilogy(t, pdb); grid on; title('Skala log')
simpan('f26_log')

% f27: anotasi
baru(KECIL); plot(tahun, growth, '-o')
yline(0, 'k-')
xline(2020, '--r', 'Pandemi COVID-19')
text(2021.1, 3.7, '\leftarrow pemulihan')
xlabel('Tahun'); ylabel('Growth (%)')
simpan('f27_anotasi')

% f28: beberapa grafik dalam satu figure
baru(BESAR); tiledlayout(2, 2)
nexttile; plot(tahun, growth);  title('Growth')
nexttile; plot(tahun, inflasi); title('Inflasi')
nexttile; bar(tahun, bunga);    title('Suku bunga')
nexttile; scatter(inflasi, growth, 'filled'); title('Inflasi vs growth')
simpan('f28_tiled')

disp('Selesai: semua gambar tersimpan di folder figs/.')

% ---- Fungsi lokal --------------------------------------------------------
function baru(posisi)
    figure('Color','w', 'Position',posisi);
end

function simpan(nama)
    exportgraphics(gcf, fullfile('figs', [nama '.png']), 'Resolution', 200);
    close(gcf);
end
