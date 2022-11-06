-- 1. [SQL] Jalankan SQL Query pada Contoh 27 hingga Contoh 35 di atas dan cantumkan hasilnya pada laporan.
------
CREATE VIEW daftar_dokter AS
SELECT id_dokter, nama
FROM dokter; -- 27
------
SELECT * FROM daftar_dokter; -- 28
------
DROP VIEW daftar_dokter; -- 29
------
CREATE INDEX index_jenis_kamar ON kamar(jenis); -- 30
------
CREATE INDEX index_nama_pasien
ON pasien USING HASH (nama); -- 31
------
CREATE INDEX index_perawat
ON perawat (id_perawat, nama DESC); -- 32
------
CREATE INDEX index_nama_dokter
ON dokter (nama);
CREATE INDEX index_spesialisasi_dokter
ON dokter (spesialisasi); -- 33
------
DROP INDEX index_nama_dokter; -- 34


-- 2. View
-- a. [Trivia] Apa yang akan terjadi jika kita membuat View menggunakan nama yang sama dengan nama tabel yang ada pada database? Jelaskan!
-- View tersebut tidak akan terbuat karena terjadi conflict dengan relasi yang sudah ada, karena sebuah view yang telah dibuat akan dapat diquery selayaknya base table sehingga tidak dapat ada view yang memiliki nama yang sama dengan base table yang sudah ada.

-- b. [Trivia] Apa fungsi TEMP atau TEMPORARY di View?
-- Fungsi keyword tersebut membuat view kita menjadi terhapus (dropped) begitu session kita saat ini berakhir karena keyword tersebut akan membuat temporary view

-- c. [SQL] Buatlah View yang menyimpan nama beserta durasi bekerja yang dilakukan oleh perawat.
-- asumsi: durasi bekerja = total waktu perawat bekerja selama ini
create view durasi_perawat as
select p.nama, sum(sp.waktu_akhir - sp.waktu_mulai) "Durasi"
from perawat p
join shift_perawat sp on p.id_perawat = sp.id_perawat
group by p.nama;

-- d. [SQL] Buatlah View yang menyimpan nama-nama perawat yang merawat pasien dikelompokkan berdasarkan id pasien dan nama pasien yang belum keluar dari rumah sakit (HINT: string_agg)
create view perawat_pasien as
select p.id_pasien, p.nama, string_agg(pe.nama, ', ')
from perawat pe
join shift_perawat sp on pe.id_perawat = sp.id_perawat
join rawat_inap ri on sp.id_rawat_inap = ri.id_rawat_inap
join pasien p on ri.id_pasien = p.id_pasien
where ri.tgl_keluar is null
group by p.id_pasien, p.nama;

-- 3. Indexing and Analyze
-- Diberikan query berikut
SELECT * FROM kamar ORDER BY harga DESC;
SELECT * FROM rawat_inap WHERE tgl_keluar ISNULL;
SELECT * FROM perawat WHERE nama LIKE 'T%';
SELECT * FROM pasien ORDER BY alamat LIMIT 10;
-- a. [SQL] Jalankan perintah EXPLAIN ANALYZE untuk setiap query di atas. Screenshot eksekusinya dan tulis hasilnya pada tabel di bawah, sertakan dalam laporan submisi Anda.
EXPLAIN ANALYZE SELECT * FROM kamar ORDER BY harga DESC;
EXPLAIN ANALYZE SELECT * FROM rawat_inap WHERE tgl_keluar ISNULL;
EXPLAIN ANALYZE SELECT * FROM perawat WHERE nama LIKE 'T%';
EXPLAIN ANALYZE SELECT * FROM pasien ORDER BY alamat LIMIT 10;

-- b. [SQL] Buat index berikut (method nya terserah Anda):
-- i. index_harga_kamar pada tabel KAMAR kolom harga.
create index index_harga_kamar on kamar (harga);

-- ii. index_tgl_keluar_rawat_inap pada tabel RAWAT_INAP kolom tgl_keluar.
create index index_tgl_keluar_rawat_inap on rawat_inap (tgl_keluar);

-- iii. index_nama_perawat pada tabel PERAWAT kolom nama.
create index index_nama_perawat on perawat (nama);

-- iv. index_alamat_pasien pada tabel PASIEN kolom alamat.
create index index_alamat_pasien on pasien (alamat);

-- c. [SQL] Jalankan kembali setiap query SELECT di atas dari pertanyaan  nomor 3 menggunakan perintah EXPLAIN ANALYZE. Screenshot eksekusinya dan tulis hasilnya pada tabel di bawah, sertakan dalam laporan  submisi Anda.
EXPLAIN ANALYZE SELECT * FROM kamar ORDER BY harga DESC;
EXPLAIN ANALYZE SELECT * FROM rawat_inap WHERE tgl_keluar ISNULL;
EXPLAIN ANALYZE SELECT * FROM perawat WHERE nama LIKE 'T%';
EXPLAIN ANALYZE SELECT * FROM pasien ORDER BY alamat LIMIT 10;