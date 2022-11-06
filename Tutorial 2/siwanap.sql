

CREATE SCHEMA siwanap;

set search_path to 'siwanap';

CREATE TABLE siwanap.dokter (
    id_dokter character varying(10) NOT NULL,
    nama character varying(100) NOT NULL,
    no_telp character varying(14) NOT NULL,
    email character varying(50) NOT NULL,
    spesialisasi text NOT NULL
);


CREATE TABLE siwanap.dokter_rawat_inap (
    id_dokter character varying(10) NOT NULL,
    id_rawat_inap character varying(10) NOT NULL
);



CREATE TABLE siwanap.kamar (
    id_kamar character varying(10) NOT NULL,
    nama character varying(30) NOT NULL,
    jenis character varying(10) NOT NULL,
    kapasitas smallint NOT NULL,
    harga integer NOT NULL
);


CREATE TABLE siwanap.obat (
    id_obat character varying(10) NOT NULL,
    nama text NOT NULL
);


CREATE TABLE siwanap.pasien (
    id_pasien character varying(10) NOT NULL,
    nama character varying(100) NOT NULL,
    alamat text NOT NULL,
    no_telp character varying(14) NOT NULL,
    email character varying(50) NOT NULL,
    tgl_lahir date NOT NULL,
    jenis_kelamin character(1) NOT NULL
);



CREATE TABLE siwanap.pemberian_obat (
    id_pemberian_obat character varying(10) NOT NULL,
    id_shift_perawat character varying(10) NOT NULL,
    id_obat character varying(10) NOT NULL,
    dosis character varying(10) NOT NULL
);



CREATE TABLE siwanap.perawat (
    id_perawat character varying(10) NOT NULL,
    nama character varying(100) NOT NULL,
    no_telp character varying(14) NOT NULL,
    email character varying(50) NOT NULL,
    jenis_kelamin character(1) NOT NULL
);



CREATE TABLE siwanap.rawat_inap (
    id_rawat_inap character varying(10) NOT NULL,
    id_kamar character varying(10) NOT NULL,
    id_pasien character varying(10) NOT NULL,
    tgl_masuk date NOT NULL,
    tgl_keluar date
);


CREATE TABLE siwanap.shift_perawat (
    id_shift_perawat character varying(10) NOT NULL,
    id_perawat character varying(10) NOT NULL,
    id_rawat_inap character varying(10) NOT NULL,
    waktu_mulai timestamp without time zone NOT NULL,
    waktu_akhir timestamp without time zone NOT NULL
);


INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO01', 'Lorry Jervois', '089663186798', 'ljervois0@pcworld.com', 'penyakit dalam');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO02', 'Brantley Ludlem', '084281989692', 'bludlem1@ox.ac.uk', 'penyakit dalam');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO03', 'Fanechka Maryman', '081639594876', 'fmaryman2@bandcamp.com', 'penyakit dalam');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO04', 'Ronda Hargitt', '088272764040', 'rhargitt3@hexun.com', 'penyakit dalam');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO05', 'Frederique Pruce', '083447355115', 'fpruce4@nps.gov', 'penyakit dalam');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO06', 'Barty Leebeter', '087601762815', 'bleebeter5@wsj.com', 'penyakit dalam');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO07', 'Ly Spellessy', '087114027540', 'lspellessy6@blogspot.com', 'penyakit dalam');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO08', 'Den Stollsteimer', '085054750630', 'dstollsteimer7@myspace.com', 'anak');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO09', 'Jenda Chaudret', '087860070111', 'jchaudret8@example.com', 'anak');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO10', 'Moreen Hebblethwaite', '083109586118', 'mhebblethwaite9@buzzfeed.com', 'anak');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO11', 'Idalia Caughte', '088041581978', 'icaughtea@samsung.com', 'anak');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO12', 'Darbie Howle', '084548778195', 'dhowleb@zimbio.com', 'anak');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO13', 'Meade Munn', '085430172820', 'mmunnc@si.edu', 'anak');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO14', 'Josephine Schnieder', '084551802662', 'jschniederd@umn.edu', 'anak');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO15', 'Rachael Redmire', '081414872968', 'rredmiree@vimeo.com', 'saraf');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO16', 'Sherry Fiveash', '081836762704', 'sfiveashf@domainmarket.com', 'saraf');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO17', 'Stewart Filkov', '081438198883', 'sfilkovg@fastcompany.com', 'saraf');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO18', 'Nero Vanyard', '081684545781', 'nvanyardh@technorati.com', 'saraf');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO19', 'Shepperd Lichfield', '084437697707', 'slichfieldi@tiny.cc', 'saraf');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO20', 'Candy Arminger', '084319934032', 'carmingerj@abc.net.au', 'saraf');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO21', 'Lazaro Morston', '084529491412', 'lmorstonk@nymag.com', 'saraf');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO22', 'Klemens Braybrooks', '083117438823', 'kbraybrooksl@abc.net.au', 'kandungan dan ginekologi');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO23', 'Shandy Stell', '081234079194', 'sstellm@quantcast.com', 'kandungan dan ginekologi');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO24', 'Berty Normandale', '083088032291', 'bnormandalen@list-manage.com', 'kandungan dan ginekologi');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO25', 'Jacinta Micco', '082769828991', 'jmiccoo@illinois.edu', 'kandungan dan ginekologi');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO26', 'Malissa Richens', '082943697788', 'mrichensp@weather.com', 'kandungan dan ginekologi');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO27', 'Emery Brakespear', '083756297748', 'ebrakespearq@utexas.edu', 'kandungan dan ginekologi');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO28', 'Halsey Ivashchenko', '084351641169', 'hivashchenkor@home.pl', 'kandungan dan ginekologi');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO29', 'Devlin Earney', '081003195082', 'dearneys@sbwire.com', 'bedah');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO30', 'Carl Adelsberg', '087917206718', 'cadelsbergt@networksolutions.com', 'bedah');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO31', 'Gearard Stapells', '085738280407', 'gstapellsu@hc360.com', 'bedah');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO32', 'Cassandre Noddles', '081220215324', 'cnoddlesv@dell.com', 'bedah');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO33', 'Genvieve Guillotin', '081315397179', 'gguillotinw@theatlantic.com', 'bedah');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO34', 'Tiena Klimmek', '089104117514', 'tklimmekx@ocn.ne.jp', 'bedah');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO35', 'Garry Aspinell', '089869528031', 'gaspinelly@cargocollective.com', 'bedah');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO36', 'Gerianna Mardall', '081743438027', 'gmardallz@vinaora.com', 'kulit dan kelamin');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO37', 'Lawry Galiford', '089124483409', 'lgaliford10@sfgate.com', 'kulit dan kelamin');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO38', 'Bev Pieracci', '083814358651', 'bpieracci11@dedecms.com', 'kulit dan kelamin');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO39', 'Zebulon Blacklawe', '086705193433', 'zblacklawe12@globo.com', 'kulit dan kelamin');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO40', 'Tobias Trusse', '081023710802', 'ttrusse13@sun.com', 'kulit dan kelamin');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO41', 'Geoff Winthrop', '087843866302', 'gwinthrop14@yelp.com', 'kulit dan kelamin');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO42', 'Adams Savage', '089135334290', 'asavage15@tiny.cc', 'kulit dan kelamin');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO43', 'Sigismond Stockbridge', '084252661633', 'sstockbridge16@psu.edu', 'kulit dan kelamin');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO44', 'Karna Fehners', '086464242539', 'kfehners17@joomla.org', 'mata');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO45', 'Lambert Wixey', '082923923502', 'lwixey18@hhs.gov', 'mata');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO46', 'Vanny Brouwer', '088896473691', 'vbrouwer19@apache.org', 'mata');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO47', 'Sephira Copsey', '087807546433', 'scopsey1a@g.co', 'mata');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO48', 'Lari Jobbings', '081309045282', 'ljobbings1b@furl.net', 'mata');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO49', 'Deana Gilhespy', '081079635491', 'dgilhespy1c@nature.com', 'mata');
INSERT INTO siwanap.dokter (id_dokter, nama, no_telp, email, spesialisasi) VALUES ('DO50', 'Ulrich Denisevich', '085685636571', 'udenisevich1d@symantec.com', 'mata');


--
-- Data for Name: dokter_rawat_inap; Type: TABLE DATA; Schema: siwanap; Owner: tara.mazaya
--

INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO44', 'RI15');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO03', 'RI21');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO30', 'RI44');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO30', 'RI41');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO12', 'RI09');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO36', 'RI12');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO26', 'RI13');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO33', 'RI29');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO09', 'RI13');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO03', 'RI23');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO11', 'RI39');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO47', 'RI13');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO33', 'RI44');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO36', 'RI10');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO23', 'RI04');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO04', 'RI33');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO20', 'RI41');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO22', 'RI04');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO26', 'RI24');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO35', 'RI44');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO49', 'RI49');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO25', 'RI07');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO02', 'RI06');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO02', 'RI29');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO06', 'RI36');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO25', 'RI01');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO09', 'RI49');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO36', 'RI11');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO29', 'RI11');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO09', 'RI20');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO47', 'RI19');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO03', 'RI20');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO01', 'RI35');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO06', 'RI16');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO28', 'RI25');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO14', 'RI12');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO09', 'RI08');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO49', 'RI16');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO16', 'RI35');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO46', 'RI04');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO34', 'RI41');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO38', 'RI39');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO09', 'RI04');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO03', 'RI47');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO01', 'RI10');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO27', 'RI24');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO45', 'RI43');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO39', 'RI48');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO45', 'RI04');
INSERT INTO siwanap.dokter_rawat_inap (id_dokter, id_rawat_inap) VALUES ('DO42', 'RI33');


--
-- Data for Name: kamar; Type: TABLE DATA; Schema: siwanap; Owner: tara.mazaya
--

INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA01', 'Merpati 1', 'Kelas 3', 6, 170000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA02', 'Merpati 2', 'Kelas 3', 6, 170000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA03', 'Merpati 3', 'Kelas 3', 6, 170000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA04', 'Merpati 4', 'Kelas 3', 6, 170000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA05', 'Merpati 5', 'Kelas 3', 6, 170000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA06', 'Jalak 1', 'Kelas 2', 4, 300000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA07', 'Jalak 2', 'Kelas 2', 4, 300000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA08', 'Jalak 3', 'Kelas 2', 4, 300000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA09', 'Jalak 4', 'Kelas 2', 4, 300000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA10', 'Jalak 5', 'Kelas 2', 4, 300000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA11', 'Murai 1', 'Kelas 1', 2, 700000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA12', 'Murai 2', 'Kelas 1', 2, 700000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA13', 'Murai 3', 'Kelas 1', 2, 700000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA14', 'Murai 4', 'Kelas 1', 2, 700000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA15', 'Murai 5', 'Kelas 1', 2, 700000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA16', 'Merak 1', 'VIP B', 1, 1100000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA17', 'Merak 2', 'VIP B', 1, 1100000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA18', 'Merak 3', 'VIP B', 1, 1100000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA19', 'Merak 4', 'VIP B', 1, 1100000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA20', 'Merak 5', 'VIP B', 1, 1100000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA21', 'Merak 6', 'VIP B', 1, 1100000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA22', 'Merak 7', 'VIP B', 1, 1100000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA23', 'Merak 8', 'VIP B', 1, 1100000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA24', 'Merak 9', 'VIP B', 1, 1100000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA25', 'Merak 10', 'VIP B', 1, 1100000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA26', 'Merak 11', 'VIP B', 1, 1100000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA27', 'Merak 12', 'VIP B', 1, 1100000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA28', 'Merak 13', 'VIP B', 1, 1100000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA29', 'Merak 14', 'VIP B', 1, 1100000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA30', 'Merak 15', 'VIP B', 1, 1100000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA31', 'Elang 1', 'VIP A', 1, 1600000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA32', 'Elang 2', 'VIP A', 1, 1600000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA33', 'Elang 3', 'VIP A', 1, 1600000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA34', 'Elang 4', 'VIP A', 1, 1600000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA35', 'Elang 5', 'VIP A', 1, 1600000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA36', 'Elang 6', 'VIP A', 1, 1600000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA37', 'Elang 7', 'VIP A', 1, 1600000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA38', 'Elang 8', 'VIP A', 1, 1600000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA39', 'Elang 9', 'VIP A', 1, 1600000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA40', 'Elang 10', 'VIP A', 1, 1600000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA41', 'Garuda 1', 'VVIP', 1, 3100000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA42', 'Garuda 2', 'VVIP', 1, 3100000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA43', 'Garuda 3', 'VVIP', 1, 3100000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA44', 'Garuda 4', 'VVIP', 1, 3100000);
INSERT INTO siwanap.kamar (id_kamar, nama, jenis, kapasitas, harga) VALUES ('KA45', 'Garuda 5', 'VVIP', 1, 3100000);


--
-- Data for Name: obat; Type: TABLE DATA; Schema: siwanap; Owner: tara.mazaya
--

INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB01', 'calcitonin salmon');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB02', 'Estazolam');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB03', 'ARNICA MONTANA - RHUS TOXICODENDRON - RUTA GRAVEOLENS');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB04', 'ANTIPYRINE AND BENZOCAINE');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB05', 'Phenobarbital');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB06', 'levofloxacin');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB07', 'Albuterol Sulfate');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB08', 'RISPERIDONE');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB09', 'Levothyroxine Sodium');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB10', 'calcipotriene 0.005% and betamethasone dipropionate 0.064%');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB11', 'sus scrofa small intestine mucosa lymph follicle');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB12', 'Benzalkonium Chloride');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB13', 'HYDROCODONE BITARTRATE AND ACETAMINOPHEN');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB14', 'Natural Medicine');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB15', 'desvenlafaxine succinate');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB16', 'Nitrogen');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB17', 'Treatment Set TS350256');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB18', 'Acetaminophen');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB19', 'Titanium Dioxide');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB20', 'Glipizide');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB21', 'Salsalate');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB22', 'Triclosan');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB23', 'Cefprozil');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB24', 'Octinoxate and Octocrylene and Oxybenzone and Octisalate and Meradimate and Titantium Dioxide');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB25', 'azithromycin');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB26', 'isotretinoin');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB27', 'Monobasic Sodium Phosphate and Dibasic Sodium Phosphate');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB28', 'Aspirin, DEXTROMETHORPHAN HYDROBROMIDE, DOXYLAMINE SUCCINATE, and PHENYLEPHRINE BITARTRATE');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB29', 'TRICLOSAN');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB30', 'BENZOYL PEROXIDE');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB31', 'Nabumetone');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB32', 'OCTINOXATE, OCTISALATE');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB33', 'LOVASTATIN');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB34', 'Codeine Phosphate, Phenylephrine Hydrochloride, Pyrilamine Maleate');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB35', 'benzoyl peroxide');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB36', 'calcium carbonate');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB37', 'Methylprednisolone');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB38', 'Metformin Hydrochloride');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB39', 'Rivastigmine Tartrate');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB40', 'Penicillium notatum');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB41', 'TITANIUM DIOXIDE');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB42', 'pralatrexate');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB43', 'Salicylic Acid');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB44', 'Benzethonium chloride');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB45', 'Progesterone');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB46', 'SILVER NITRATE,AVENA SATIVA FLOWERING TOP,TURNERA DIFFUSA LEAFY TWIG,LYCOPODIUM CLAVATUM SPORE,PHOSPHORIC ACID, SELENIUM.');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB47', 'Menthol, Capsicum extract');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB48', 'Octinoxate, Titanium Dioxide, Zinc Oxide');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB49', 'Salicylic acid');
INSERT INTO siwanap.obat (id_obat, nama) VALUES ('OB50', 'TRICLOSAN');


--
-- Data for Name: pasien; Type: TABLE DATA; Schema: siwanap; Owner: tara.mazaya
--

INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA01', 'Rey Ferrieri', 'Jl Raya PKP, Dki Jakarta', '87667076022', 'rferrieri0@latimes.com', '1960-07-29', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA02', 'Englebert Glassard', 'Jl. Pluit Raya No. 19, Jakarta Raya', '83613307057', 'eglassard1@imdb.com', '1972-08-09', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA03', 'Lacee Jimson', 'Jl Warung Buncit Raya Kav 35, Dki Jakarta', '83374273645', 'ljimson2@fc2.com', '1966-06-11', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA04', 'Fredra Addey', 'Jl Akalipa Mas III RT 004/08 Kompl Villa Pamulang Mas Bl N-8/10, Dki Jakarta', '82950865550', 'faddey3@tmall.com', '1997-12-03', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA05', 'Cesar Witard', 'Plaza City View, Building', '83060150583', 'cwitard4@ca.gov', '1969-03-12', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA06', 'Jayme Clew', 'Jl Bisma Raya Bl D-1/22, Dki Jakarta', '82731096705', 'jclew5@exblog.jp', '1982-08-18', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA07', 'Rodney Di Biasio', 'Jl Jatinegara Brt 122, Dki Jakarta', '86987105340', 'rdi6@amazon.de', '1966-06-27', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA08', 'Henriette Renon', 'Jl Banda 7 A, Dki Jakarta', '83866934327', 'hrenon7@printfriendly.com', '1962-01-18', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA09', 'Gilemette Gresswell', 'Jl Adam 103 Sukabumi Utara, Dki Jakarta', '86224127948', 'ggresswell8@amazon.co.uk', '1981-05-27', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA10', 'Fielding Crone', 'Jl Pondok Randu 103, Dki Jakarta', '85111343784', 'fcrone9@bigcartel.com', '1961-02-18', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA11', 'Padraic De Francisci', 'Jl H Agus Salim 69, Jakarta', '87388709917', 'pdea@slideshare.net', '1994-06-03', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA12', 'Lenci Scoffham', 'Jl Perindustrian 2, Dki Jakarta', '83050013265', 'lscoffhamb@thetimes.co.uk', '1972-07-24', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA13', 'Lynette Conwell', 'Jl Kenari II 4, Dki Jakarta', '89434813042', 'lconwellc@yolasite.com', '1979-03-02', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA14', 'Clarisse Pennuzzi', 'Jl Rawagelam IV 7, Dki Jakarta', '86444824850', 'cpennuzzid@pbs.org', '1963-04-24', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA15', 'Zaccaria Dewsnap', 'Jl Palapa Raya 2, Dki Jakarta', '84860192729', 'zdewsnape@bloglines.com', '1982-11-13', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA16', 'Friedrick Pina', 'Jl Daan Mogot Km 19/397, Dki Jakarta', '82880371279', 'fpinaf@jigsy.com', '1990-08-16', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA17', 'Sibella Raddin', 'Jl Lestari 45 RT 009/03, Dki Jakarta', '81800084683', 'sradding@cmu.edu', '1999-03-17', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA18', 'Ashlie Elloy', 'Jl Villa Dago Boulevard Kompl Villa Dago Bl G/10, Dki Jakarta', '81039808440', 'aelloyh@t.co', '1983-05-20', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA19', 'Virgil Clutterbuck', 'Jl Margonda Raya 488, Dki Jakarta', '86006732874', 'vclutterbucki@ft.com', '1998-03-22', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA20', 'Chariot Huffadine', 'Jl Mangga Dua Raya Psr Pagi Mangga Dua Bl A/188, Dki Jakarta', '81254024034', 'chuffadinej@ebay.com', '1972-11-22', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA21', 'Lyndell Barti', 'Jln Pendidikan 3, Dki Jakarta', '82792276487', 'lbartik@trellian.com', '2004-06-17', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA22', 'Lee Dot', 'Jl Pembangunan II 15 A/1, Dki Jakarta', '89774964683', 'ldotl@etsy.com', '2002-12-18', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA23', 'Saloma Jacob', 'Jl Batu 1 Gambir Jakarta Pusat, Dki Jakarta', '81498926982', 'sjacobm@moonfruit.com', '1988-12-19', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA24', 'Thorny Dubbin', 'Kompl Pati ABRI F/24 Kuningan Tmr, Dki Jakarta', '82543248218', 'tdubbinn@ox.ac.uk', '1984-05-12', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA25', 'Hamlen Ryles', 'Jl Jend A Yani 286 Ged Graha Pangeran Unit 7/C-1 7th Fl, Jawa Timur', '89078717955', 'hryleso@exblog.jp', '1995-10-15', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA26', 'Andrew Ginnell', 'Jl P Jayakarta 141 Bl 2-D/17-18, Dki Jakarta', '81546125433', 'aginnellp@clickbank.net', '1994-09-06', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA27', 'Archibaldo Wanklyn', 'Jl Jelambar Jaya II 8, Dki Jakarta', '87948788158', 'awanklynq@prweb.com', '1968-07-21', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA28', 'Stewart Mustard', 'Jl KH Hasyim Ashari 33-O, Dki Jakarta', '88177679007', 'smustardr@phpbb.com', '1964-01-10', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA29', 'Bevin Carlino', 'Jl Jelambar Brt III/20, Dki Jakarta', '87072282157', 'bcarlinos@paypal.com', '1960-05-15', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA30', 'Orson MacGiffin', 'Psr Kecapi 12, Dki Jakarta', '83721927052', 'omacgiffint@marriott.com', '1977-04-13', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA31', 'Garold Onslow', 'Jl Ehave PLN Gandul, Dki Jakarta', '81141510588', 'gonslowu@blogs.com', '1979-08-12', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA32', 'Barry Steljes', 'Jl Kramat Raya 148 F, Dki Jakarta', '86378562628', 'bsteljesv@bigcartel.com', '1984-03-28', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA33', 'Meade Redington', 'Jl Sunan Muria 7 RT 007/015, Dki Jakarta', '83145220454', 'mredingtonw@wikipedia.org', '1992-02-15', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA34', 'Maitilde Cundey', 'Jl Melayu Besar 68, Dki Jakarta', '89473689365', 'mcundeyx@xrea.com', '1996-04-06', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA35', 'Judye Phillip', 'Psr Rawa Bening Bl CC/13 Rawa Bunga, Jakarta', '81589924398', 'jphillipy@facebook.com', '1995-06-08', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA36', 'Karel Stoggell', 'Jl Batu Tulis 16, Dki Jakarta', '85872264445', 'kstoggellz@globo.com', '1969-06-04', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA37', 'Genna Mechem', 'Jl Raden Saleh 51 Pav, Dki Jakarta', '82730586822', 'gmechem10@delicious.com', '1993-03-17', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA38', 'Tilly Wallwork', 'Jl Pulo Buaran II Bl R/2, Dki Jakarta', '85620409570', 'twallwork11@archive.org', '1979-04-29', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA39', 'Holt Rumbelow', 'Jl Keagungan 9, Dki Jakarta', '88558904715', 'hrumbelow12@tiny.cc', '1962-02-22', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA40', 'Yard Fiddler', 'Jl Cengkeh 16/17, Dki Jakarta', '81354446380', 'yfiddler13@delicious.com', '1967-10-10', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA41', 'Haywood Randles', 'Jl Krekot Bunder IV/125, Dki Jakarta', '82242025651', 'hrandles14@taobao.com', '2005-09-12', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA42', 'Fiona Passmore', 'Jl Tenggiri 2, Dki Jakarta', '81858210291', 'fpassmore15@gmpg.org', '1970-11-19', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA43', 'Donni OHaire', 'JL.SWASEMBADA BARAT XX NO.47, KEBON BAWANG, TANJUNG PRIOK', '83164568355', 'dohaire16@1688.com', '1961-05-12', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA44', 'Elena Badgers', 'Plaza Ciputat Mas Bl C/5 A Kav CDEF, Dki Jakarta', '82734861577', 'ebadgers17@mit.edu', '1994-03-15', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA45', 'Welsh Landeaux', 'Jl Krekot Jaya Bl E/3, Dki Jakarta', '81289839793', 'wlandeaux18@google.de', '1974-03-03', 'L');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA46', 'Win Piggford', 'Jl Muara Baru Ujung Bl S, Jakarta', '81394260350', 'wpiggford19@addtoany.com', '1967-05-26', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA47', 'Raddy Klazenga', 'Jl Suryopranoto 2 Kompl Harmoni Plaza Bl E/28, Dki Jakarta', '89925774888', 'rklazenga1a@live.com', '1982-06-13', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA48', 'Tracey Varey', 'Jl Bekasi Tmr II 30 RT 015/04, Dki Jakarta', '81307584054', 'tvarey1b@arizona.edu', '1971-10-17', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA49', 'Morie Davisson', 'Jl Kuningan Brt 56, Dki Jakarta', '88928959829', 'mdavisson1c@census.gov', '1979-04-17', 'P');
INSERT INTO siwanap.pasien (id_pasien, nama, alamat, no_telp, email, tgl_lahir, jenis_kelamin) VALUES ('PA50', 'Bobbye Elner', 'Jl TMII 42, Dki Jakarta', '86434766742', 'belner1d@rakuten.co.jp', '1992-05-28', 'P');


--
-- Data for Name: pemberian_obat; Type: TABLE DATA; Schema: siwanap; Owner: tara.mazaya
--

INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO01', 'SP44', 'OB34', '41 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO02', 'SP20', 'OB49', '65 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO03', 'SP57', 'OB13', '14 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO04', 'SP34', 'OB35', '99 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO05', 'SP97', 'OB37', '72 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO06', 'SP88', 'OB21', '12 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO07', 'SP78', 'OB06', '66 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO08', 'SP43', 'OB15', '75 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO09', 'SP01', 'OB11', '76 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO10', 'SP98', 'OB12', '68 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO11', 'SP22', 'OB01', '53 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO12', 'SP62', 'OB21', '22 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO13', 'SP64', 'OB42', '75 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO14', 'SP01', 'OB02', '70 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO15', 'SP84', 'OB33', '20 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO16', 'SP68', 'OB16', '92 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO17', 'SP75', 'OB44', '35 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO18', 'SP84', 'OB45', '65 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO19', 'SP22', 'OB05', '20 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO20', 'SP88', 'OB14', '99 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO21', 'SP53', 'OB25', '68 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO22', 'SP13', 'OB02', '43 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO23', 'SP28', 'OB21', '78 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO24', 'SP62', 'OB48', '28 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO25', 'SP75', 'OB23', '73 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO26', 'SP61', 'OB49', '25 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO27', 'SP12', 'OB10', '5 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO28', 'SP13', 'OB08', '94 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO29', 'SP97', 'OB22', '13 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO30', 'SP04', 'OB46', '68 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO31', 'SP19', 'OB39', '23 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO32', 'SP22', 'OB04', '45 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO33', 'SP99', 'OB16', '83 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO34', 'SP07', 'OB17', '11 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO35', 'SP31', 'OB49', '6 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO36', 'SP91', 'OB08', '15 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO37', 'SP68', 'OB23', '55 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO38', 'SP78', 'OB34', '26 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO39', 'SP26', 'OB47', '26 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO40', 'SP32', 'OB01', '7 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO41', 'SP11', 'OB36', '27 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO42', 'SP05', 'OB14', '49 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO43', 'SP15', 'OB02', '50 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO44', 'SP16', 'OB45', '38 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO45', 'SP58', 'OB17', '71 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO46', 'SP79', 'OB21', '25 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO47', 'SP38', 'OB34', '53 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO48', 'SP53', 'OB32', '19 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO49', 'SP52', 'OB08', '45 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO50', 'SP85', 'OB31', '10 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO51', 'SP90', 'OB25', '9 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO52', 'SP21', 'OB40', '47 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO53', 'SP30', 'OB45', '32 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO54', 'SP77', 'OB34', '69 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO55', 'SP24', 'OB19', '25 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO56', 'SP12', 'OB16', '62 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO57', 'SP20', 'OB22', '9 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO58', 'SP03', 'OB12', '33 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO59', 'SP89', 'OB47', '67 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO60', 'SP89', 'OB02', '54 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO61', 'SP99', 'OB23', '63 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO62', 'SP01', 'OB33', '54 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO63', 'SP20', 'OB09', '20 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO64', 'SP45', 'OB27', '66 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO65', 'SP29', 'OB12', '43 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO66', 'SP91', 'OB06', '68 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO67', 'SP62', 'OB08', '42 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO68', 'SP09', 'OB42', '70 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO69', 'SP57', 'OB41', '57 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO70', 'SP14', 'OB18', '68 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO71', 'SP68', 'OB07', '36 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO72', 'SP91', 'OB22', '67 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO73', 'SP42', 'OB06', '36 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO74', 'SP79', 'OB43', '68 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO75', 'SP77', 'OB04', '86 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO76', 'SP07', 'OB20', '75 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO77', 'SP50', 'OB40', '47 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO78', 'SP82', 'OB31', '15 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO79', 'SP58', 'OB35', '73 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO80', 'SP41', 'OB30', '43 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO81', 'SP55', 'OB12', '56 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO82', 'SP39', 'OB33', '23 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO83', 'SP34', 'OB05', '66 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO84', 'SP46', 'OB41', '22 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO85', 'SP86', 'OB34', '34 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO86', 'SP64', 'OB12', '91 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO87', 'SP73', 'OB25', '98 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO88', 'SP80', 'OB14', '80 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO89', 'SP35', 'OB20', '52 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO90', 'SP96', 'OB45', '78 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO91', 'SP33', 'OB13', '98 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO92', 'SP81', 'OB37', '13 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO93', 'SP32', 'OB10', '25 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO94', 'SP26', 'OB42', '53 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO95', 'SP23', 'OB43', '41 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO96', 'SP89', 'OB40', '5 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO97', 'SP72', 'OB44', '42 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO98', 'SP46', 'OB35', '80 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO99', 'SP71', 'OB20', '72 mg');
INSERT INTO siwanap.pemberian_obat (id_pemberian_obat, id_shift_perawat, id_obat, dosis) VALUES ('PO100', 'SP94', 'OB08', '60 mg');


--
-- Data for Name: perawat; Type: TABLE DATA; Schema: siwanap; Owner: tara.mazaya
--

INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE01', 'Asa Huddlestone', '084578304515', 'ahuddlestone0@businessinsider.com', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE02', 'Erina Georghiou', '085227801894', 'egeorghiou1@yelp.com', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE03', 'Jeanna Basilone', '089838398853', 'jbasilone2@furl.net', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE04', 'Gannie Stewart', '082141133165', 'gstewart3@mlb.com', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE05', 'Efrem Wikey', '086587160468', 'ewikey4@jigsy.com', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE06', 'Talbot Dust', '084354834510', 'tdust5@csmonitor.com', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE07', 'Sydel Fiveash', '084079342810', 'sfiveash6@yellowbook.com', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE08', 'Constantine Hukin', '081254798730', 'chukin7@google.com.au', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE09', 'Giacinta Graine', '081338605844', 'ggraine8@seesaa.net', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE10', 'Sayers Windmill', '082265157929', 'swindmill9@csmonitor.com', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE11', 'Mair Riddich', '089376194780', 'mriddicha@google.co.uk', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE12', 'Stanwood Redhole', '081661848974', 'sredholeb@cafepress.com', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE13', 'Noreen Agostini', '081599259095', 'nagostinic@about.com', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE14', 'Harli Lisciandro', '089888092944', 'hlisciandrod@irs.gov', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE15', 'Brannon Sebring', '085469789160', 'bsebringe@usatoday.com', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE16', 'Charyl Doorbar', '086351061660', 'cdoorbarf@economist.com', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE17', 'Sanderson Worg', '083770914651', 'sworgg@oakley.com', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE18', 'Russell Prestedge', '087575175601', 'rprestedgeh@shutterfly.com', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE19', 'Matthiew Flockhart', '082868873219', 'mflockharti@technorati.com', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE20', 'Clarabelle Gong', '081173374328', 'cgongj@globo.com', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE21', 'Karen Cotilard', '081302516078', 'kcotilardk@omniture.com', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE22', 'Clea Ebdin', '083017433463', 'cebdinl@ftc.gov', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE23', 'Dalis Rummings', '081381398278', 'drummingsm@google.ru', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE24', 'Jandy Bassingham', '088953069688', 'jbassinghamn@pen.io', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE25', 'Celle Veel', '087625832996', 'cveelo@ehow.com', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE26', 'Willow De Cruce', '085175931741', 'wdep@buzzfeed.com', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE27', 'Jeth Barlow', '085529041701', 'jbarlowq@tinypic.com', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE28', 'Mitchell Greger', '086521338439', 'mgregerr@chronoengine.com', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE29', 'Vonny Northway', '084801332978', 'vnorthways@bigcartel.com', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE30', 'Jarrett Bompass', '087495579595', 'jbompasst@shareasale.com', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE31', 'Kelcy Fraschini', '084659987329', 'kfraschiniu@google.it', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE32', 'Rafa Demare', '081681256401', 'rdemarev@sakura.ne.jp', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE33', 'Lizette Rodolico', '085849741984', 'lrodolicow@uiuc.edu', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE34', 'Shaughn Bernardotte', '084852720894', 'sbernardottex@huffingtonpost.com', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE35', 'Ella Arndell', '087453241219', 'earndelly@about.me', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE36', 'Teodor Schlag', '081495678007', 'tschlagz@nbcnews.com', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE37', 'Nobe Claye', '081253032172', 'nclaye10@artisteer.com', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE38', 'Ennis Mayston', '089701638247', 'emayston11@msn.com', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE39', 'Mellicent Crawley', '089047721632', 'mcrawley12@google.co.jp', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE40', 'Paige Dowell', '089288766146', 'pdowell13@gov.uk', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE41', 'Dasi Mirams', '081891579842', 'dmirams14@wired.com', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE42', 'Ossie Merriday', '084572431361', 'omerriday15@gmpg.org', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE43', 'Federica Blanden', '084478755558', 'fblanden16@economist.com', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE44', 'Thorndike Quiddinton', '083020969573', 'tquiddinton17@flavors.me', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE45', 'Corine Bouzan', '082024803547', 'cbouzan18@google.com.br', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE46', 'Gipsy Gullefant', '089545827319', 'ggullefant19@theguardian.com', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE47', 'Andrei Sandland', '085005433694', 'asandland1a@usnews.com', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE48', 'Jeremias Crickmore', '086551516106', 'jcrickmore1b@furl.net', 'P');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE49', 'Ula Lardeux', '087019940749', 'ulardeux1c@vk.com', 'L');
INSERT INTO siwanap.perawat (id_perawat, nama, no_telp, email, jenis_kelamin) VALUES ('PE50', 'Bella Prall', '084027794222', 'bprall1d@squarespace.com', 'P');


--
-- Data for Name: rawat_inap; Type: TABLE DATA; Schema: siwanap; Owner: tara.mazaya
--

INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI01', 'KA17', 'PA11', '2022-08-12', '2022-08-23');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI02', 'KA30', 'PA29', '2020-11-29', '2020-12-16');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI03', 'KA30', 'PA02', '2021-03-15', '2021-03-16');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI04', 'KA26', 'PA47', '2020-11-12', '2020-11-16');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI05', 'KA24', 'PA44', '2021-04-28', '2021-04-30');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI06', 'KA19', 'PA33', '2021-05-01', '2021-05-30');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI07', 'KA33', 'PA07', '2021-07-31', '2021-08-12');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI08', 'KA38', 'PA34', '2020-04-15', '2020-05-13');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI09', 'KA07', 'PA43', '2021-12-03', NULL);
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI10', 'KA13', 'PA12', '2020-12-02', '2020-12-15');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI11', 'KA21', 'PA48', '2021-07-02', '2021-07-06');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI12', 'KA11', 'PA34', '2020-10-16', '2020-10-28');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI13', 'KA02', 'PA22', '2022-01-19', '2022-01-25');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI14', 'KA36', 'PA14', '2022-01-01', '2022-01-04');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI15', 'KA24', 'PA44', '2020-04-26', '2020-05-18');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI16', 'KA09', 'PA08', '2022-03-27', '2022-04-21');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI17', 'KA19', 'PA09', '2020-10-19', '2020-11-17');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI18', 'KA10', 'PA43', '2021-08-10', '2021-08-18');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI19', 'KA38', 'PA20', '2022-07-24', '2022-08-22');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI20', 'KA31', 'PA49', '2020-11-29', '2020-12-11');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI21', 'KA40', 'PA29', '2020-12-25', '2021-01-23');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI22', 'KA01', 'PA12', '2020-10-17', '2020-11-14');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI23', 'KA30', 'PA06', '2021-12-06', '2021-12-16');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI24', 'KA40', 'PA27', '2022-05-27', '2022-05-31');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI25', 'KA23', 'PA28', '2022-01-02', '2022-01-20');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI26', 'KA22', 'PA36', '2020-03-21', '2020-03-23');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI27', 'KA42', 'PA42', '2021-01-15', '2021-02-12');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI28', 'KA08', 'PA22', '2020-06-04', '2020-06-12');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI29', 'KA30', 'PA22', '2021-12-27', NULL);
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI30', 'KA10', 'PA27', '2020-03-01', '2020-03-22');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI31', 'KA32', 'PA22', '2021-08-12', '2021-08-13');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI32', 'KA09', 'PA19', '2021-12-15', NULL);
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI33', 'KA05', 'PA02', '2020-01-06', '2020-01-08');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI34', 'KA25', 'PA46', '2020-08-03', '2020-08-29');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI35', 'KA12', 'PA03', '2020-06-24', '2020-07-13');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI36', 'KA29', 'PA05', '2022-09-05', '2022-09-13');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI37', 'KA15', 'PA01', '2022-05-17', '2022-06-09');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI38', 'KA04', 'PA21', '2020-07-07', '2020-07-19');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI39', 'KA38', 'PA01', '2020-12-23', '2021-01-21');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI40', 'KA17', 'PA49', '2021-08-11', '2021-08-13');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI41', 'KA40', 'PA40', '2022-06-07', '2022-06-27');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI42', 'KA15', 'PA28', '2022-06-28', '2022-07-19');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI43', 'KA25', 'PA25', '2021-12-03', NULL);
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI44', 'KA36', 'PA29', '2020-06-01', '2020-06-14');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI45', 'KA08', 'PA24', '2022-03-29', '2022-04-04');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI46', 'KA35', 'PA30', '2021-12-13', '2021-12-31');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI47', 'KA17', 'PA45', '2021-12-10', '2021-12-19');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI48', 'KA36', 'PA32', '2021-12-13', NULL);
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI49', 'KA10', 'PA23', '2020-09-10', '2020-09-17');
INSERT INTO siwanap.rawat_inap (id_rawat_inap, id_kamar, id_pasien, tgl_masuk, tgl_keluar) VALUES ('RI50', 'KA06', 'PA39', '2022-07-31', '2022-08-04');


--
-- Data for Name: shift_perawat; Type: TABLE DATA; Schema: siwanap; Owner: tara.mazaya
--

INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP01', 'PE02', 'RI23', '2021-12-07 00:00:00', '2021-12-07 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP02', 'PE05', 'RI14', '2022-02-02 00:00:00', '2022-02-02 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP03', 'PE39', 'RI49', '2020-09-11 00:00:00', '2020-09-11 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP04', 'PE27', 'RI42', '2022-06-29 00:00:00', '2022-06-29 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP05', 'PE39', 'RI10', '2020-12-03 00:00:00', '2020-12-03 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP06', 'PE04', 'RI36', '2022-09-06 00:00:00', '2022-09-06 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP07', 'PE31', 'RI05', '2021-04-29 00:00:00', '2021-04-29 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP08', 'PE34', 'RI01', '2022-08-13 00:00:00', '2022-08-13 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP09', 'PE47', 'RI05', '2021-04-29 12:00:00', '2021-04-30 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP10', 'PE34', 'RI28', '2020-06-05 00:00:00', '2020-06-05 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP11', 'PE41', 'RI15', '2020-04-27 00:00:00', '2020-04-27 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP12', 'PE15', 'RI04', '2020-11-13 00:00:00', '2020-11-13 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP13', 'PE35', 'RI01', '2022-08-13 12:00:00', '2022-08-14 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP14', 'PE28', 'RI26', '2020-03-22 00:00:00', '2020-03-22 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP15', 'PE46', 'RI16', '2022-03-28 00:00:00', '2022-03-28 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP16', 'PE20', 'RI22', '2020-10-18 00:00:00', '2020-10-18 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP17', 'PE27', 'RI13', '2022-01-20 00:00:00', '2022-01-20 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP18', 'PE47', 'RI24', '2022-05-26 00:00:00', '2022-05-26 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP19', 'PE35', 'RI45', '2022-03-30 00:00:00', '2022-03-30 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP20', 'PE26', 'RI27', '2021-01-16 00:00:00', '2021-01-16 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP21', 'PE33', 'RI30', '2020-03-02 00:00:00', '2020-03-02 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP22', 'PE24', 'RI24', '2022-05-26 12:00:00', '2022-05-27 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP23', 'PE05', 'RI10', '2020-12-03 12:00:00', '2020-12-04 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP24', 'PE34', 'RI36', '2022-09-06 12:00:00', '2022-09-07 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP25', 'PE13', 'RI31', '2021-08-13 00:00:00', '2021-08-13 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP26', 'PE30', 'RI36', '2022-09-07 00:00:00', '2022-09-07 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP27', 'PE42', 'RI29', '2021-12-28 00:00:00', '2021-12-28 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP28', 'PE03', 'RI27', '2021-01-16 12:00:00', '2021-01-17 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP29', 'PE36', 'RI20', '2020-11-30 00:00:00', '2020-11-30 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP30', 'PE13', 'RI14', '2022-02-02 12:00:00', '2022-02-03 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP31', 'PE11', 'RI25', '2022-01-03 00:00:00', '2022-01-03 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP32', 'PE17', 'RI37', '2022-05-18 00:00:00', '2022-05-18 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP33', 'PE02', 'RI07', '2021-08-01 00:00:00', '2021-08-01 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP34', 'PE22', 'RI43', '2021-12-04 00:00:00', '2021-12-04 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP35', 'PE13', 'RI37', '2022-05-18 12:00:00', '2022-05-19 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP36', 'PE19', 'RI02', '2020-11-30 00:00:00', '2020-11-30 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP37', 'PE45', 'RI40', '2021-08-12 00:00:00', '2021-08-12 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP38', 'PE26', 'RI07', '2021-08-01 12:00:00', '2021-08-02 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP39', 'PE19', 'RI14', '2022-02-03 00:00:00', '2022-02-03 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP40', 'PE49', 'RI42', '2022-06-29 12:00:00', '2022-06-30 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP41', 'PE10', 'RI09', '2021-12-04 00:00:00', '2021-12-04 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP42', 'PE43', 'RI43', '2021-12-04 12:00:00', '2021-12-05 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP43', 'PE17', 'RI07', '2021-08-02 00:00:00', '2021-08-02 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP44', 'PE28', 'RI32', '2021-12-16 00:00:00', '2021-12-16 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP45', 'PE38', 'RI31', '2021-08-13 12:00:00', '2021-08-14 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP46', 'PE31', 'RI11', '2021-07-03 00:00:00', '2021-07-03 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP47', 'PE11', 'RI23', '2021-12-07 12:00:00', '2021-12-08 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP48', 'PE35', 'RI41', '2022-06-08 00:00:00', '2022-06-08 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP49', 'PE46', 'RI35', '2020-06-25 00:00:00', '2020-06-25 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP50', 'PE41', 'RI40', '2021-08-12 12:00:00', '2021-08-13 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP51', 'PE41', 'RI29', '2021-12-28 12:00:00', '2021-12-29 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP52', 'PE41', 'RI26', '2020-03-22 12:00:00', '2020-03-23 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP53', 'PE45', 'RI26', '2020-03-23 00:00:00', '2020-03-23 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP54', 'PE22', 'RI15', '2020-04-27 12:00:00', '2020-04-28 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP55', 'PE20', 'RI38', '2020-07-08 00:00:00', '2020-07-08 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP56', 'PE13', 'RI13', '2022-01-20 12:00:00', '2022-01-21 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP57', 'PE44', 'RI27', '2021-01-17 00:00:00', '2021-01-17 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP58', 'PE24', 'RI13', '2022-01-21 00:00:00', '2022-01-21 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP59', 'PE09', 'RI21', '2020-12-26 00:00:00', '2020-12-26 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP60', 'PE28', 'RI27', '2021-01-17 12:00:00', '2021-01-18 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP61', 'PE40', 'RI29', '2021-12-29 00:00:00', '2021-12-29 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP62', 'PE07', 'RI03', '2021-03-16 00:00:00', '2021-03-16 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP63', 'PE31', 'RI17', '2020-10-20 00:00:00', '2020-10-20 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP64', 'PE39', 'RI39', '2020-12-24 00:00:00', '2020-12-24 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP65', 'PE14', 'RI37', '2022-05-19 00:00:00', '2022-05-19 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP66', 'PE04', 'RI03', '2021-03-16 12:00:00', '2021-03-17 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP67', 'PE26', 'RI02', '2020-11-30 12:00:00', '2020-12-01 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP68', 'PE25', 'RI39', '2020-12-24 12:00:00', '2020-12-25 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP69', 'PE35', 'RI13', '2022-01-21 12:00:00', '2022-01-22 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP70', 'PE18', 'RI06', '2021-05-02 00:00:00', '2021-05-02 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP71', 'PE13', 'RI17', '2020-10-20 12:00:00', '2020-10-21 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP72', 'PE42', 'RI24', '2022-05-27 00:00:00', '2022-05-27 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP73', 'PE09', 'RI34', '2020-08-04 00:00:00', '2020-08-04 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP74', 'PE02', 'RI35', '2020-06-25 12:00:00', '2020-06-26 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP75', 'PE45', 'RI38', '2020-07-08 12:00:00', '2020-07-09 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP76', 'PE10', 'RI15', '2020-04-28 00:00:00', '2020-04-28 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP77', 'PE17', 'RI03', '2021-03-17 00:00:00', '2021-03-17 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP78', 'PE43', 'RI48', '2021-12-14 00:00:00', '2021-12-14 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP79', 'PE30', 'RI09', '2021-12-04 12:00:00', '2021-12-05 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP80', 'PE49', 'RI33', '2020-01-07 00:00:00', '2020-01-07 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP81', 'PE12', 'RI18', '2021-08-11 00:00:00', '2021-08-11 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP82', 'PE45', 'RI25', '2022-01-03 12:00:00', '2022-01-04 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP83', 'PE30', 'RI10', '2020-12-04 00:00:00', '2020-12-04 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP84', 'PE20', 'RI46', '2021-12-14 00:00:00', '2021-12-14 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP85', 'PE38', 'RI12', '2020-10-17 00:00:00', '2020-10-17 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP86', 'PE43', 'RI22', '2020-10-18 12:00:00', '2020-10-19 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP87', 'PE26', 'RI03', '2021-03-17 12:00:00', '2021-03-18 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP88', 'PE25', 'RI13', '2022-01-22 00:00:00', '2022-01-22 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP89', 'PE47', 'RI38', '2020-07-09 00:00:00', '2020-07-09 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP90', 'PE07', 'RI09', '2021-12-05 00:00:00', '2021-12-05 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP91', 'PE28', 'RI25', '2022-01-04 00:00:00', '2022-01-04 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP92', 'PE23', 'RI11', '2021-07-03 12:00:00', '2021-07-04 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP93', 'PE27', 'RI41', '2022-06-08 12:00:00', '2022-06-09 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP94', 'PE10', 'RI44', '2020-06-02 00:00:00', '2020-06-02 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP95', 'PE41', 'RI05', '2021-04-30 00:00:00', '2021-04-30 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP96', 'PE05', 'RI47', '2021-12-11 00:00:00', '2021-12-11 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP97', 'PE49', 'RI39', '2020-12-25 00:00:00', '2020-12-25 12:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP98', 'PE14', 'RI37', '2022-05-19 12:00:00', '2022-05-20 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP99', 'PE19', 'RI14', '2022-02-03 12:00:00', '2022-02-04 00:00:00');
INSERT INTO siwanap.shift_perawat (id_shift_perawat, id_perawat, id_rawat_inap, waktu_mulai, waktu_akhir) VALUES ('SP100', 'PE11', 'RI38', '2020-07-09 12:00:00', '2020-07-10 00:00:00');


--
-- Name: dokter dokter_pk; Type: CONSTRAINT; Schema: siwanap; Owner: tara.mazaya
--

ALTER TABLE ONLY siwanap.dokter
    ADD CONSTRAINT dokter_pk PRIMARY KEY (id_dokter);


--
-- Name: dokter_rawat_inap dokter_rawat_inap_pkey; Type: CONSTRAINT; Schema: siwanap; Owner: tara.mazaya
--

ALTER TABLE ONLY siwanap.dokter_rawat_inap
    ADD CONSTRAINT dokter_rawat_inap_pkey PRIMARY KEY (id_dokter, id_rawat_inap);


--
-- Name: kamar kamar_pkey; Type: CONSTRAINT; Schema: siwanap; Owner: tara.mazaya
--

ALTER TABLE ONLY siwanap.kamar
    ADD CONSTRAINT kamar_pkey PRIMARY KEY (id_kamar);


--
-- Name: obat obat_pkey; Type: CONSTRAINT; Schema: siwanap; Owner: tara.mazaya
--

ALTER TABLE ONLY siwanap.obat
    ADD CONSTRAINT obat_pkey PRIMARY KEY (id_obat);


--
-- Name: pasien pasien_pk; Type: CONSTRAINT; Schema: siwanap; Owner: tara.mazaya
--

ALTER TABLE ONLY siwanap.pasien
    ADD CONSTRAINT pasien_pk PRIMARY KEY (id_pasien);


--
-- Name: pemberian_obat pemberian_obat_pkey; Type: CONSTRAINT; Schema: siwanap; Owner: tara.mazaya
--

ALTER TABLE ONLY siwanap.pemberian_obat
    ADD CONSTRAINT pemberian_obat_pkey PRIMARY KEY (id_pemberian_obat);


--
-- Name: perawat perawat_pk; Type: CONSTRAINT; Schema: siwanap; Owner: tara.mazaya
--

ALTER TABLE ONLY siwanap.perawat
    ADD CONSTRAINT perawat_pk PRIMARY KEY (id_perawat);


--
-- Name: rawat_inap rawat_inap_pkey; Type: CONSTRAINT; Schema: siwanap; Owner: tara.mazaya
--

ALTER TABLE ONLY siwanap.rawat_inap
    ADD CONSTRAINT rawat_inap_pkey PRIMARY KEY (id_rawat_inap);


--
-- Name: shift_perawat shift_perawat_pkey; Type: CONSTRAINT; Schema: siwanap; Owner: tara.mazaya
--

ALTER TABLE ONLY siwanap.shift_perawat
    ADD CONSTRAINT shift_perawat_pkey PRIMARY KEY (id_shift_perawat);


--
-- Name: dokter_rawat_inap dokter_rawat_inap_id_dokter_fkey; Type: FK CONSTRAINT; Schema: siwanap; Owner: tara.mazaya
--

ALTER TABLE ONLY siwanap.dokter_rawat_inap
    ADD CONSTRAINT dokter_rawat_inap_id_dokter_fkey FOREIGN KEY (id_dokter) REFERENCES siwanap.dokter(id_dokter) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dokter_rawat_inap dokter_rawat_inap_id_rawat_inap_fkey; Type: FK CONSTRAINT; Schema: siwanap; Owner: tara.mazaya
--

ALTER TABLE ONLY siwanap.dokter_rawat_inap
    ADD CONSTRAINT dokter_rawat_inap_id_rawat_inap_fkey FOREIGN KEY (id_rawat_inap) REFERENCES siwanap.rawat_inap(id_rawat_inap) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pemberian_obat pemberian_obat_id_obat_fkey; Type: FK CONSTRAINT; Schema: siwanap; Owner: tara.mazaya
--

ALTER TABLE ONLY siwanap.pemberian_obat
    ADD CONSTRAINT pemberian_obat_id_obat_fkey FOREIGN KEY (id_obat) REFERENCES siwanap.obat(id_obat) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pemberian_obat pemberian_obat_id_shift_perawat_fkey; Type: FK CONSTRAINT; Schema: siwanap; Owner: tara.mazaya
--

ALTER TABLE ONLY siwanap.pemberian_obat
    ADD CONSTRAINT pemberian_obat_id_shift_perawat_fkey FOREIGN KEY (id_shift_perawat) REFERENCES siwanap.shift_perawat(id_shift_perawat) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rawat_inap rawat_inap_id_kamar_fkey; Type: FK CONSTRAINT; Schema: siwanap; Owner: tara.mazaya
--

ALTER TABLE ONLY siwanap.rawat_inap
    ADD CONSTRAINT rawat_inap_id_kamar_fkey FOREIGN KEY (id_kamar) REFERENCES siwanap.kamar(id_kamar) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rawat_inap rawat_inap_id_pasien_fkey; Type: FK CONSTRAINT; Schema: siwanap; Owner: tara.mazaya
--

ALTER TABLE ONLY siwanap.rawat_inap
    ADD CONSTRAINT rawat_inap_id_pasien_fkey FOREIGN KEY (id_pasien) REFERENCES siwanap.pasien(id_pasien) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shift_perawat shift_perawat_id_perawat_fkey; Type: FK CONSTRAINT; Schema: siwanap; Owner: tara.mazaya
--

ALTER TABLE ONLY siwanap.shift_perawat
    ADD CONSTRAINT shift_perawat_id_perawat_fkey FOREIGN KEY (id_perawat) REFERENCES siwanap.perawat(id_perawat) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shift_perawat shift_perawat_id_rawat_inap_fkey; Type: FK CONSTRAINT; Schema: siwanap; Owner: tara.mazaya
--

ALTER TABLE ONLY siwanap.shift_perawat
    ADD CONSTRAINT shift_perawat_id_rawat_inap_fkey FOREIGN KEY (id_rawat_inap) REFERENCES siwanap.rawat_inap(id_rawat_inap) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

