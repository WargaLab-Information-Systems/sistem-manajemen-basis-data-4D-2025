INSERT INTO Mahasiswa (nim, nama, jenisKelamin, tanggalLahir, alamat, noTelp, email, programStudi, angkatan, STATUS)
VALUES
('2023001', 'Budi Santoso', 'L', '2000-05-15', 'Jl. Merdeka No. 10, Jakarta', '081234567890', 'budi@example.com', 'Teknik Informatika', 2023, 'Aktif'),
('2023002', 'Siti Nurhaliza', 'P', '2001-03-20', 'Jl. Pahlawan No. 5, Bandung', '082345678901', 'siti@example.com', 'Teknik Informatika', 2023, 'Aktif'),
('2023003', 'Ahmad Rizki', 'L', '2000-11-10', 'Jl. Sudirman No. 15, Surabaya', '083456789012', 'ahmad@example.com', 'Sistem Informasi', 2023, 'Aktif'),
('2023004', 'Dewi Lestari', 'P', '2001-07-25', 'Jl. Gatot Subroto No. 8, Yogyakarta', '084567890123', 'dewi@example.com', 'Sistem Informasi', 2023, 'Aktif'),
('2023005', 'Rudi Hermawan', 'L', '2000-09-05', 'Jl. Ahmad Yani No. 20, Semarang', '085678901234', 'rudi@example.com', 'Teknik Komputer', 2023, 'Aktif'),
('2023006', 'Rina Wijaya', 'P', '2001-01-30', 'Jl. Diponegoro No. 12, Malang', '086789012345', 'rina@example.com', 'Teknik Komputer', 2023, 'Aktif'),
('2023007', 'Doni Kusuma', 'L', '2000-08-17', 'Jl. Imam Bonjol No. 7, Medan', '087890123456', 'doni@example.com', 'Teknik Informatika', 2023, 'Aktif'),
('2023008', 'Maya Indah', 'P', '2001-04-12', 'Jl. Veteran No. 9, Makassar', '088901234567', 'maya@example.com', 'Sistem Informasi', 2023, 'Aktif'),
('2023009', 'Eko Prasetyo', 'L', '2000-12-03', 'Jl. Thamrin No. 25, Palembang', '089012345678', 'eko@example.com', 'Teknik Komputer', 2023, 'Aktif'),
('2023010', 'Lina Sari', 'P', '2001-06-22', 'Jl. Gajah Mada No. 18, Denpasar', '081123456789', 'lina@example.com', 'Teknik Informatika', 2023, 'Aktif');

INSERT INTO Dosen (nip, nama, jenisKelamin, tanggalLahir, alamat, noTelp, email, bidangKeahlian, jabatan, STATUS)
VALUES
('198001152005011001', 'Dr. Agus Wijaya', 'L', '1980-01-15', 'Jl. Cendana No. 5, Jakarta', '081234567891', 'agus@university.ac.id', 'Artificial Intelligence', 'Lektor Kepala', 'Aktif'),
('198203202006012002', 'Dr. Sinta Dewi, M.Kom', 'P', '1982-03-20', 'Jl. Melati No. 10, Bandung', '082345678902', 'sinta@university.ac.id', 'Database Systems', 'Lektor', 'Aktif'),
('197905102004011003', 'Prof. Budi Hartono', 'L', '1979-05-10', 'Jl. Anggrek No. 15, Surabaya', '083456789013', 'budi@university.ac.id', 'Computer Networks', 'Guru Besar', 'Aktif'),
('198107252007012004', 'Dr. Rina Anggraini', 'P', '1981-07-25', 'Jl. Dahlia No. 8, Yogyakarta', '084567890124', 'rina@university.ac.id', 'Software Engineering', 'Lektor', 'Aktif'),
('197809052003011005', 'Dr. Hadi Santoso', 'L', '1978-09-05', 'Jl. Mawar No. 20, Semarang', '085678901235', 'hadi@university.ac.id', 'Cybersecurity', 'Lektor Kepala', 'Aktif'),
('198301302008012006', 'Dr. Maya Putri, M.Sc', 'P', '1983-01-30', 'Jl. Kenanga No. 12, Malang', '086789012346', 'maya@university.ac.id', 'Data Science', 'Lektor', 'Aktif'),
('197708172002011007', 'Prof. Dedi Kurniawan', 'L', '1977-08-17', 'Jl. Tulip No. 7, Medan', '087890123457', 'dedi@university.ac.id', 'Machine Learning', 'Guru Besar', 'Aktif'),
('198404122009012008', 'Dr. Lina Wati', 'P', '1984-04-12', 'Jl. Kamboja No. 9, Makassar', '088901234568', 'lina@university.ac.id', 'Human-Computer Interaction', 'Lektor', 'Aktif'),
('197612032001011009', 'Dr. Eko Susanto', 'L', '1976-12-03', 'Jl. Teratai No. 25, Palembang', '089012345679', 'eko@university.ac.id', 'Mobile Computing', 'Lektor Kepala', 'Aktif'),
('198506222010012010', 'Dr. Dewi Anggraeni, M.T', 'P', '1985-06-22', 'Jl. Bougenville No. 18, Denpasar', '081123456780', 'dewi@university.ac.id', 'Computer Graphics', 'Lektor', 'Aktif');

INSERT INTO MataKuliah (kodeMk, namaMk, sks, semester, deskripsi, nipDosenPengampu)
VALUES
('INF101', 'Algoritma Pemrograman', 3, 1, 'Mata kuliah dasar tentang logika dan konsep pemrograman', '198001152005011001'),
('INF102', 'Struktur Data', 4, 2, 'Mempelajari struktur data dasar', '198203202006012002'),
('INF201', 'Basis Data', 3, 3, 'Konsep dan implementasi basis data', '198203202006012002'),
('INF202', 'Desain Manajemen Jaringan', 3, 3, 'Dasar-dasar jaringan pada komputer', '197905102004011003'),
('INF301', 'Analisa Proses Bisnis', 3, 5, 'Tentang proses bisnis sistem informasi', '198001152005011001'),
('INF302', 'Rekayasa Perangkat Lunak', 4, 5, 'Metodologi pengembangan perangkat lunak', '198107252007012004'),
('INF401', 'Keamanan Informasi', 3, 7, 'Konsep dan praktik keamanan informasi', '197809052003011005'),
('INF402', 'Data Mining', 3, 7, 'Teknik penggalian data', '198301302008012006'),
('INF403', 'Pemrograman Bergerak', 3, 6, 'Pengembangan aplikasi mobile', '197612032001011009'),
('INF404', 'Interaksi Manusia dan Komputer', 3, 4, 'Desain antarmuka yang berpusat pada pengguna', '198404122009012008');

-- delete from MataKuliah;