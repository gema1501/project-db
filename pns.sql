DROP DATABASE IF EXISTS db_pns;
CREATE DATABASE IF NOT EXISTS db_pns;

use db_pns;

CREATE TABLE tb_data_pns(
	nip bigint NOT NULL,
    nama varchar(255) NOT NULL,
    PRIMARY KEY(nip)
);

INSERT INTO tb_data_pns(nip, nama) VALUES
(197209172005011002, "Mohamad Septiawan"),
(198201202021012004, "Damayanti"),
(200901202020011003, "Mohamad Naufal Dzakiy"),
(201407142022011008, "Mohamad Tsaniy Atila Dzaka"),
(201511142023012002, "Nabila Tsalsa Nuraisyah");

-- SELECT SUBSTRING((SELECT nip FROM tb_data_pns), 1, 4) as tahun;

# data jadi
-- SELECT nip, nama, CAST(SUBSTRING(nip, 1, 8) as DATE) as Tanggal_Lahir, 
-- CONCAT(SUBSTRING(nip, 9, 4), '-' , ELT(SUBSTRING(nip, 13, 2), 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 
--               'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember')) as Tanggal_PNS,
-- IF(SUBSTRING(nip, 15, 1) = 1, "PRIA", "WANITA") as Jenis_Kelamin ,
-- SUBSTRING(nip, 16, 3) as No_Urut
-- FROM tb_data_pns;

# Experiment
CREATE VIEW info_pns AS SELECT nip, nama, DATE_FORMAT( CAST(SUBSTRING(nip, 1, 8) as DATE), '%W, %d-%m-%Y' ) as Tanggal_Lahir, 
CONCAT(SUBSTRING(nip, 9, 4), '-' , ELT(SUBSTRING(nip, 13, 2), 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 
              'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember')) as Tanggal_PNS,
IF(SUBSTRING(nip, 15, 1) = 1, "PRIA", "WANITA") as Jenis_Kelamin ,
SUBSTRING(nip, 16, 3) as No_Urut
FROM tb_data_pns;

-- SELECT * FROM info_pns;

CREATE TABLE tb_agama (
	kode char(3) primary key,
    nm_agama varchar(9)
);

-- drop table tb_agama;

-- DESCRIBE agama;
-- show table status from db_pns;
-- show create table agama;


DELIMITER $$
CREATE PROCEDURE proc_ins_agama(
    pkode CHAR(1),
    pnama VARCHAR(9)
)
BEGIN
    INSERT INTO tb_agama(kode, nm_agama) 
    VALUES (pkode, pnama);
END $$
DELIMITER ;

DROP PROCEDURE proc_agama;

DESCRIBE tb_agama;

CALL proc_ins_agama('1', 'Islam');
CALL proc_ins_agama('2', 'Hindu');
CALL proc_ins_agama('3', 'Budhha');
CALL proc_ins_agama('4', 'Konghucu');
CALL proc_ins_agama('5', 'Kristen P');
CALL proc_ins_agama('6', 'Kristen K');
CALL proc_ins_agama('7', 'Percaya');

select * from tb_agama;

DELIMITER $$
CREATE PROCEDURE proc_input_data (
	pId char(17),
    pNama varchar(255),
    pKodeAgama char(1)
)
BEGIN
	INSERT INTO tb_data_pns(nip, nama) VALUES (pId, pNama);
END $$
DELIMITER ;

ALTER TABLE tb_data_pns ADD COLUMN idAgama tinyint; 

CALL proc_input_data(12345678010123456, "Albertus", "2");
CALL proc_input_data(65432181071298765, "Antonius", "3");
CALL proc_input_data(23456790041545612, "Weni", "4");
CALL proc_input_data(34567892080234567, "I Ketut", "5");
CALL proc_input_data(87654379090112345, "Mey Lan", "6");

DELIMITER $$
CREATE PROCEDURE proc_upd_id(
	upd_nip bigint,
    upd_nama varchar(255),
    upd_agama int
)
BEGIN
	UPDATE tb_data_pns SET idAgama = upd_agama WHERE nip = upd_nip;
END $$
DELIMITER ;

CALL proc_upd_id(12345678010123456, "Albertus", "2");
CALL proc_upd_id(65432181071298765, "Antonius", "3");
CALL proc_upd_id(23456790041545612, "Weni", "4");
CALL proc_upd_id(34567892080234567, "I Ketut", "5");
CALL proc_upd_id(87654379090112345, "Mey Lan", "6");
CALL proc_upd_id(197209172005011002, "Mohamad Septiawan", "1");
CALL proc_upd_id(198201202021012004, "Damayanti", "1");
CALL proc_upd_id(200901202020011003, "Mohamad Naufal Dzakiy", "1");
CALL proc_upd_id(201407142022011008, "Mohamad Tsaniy Atila Dzaka", "1");
CALL proc_upd_id(201511142023012002, "Nabila Tsalsa Nuraisyah", "1");

-- select * from agama;
-- SELECT *, SUBSTRING((SELECT nip FROM tb_data_pns), 1, 4) FROM tb_data_pns;