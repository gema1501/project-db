CREATE DATABASE IF NOT EXISTS test;

USE test;
CREATE TABLE tbl_test(
	id tinyint NOT NULL AUTO_INCREMENT,
    warna_lampu ENUM("Merah", "Kuning", "Hijau"),
    keterangan varchar(255),
    PRIMARY KEY(id)
);

-- insert into tbl_test(warna_lampu, keterangan) values 
-- ("Merah", "Berhenti"),
-- ("Kuning", "Berhati-hati"),
-- ("Hijau", "Silahkan Jalan!");

insert into tbl_test(warna_lampu, keterangan) values("Biru", "Pergi");