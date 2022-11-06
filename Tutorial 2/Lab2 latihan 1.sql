-- 1. [SQL] Jalankan SQL Query pada Contoh 1 hingga Contoh 26 di atas dan cantumkan hasilnya pada laporan.
------
SELECT nama
FROM DOKTER
Tutorial PostgreSQL Basis Data Gasal 2022/2022
WHERE id_dokter = 'DO04'; -- 1
------
SELECT nama, jenis, kapasitas
FROM KAMAR
ORDER BY harga; -- 2
------
SELECT *
FROM KAMAR
WHERE (kapasitas >= 2) AND (kapasitas <= 4); -- 3
-- atau
SELECT *
FROM KAMAR
WHERE (kapasitas BETWEEN 2 AND 4); -- 3 
------
SELECT nama, email
FROM PERAWAT
WHERE nama LIKE 'Karen%'; -- 4
------
(SELECT * FROM DOKTER
WHERE spesialisasi = 'anak')
UNION
(SELECT * FROM DOKTER
WHERE spesialisasi = 'bedah'); -- 5
------
(SELECT * FROM DOKTER
WHERE nama LIKE 'C%')
INTERSECT
(SELECT * FROM DOKTER
WHERE spesialisasi = 'bedah'); -- 6
------
(SELECT * FROM DOKTER
WHERE nama LIKE 'C%')
EXCEPT
(SELECT * FROM DOKTER
WHERE spesialisasi = 'bedah'); -- 7
------
SELECT nama
FROM PASIEN
WHERE EXTRACT(DECADE FROM tgl_lahir) = '199'; -- 8
------
SELECT P.nama
FROM PASIEN P, KAMAR K, RAWAT_INAP R
WHERE R.id_pasien=P.id_pasien AND
    R.id_kamar=K.id_kamar AND
    K.nama='Merak 1'; -- 9
------
SELECT *
FROM PERAWAT CROSS JOIN SHIFT_PERAWAT; -- 10
------
SELECT *
FROM PERAWAT P JOIN SHIFT_PERAWAT S
ON P.id_perawat = S.id_perawat; -- 11
------
SELECT *
FROM PERAWAT P LEFT OUTER JOIN SHIFT_PERAWAT S
ON P.id_perawat = S.id_perawat; -- 12
------
SELECT *
FROM SHIFT_PERAWAT S RIGHT OUTER JOIN PERAWAT P
ON P.id_perawat = S.id_perawat; -- 13
------
SELECT *
FROM OBAT O FULL OUTER JOIN PEMBERIAN_OBAT PO
ON O.id_obat = PO.id_obat; -- 14
------
SELECT *
FROM PERAWAT NATURAL JOIN SHIFT_PERAWAT; -- 15
------
SELECT id_pasien
FROM RAWAT_INAP
WHERE tgl_keluar IS NOT NULL; -- 16
------
SELECT id_pasien
FROM RAWAT_INAP
WHERE tgl_keluar IS NULL; -- 17
------
SELECT O.nama
FROM OBAT O
WHERE O.id_obat IN (
SELECT PO.id_obat
FROM PEMBERIAN_OBAT PO, SHIFT_PERAWAT SP, PERAWAT
P
WHERE PO.id_shift_perawat = SP.id_shift_perawat
AND
SP.id_perawat = P.id_perawat AND
P.nama = 'Mitchell Greger'
); -- 18
------
SELECT P.id_perawat, P.nama
FROM PERAWAT P
WHERE NOT EXISTS (
SELECT *
FROM PEMBERIAN_OBAT PO, SHIFT_PERAWAT SP
WHERE PO.id_shift_perawat=SP.id_shift_perawat AND
SP.id_perawat=P.id_perawat
); -- 19
------
SELECT min(harga)
FROM KAMAR; -- 20
------
SELECT max(harga)
FROM KAMAR; -- 21
------
SELECT COUNT(*)
FROM KAMAR; -- 22
------
SELECT sum(kapasitas)
FROM KAMAR; -- 23
------
SELECT AVG(harga)
FROM KAMAR; -- 24
------
SELECT jenis, SUM(kapasitas)
FROM KAMAR
GROUP BY jenis; -- 25
-- atau
SELECT EXTRACT(YEAR FROM P.tgl_lahir) as TAHUN,
COUNT(*)
FROM PASIEN P
GROUP BY EXTRACT (YEAR FROM P.tgl_lahir); -- 25
------
SELECT K.jenis, COUNT(K.id_kamar)
FROM KAMAR K, RAWAT_INAP RI
WHERE RI.id_kamar = K.id_kamar
GROUP BY K.jenis
HAVING COUNT(K.id_kamar) >= 5; -- 26

-- 2. [SQL] Tampilkan nama obat yang telah diresepkan oleh perawat wanita dengan menggunakan keyword IN.
select o.nama
from obat o
where o.id_obat in (
    select id_obat
    from pemberian_obat po
    join shift_perawat sp on po.id_shift_perawat = sp.id_shift_perawat
    join perawat p on sp.id_perawat = p.id_perawat
    where p.jenis_kelamin = 'P'
    );

-- 3. [SQL] Tampilkan nama UNIK obat yang setidaknya telah diberikan pada pasien.
select distinct o.nama
from obat o
where o.id_obat in (
    select id_obat
    from pemberian_obat
    );
-- atau
select distinct o.nama
from obat o
where o.id_obat in (
    select id_obat
    from pemberian_obat po
    join shift_perawat sp on po.id_shift_perawat = sp.id_shift_perawat
    join rawat_inap ri on sp.id_rawat_inap = ri.id_rawat_inap
    join pasien p on ri.id_pasien = p.id_pasien
    );

-- 4. [SQL] Tampilkan daftar dokter yang tidak pernah merawat pasien rawat inap.
select d.nama
from dokter d
where d.id_dokter not in (
    select dri.id_dokter
    from dokter_rawat_inap dri
    );
-- atau
select d.nama
from dokter d
where not exists (
    select dri.id_dokter
    from dokter_rawat_inap dri
    where dri.id_dokter = d.id_dokter
    );

-- 5. [SQL] Tampilkan nama dokter dengan total jumlah pasien rawat inap yang telah ditugaskan kepada dokter tersebut diurutkan berdasarkan ascending alphabetical order (A-Z) dari namanya, tanpa peduli jika dokter tersebut memiliki pasien rawat inap atau tidak.
-- asumsi tidak ada nama dokter yang sama
select d.nama, count(dri.id_dokter) "Jumlah Pasien"
from dokter d
left join dokter_rawat_inap dri on d.id_dokter = dri.id_dokter
group by d.nama
order by d.nama;
-- asumsi ada nama dokter yang sama
select d.nama, count(dri.id_dokter) "Jumlah Pasien"
from dokter d
left join dokter_rawat_inap dri on d.id_dokter = dri.id_dokter
group by d.nama, d.id_dokter
order by d.nama;

-- 6. [SQL] Tampilkan jumlah pasien yang lahir pada setiap bulan. Anda disarankan menggunakan EXTRACT
select extract(month from p.tgl_lahir) "Bulan Lahir", count(p.id_pasien) "Jumlah Pasien"
from pasien p
group by extract(month from p.tgl_lahir)
order by extract(month from p.tgl_lahir);

-- 7. [SQL] Tampilkan jenis kamar dan harga rata-rata kamar untuk setiap jenis kamar.
select k.jenis, avg(k.harga) "Harga Rata-Rata"
from kamar k
group by k.jenis
order by k.jenis;

-- 8. [SQL] Tampilkan nama pasien, id kamar, dan nama dokter yang bertugas untuk setiap pasien yang masih dirawat di rumah sakit.
select p.nama "Nama Pasien", ri.id_kamar "Id Kamar", d.nama "Nama Dokter"
from pasien p
join rawat_inap ri on p.id_pasien = ri.id_pasien
left join dokter_rawat_inap dri on ri.id_rawat_inap = dri.id_rawat_inap
left join dokter d on dri.id_dokter = d.id_dokter
where ri.tgl_keluar is null;

-- 9. [SQL] Tampilkan tanggal masuk dan tanggal keluar setiap pasien yang namanya tidak mengandung huruf E (tidak case sensitive).
select ri.tgl_masuk, ri.tgl_keluar, p.nama
from rawat_inap ri
join pasien p on ri.id_pasien = p.id_pasien
where lower(p.nama) not like '%e%';

-- 10. [SQL] Tampilkan nama dan nomor telepon pasien yang tidak pernah menjadi pasien rawat inap.
select p.nama, p.no_telp
from pasien p
where p.id_pasien not in (
    select id_pasien
    from rawat_inap
    );

-- 11. [SQL] Tampilkan daftar pasien yang pernah menjadi pasien rawat inap di kamar jenis VIP atau VVIP. Anda harus menggunakan keyword UNION.
select p.*
from pasien p
where p.id_pasien in (
    select ri.id_pasien
    from rawat_inap ri
    join kamar k on ri.id_kamar = k.id_kamar
    where k.jenis like '%VIP%'
    )
union
select p.*
from pasien p
where p.id_pasien in (
    select ri.id_pasien
    from rawat_inap ri
    join kamar k on ri.id_kamar = k.id_kamar
    where k.jenis = 'VVIP'
    );

-- 12. [SQL] Tampilkan nama dan jenis kelamin perawat yang merawat semua pasien wanita.
select p.nama, p.jenis_kelamin
from perawat p
where p.id_perawat in (
    select sp.id_perawat
    from shift_perawat sp
    join rawat_inap ri on sp.id_rawat_inap = ri.id_rawat_inap
    join pasien p on ri.id_pasien = p.id_pasien
    where p.jenis_kelamin = 'P'
    )
except
select p.nama, p.jenis_kelamin
from perawat p
where p.id_perawat in (
    select sp.id_perawat
    from shift_perawat sp
    join rawat_inap ri on sp.id_rawat_inap = ri.id_rawat_inap
    join pasien p on ri.id_pasien = p.id_pasien
    where p.jenis_kelamin = 'L'
    );

-- 13. [Trivia] Apakah kita mungkin mendapatkan data tertentu dari operasi inner join menggunakan keyword IN?
-- Mungkin saja karena operasi inner join dapat digunakan bersamaan dengan operasi IN Seperti contoh di bawah ini yaitu untuk menampilkan data rawat inap dengan pasien laki-laki dan berada di kamar kelas 2
select * from rawat_inap ri
inner join kamar k on ri.id_kamar = k.id_kamar
where k.jenis = 'Kelas 2'
and id_pasien in (
 select p.id_pasien
 from pasien p
 join rawat_inap ri on p.id_pasien = ri.id_pasien
 where p.jenis_kelamin = 'L'
 );

