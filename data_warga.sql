DROP DATABASE IF EXISTS data_warga;
CREATE DATABASE IF NOT EXISTS data_warga;

USE data_warga;

CREATE TABLE IF NOT EXISTS tbl_data_warga(
	id TINYINT NOT NULL AUTO_INCREMENT,
    nama VARCHAR(255),
    kelamin ENUM("Pria", "Wanita"),
    status ENUM("Sendiri", "Nikah", "Cerai"),
    PRIMARY KEY(id)
);

-- CREATE TABLE tbl_keterangan(
-- 	id TINYINT NOT NULL AUTO_INCREMENT,
--     keterangan ENUM("Perjaka", "Kawin", "Duda"),
--     PRIMARY KEY(id)
-- );

INSERT INTO tbl_data_warga (nama, kelamin, status) VALUES
("Abdul", "Pria", "Sendiri"),
("Wahab", "Pria", "Nikah"),
("Toni", "Pria", "Cerai"),
("Santi", "Wanita", "Sendiri"),
("Nia", "Wanita", "Nikah"),
("Tini", "Wanita", "Cerai");

-- INSERT INTO tbl_keterangan VALUES
-- ("Perjaka", "Kawin", "Duda", "Perawan", "Kawin", "Janda");

CREATE VIEW vw_keterangan as
SELECT *, 
CASE
    WHEN kelamin = "Pria" then
		IF(status = "Sendiri", "Perjaka",
        IF(status = "Nikah", "Kawin", "Cerai"))
	WHEN kelamin = "Wanita" then
		IF(status = "Sendiri", "Perawan",
        IF(status = "Nikah", "Kawin", "Janda"))
    ELSE "Data tidak ada!"
END
as Keterangan 
FROM
tbl_data_warga;
