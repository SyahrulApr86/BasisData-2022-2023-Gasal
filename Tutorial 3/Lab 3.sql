--1.[SQL] Jalankan seluruh contoh 1 hingga contoh 8 di atas!
-- Contoh 1
CREATE OR REPLACE FUNCTION SIWANAP.diskon_harga(idkamar VARCHAR(10))
RETURNS INTEGER AS
$$
    DECLARE
	harga_awal INTEGER;
	harga_diskon INTEGER;
    BEGIN
	SELECT harga INTO harga_awal
	FROM KAMAR
	WHERE id_kamar = idkamar;
 
	harga_diskon := (harga_awal*9/10);
 
	UPDATE KAMAR SET harga = harga_diskon
	WHERE id_kamar = idkamar;
 
	RETURN harga_diskon;
    END;
$$
LANGUAGE plpgsql;

-- Contoh 2

SELECT diskon_harga('KA01');

-- Contoh 3

SELECT diskon_harga(id_kamar)
FROM KAMAR;

-- Contoh 4

CREATE OR REPLACE FUNCTION diskon_semua_harga()
RETURNS void AS
$$
    DECLARE
	temp_row RECORD;
	harga_diskon INTEGER;
    BEGIN
	FOR temp_row IN
	    SELECT *
   	    FROM KAMAR
	LOOP
	    harga_diskon := (temp_row.harga*9/10);
 
	    UPDATE KAMAR SET harga = harga_diskon
	    WHERE id_kamar = temp_row.id_kamar;
	END LOOP;
    END;
$$
LANGUAGE plpgsql;

SELECT diskon_semua_harga();

-- Contoh 5

DROP FUNCTION diskon_harga(idkamar VARCHAR(10));

-- Contoh 6

CREATE OR REPLACE FUNCTION cek_jumlah_shift()
RETURNS trigger AS
$$
    DECLARE
        shift_count integer;
    BEGIN
        IF(TG_OP = 'INSERT') THEN
            SELECT COUNT(*) into shift_count
            FROM SHIFT_PERAWAT 
            WHERE id_perawat = NEW.id_perawat 
            GROUP BY id_perawat;
            IF(shift_count >= 5) THEN
                RAISE EXCEPTION 'Maaf, perawat 					tidak boleh memiliki shift melebihi 			5';
            END IF;
            RETURN NEW;
        END IF;
	END;
$$
LANGUAGE plpgsql;

-- Contoh 7

CREATE TRIGGER trigger_cek_jumlah_shift
BEFORE INSERT ON SHIFT_PERAWAT
FOR EACH ROW
EXECUTE PROCEDURE cek_jumlah_shift();

-- Contoh 8

INSERT INTO SHIFT_PERAWAT (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir)
VALUES ('SP101', 'PE13', 'RI20', '2020-11-30 00:00', '2020-11-30 12:00');

INSERT INTO SHIFT_PERAWAT (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir)
VALUES ('SP101', 'PE11', 'RI20', '2020-11-30 00:00', '2020-11-30 12:00');

-- 2. Buatlah function/stored procedure dengan nama check_validity dan trigger dengan nama trigger_check_validity untuk setiap INSERT pada tabel RAWAT_INAP untuk memastikan bahwa tgl_masuk terjadi sebelum tgl_keluar (tgl_masuk dan tgl_keluar pada hari yang sama juga tidak boleh). Berikan exception message seperti berikut ‘Input tidak valid pastikan bahwa tanggal masuk sebelum tanggal keluar’ atau disesuaikan dengan kreativitas kalian tetapi masih dalam pengertian yang sesuai.
-- Kemudian jalankan ketiga perintah berikut.

INSERT INTO RAWAT_INAP VALUES ('RI51', 'KA01', 'PA03', '2022-11-06', '2022-11-08');


INSERT INTO RAWAT_INAP VALUES ('RI52', 'KA05', 'PA18', '2022-11-10', '2022-11-08');


INSERT INTO RAWAT_INAP VALUES ('RI53', 'KA01', 'PA38', '2022-11-11', '2022-11-11');

-- Jawab:
CREATE OR REPLACE FUNCTION check_validity()
RETURNS TRIGGER AS
$$
    BEGIN
    IF NEW.tgl_masuk >= NEW.tgl_keluar THEN
        RAISE EXCEPTION 'Input tidak valid pastikan bahwa tanggal masuk sebelum tanggal keluar';
    END IF;
    RETURN NEW;
    END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_validity
BEFORE INSERT ON rawat_inap
FOR EACH ROW EXECUTE PROCEDURE check_validity();

-- 3. [SQL] Terlebih dahulu lakukan penambahan kolom pada tabel RAWAT_INAP dengan nama jml_biaya dengan tipe integer dan nilai default = 0.
-- Buatlah function/stored procedure dengan nama calculate_cost dan trigger dengan nama trigger_calculate_cost untuk setiap INSERT dan UPDATE pada tabel RAWAT_INAP. Function bertujuan untuk menghitung jml_biaya yang perlu dibayarkan oleh pasien untuk rawat inap. Perhitungan matematisnya: Jumlah malam dirawat * harga kamar (kolom harga pada tabel KAMAR). Contoh apabila seorang pasien menginap pada kamar KA02 dengan harga 137700 dan dia dirawat dari 2022-11-06 dan keluar pada 2022-11-08 (2 malam) maka jumlah biayanya adalah 2 * 137700 = 275400. Perlu diperhatikan bahwa kolom tgl_keluar pada tabel RAWAT_INAP bisa kosong (null), untuk kasus ini maka calculate_cost tidak akan dijalankan (Hint: gunakan if pada function untuk menghandle ini).
-- Kemudian jalankan kedua perintah berikut.

INSERT INTO RAWAT_INAP VALUES ('RI52', 'KA05', 'PA18', '2022-11-10', '2022-11-12');


SELECT * FROM RAWAT_INAP WHERE id_rawat_inap='RI52';

-- Jawab:

CREATE OR REPLACE FUNCTION calculate_cost()
RETURNS TRIGGER AS
$$
    BEGIN
    IF NEW.tgl_keluar IS NOT NULL THEN
        NEW.jml_biaya := (NEW.tgl_keluar - NEW.tgl_masuk) * (SELECT harga FROM kamar WHERE id_kamar = NEW.id_kamar);
    END IF;
    RETURN NEW;
    END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trigger_calculate_cost
BEFORE INSERT OR UPDATE ON rawat_inap
FOR EACH ROW EXECUTE PROCEDURE calculate_cost();

