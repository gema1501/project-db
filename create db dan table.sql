CREATE DATABASE IF NOT EXISTS pbl;

USE pbl;

describe tbl_registrasi;

-- create table tbl_registrasi(
-- 	id tinyint,
--     nama varchar(25),
--     tinggal varchar(25)
-- ); # membuat table

INSERT tbl_registrasi (id, nama, tinggal) 
VALUES (1, "Gema", "Waas"); 

DELETE FROM tbl_registrasi; # menghapus seluruh record table

ALTER TABLE `pbl`.`tbl_registrasi` 
CHANGE COLUMN `id` `id` TINYINT NOT NULL ,
ADD PRIMARY KEY (`id`);

SELECT * FROM tbl_registrasi;

select distinct tinggal from tbl_registrasi;

-- drop database akuntansi; 