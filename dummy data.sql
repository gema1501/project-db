ALTER TABLE tbl_registrasi MODIFY COLUMN id tinyint AUTO_INCREMENT; 
INSERT INTO tbl_registrasi (nama, tinggal) VALUES
  ('Andi', 'Jakarta'),
  ('Budi', 'Bandung'),
  ('Citra', 'Surabaya'),
  ('Dewi', 'Medan'),
  ('Eka', 'Yogyakarta'),
  ('Fajar', 'Malang'),
  ('Gita', 'Semarang'),
  ('Hadi', 'Palembang'),
  ('Indah', 'Denpasar'),
  ('Joko', 'Balikpapan'),
  ('Kiki', 'Bogor'),
  ('Lina', 'Padang'),
  ('Mira', 'Makassar'),
  ('Nina', 'Tasikmalaya'),
  ('Oki', 'Bandung'),
  ('Putu', 'Denpasar'),
  ('Qori', 'Jakarta'),
  ('Rina', 'Surabaya'),
  ('Sari', 'Malang'),
  ('Tono', 'Medan');
  
  SELECT * FROM tbl_registrasi;
  SELECT DISTINCT tinggal from tbl_registrasi;
  # SELECT * from tbl_registrasi WHERE tinggal = "Bandung";
  # SELECT Count(*) FROM (SELECT DISTINCT tinggal FROM tbl_registrasi);
  SELECT COUNT(*) FROM tbl_registrasi WHERE tinggal = "Bandung";