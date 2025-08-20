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
SELECT nip, nama, DATE_FORMAT( CAST(SUBSTRING(nip, 1, 8) as DATE), '%W, %d-%m-%Y' ) as Tanggal_Lahir, 
CONCAT(SUBSTRING(nip, 9, 4), '-' , ELT(SUBSTRING(nip, 13, 2), 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 
              'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember')) as Tanggal_PNS,
IF(SUBSTRING(nip, 15, 1) = 1, "PRIA", "WANITA") as Jenis_Kelamin ,
SUBSTRING(nip, 16, 3) as No_Urut
FROM tb_data_pns;

DROP TABLE tb_data_pns;

-- SELECT *, SUBSTRING((SELECT nip FROM tb_data_pns), 1, 4) FROM tb_data_pns;