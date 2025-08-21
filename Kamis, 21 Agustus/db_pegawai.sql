DROP DATABASE IF EXISTS db_pegawai;
CREATE DATABASE IF NOT EXISTS db_pegawai;

use db_pegawai;

CREATE TABLE IF NOT EXISTS tb_data_asn(
	nip bigint NOT NULL,
    nama varchar(255) NOT NULL,
    PRIMARY KEY(nip)
);

INSERT INTO tb_data_asn(nip, nama) VALUES
(197209172005011002, "Mohamad Septiawan"),
(198201202021012004, "Damayanti"),
(200901202020011003, "Mohamad Naufal Dzakiy"),
(201407142022011008, "Mohamad Tsaniy Atila Dzaka"),
(201511142023012002, "Nabila Tsalsa Nuraisyah");

# update record 
update tb_data_asn set nama = 'M. Septiawan' where nip = 197209172005011002;

#delete
-- delete from tb_data_asn where nip = 197209172005011002;

# create index
create index idx_nama on tb_data_asn(nama);

#show index
show index from tb_data_asn;

#drop index
-- drop index idx_nama on tb_data_asn;

---

#create view
create view vw_asn as SELECT nip as 'NIP ASN', nama as 'Nama ASN' from tb_data_asn;

# display view
select * from vw_asn;

#repair view
alter view vw_asn as select nama from asn;

#drop view
drop view vw_asn;

---

create view vw_asn_jns_kelamin as
	select nip, nama, if(mid(nip, 15, 1) = '1',
			'Pria',
			'Wanita'
		) AS kelamin
    FROM tb_data_asn;
SELECT * FROM vw_asn_jns_kelamin;

describe tb_data_asn;