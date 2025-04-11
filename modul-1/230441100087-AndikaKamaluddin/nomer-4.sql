INSERT INTO KRS (nim, kodeMk, tahunAjaran, semester, nilai, nilaiAngka, statusMk, tanggalNilai, keterangan)
VALUES
('2023001', 'INF101', '2023/2024', 'Ganjil', 'A', 4.00, 'Selesai', '2024-12-09', 'Lulus dengan sangat baik'),
('2023001', 'INF102', '2023/2024', 'Genap', 'B', 3.00, 'Selesai', '2024-12-08', 'Lulus dengan baik'),
('2023002', 'INF101', '2023/2024', 'Ganjil', 'A', 4.00, 'Selesai', '2024-12-09', 'Lulus dengan sangat baik'),
('2023003', 'INF201', '2023/2024', 'Ganjil', 'B', 3.00, 'Selesai', '2024-12-10', 'Lulus dengan baik'),
('2023004', 'INF202', '2023/2024', 'Ganjil', 'A', 4.00, 'Selesai', '2024-12-10', 'Lulus dengan sangat baik');

SELECT * FROM KRS;
DELETE FROM KRS;

SELECT 
    k.idKrs,
    m.nim,
    m.nama AS namaMahasiswa,
    mk.kodeMk,
    mk.namaMk,
    mk.sks,
    k.nilai,
    k.nilaiAngka,
    k.tahunAjaran,
    k.semester,
    k.statusMk,
    k.tanggalNilai,
    k.keterangan
FROM 
    KRS k
JOIN 
    Mahasiswa m ON k.nim = m.nim
JOIN 
    MataKuliah mk ON k.kodeMk = mk.kodeMk
ORDER BY 
    m.nim, mk.kodeMk;