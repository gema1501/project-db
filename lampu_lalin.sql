DROP DATABASE IF EXISTS lampu_lalin;
CREATE DATABASE IF NOT EXISTS lampu_lalin;

USE lampu_lalin;
CREATE TABLE tbl_lampu_lalin(
    warna_lampu enum("MERAH", "KUNING", "HIJAU") NOT NULL,
    PRIMARY KEY(warna_lampu)
);

INSERT INTO tbl_lampu_lalin VALUES
	("MERAH"),
    ("KUNING"),
    ("HIJAU");

SELECT warna_lampu as Lampu, 
IF(warna_lampu = "MERAH", "Berhenti",
IF(warna_lampu = "KUNING", "Hati-hati",
IF(warna_lampu = "HIJAU", "Silahkan Jalan!",
"Input salah"))) as Keterangan 
FROM tbl_lampu_lalin;

DELETE FROM tbl_lampu_lalin;