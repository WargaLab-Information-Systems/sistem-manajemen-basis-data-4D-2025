CREATE TABLE pelanggan (
    id_pelanggan INT PRIMARY KEY,
    nama_pelanggan VARCHAR(100) NOT NULL,
    alamat VARCHAR(255),
    no_telepon VARCHAR(20),
    email VARCHAR(100),
    tanggal_registrasi DATE,
    -- Add any other customer fields you might need
    CONSTRAINT uk_pelanggan_email UNIQUE (email)
);

CREATE TABLE transaksi (
    id_transaksi INT PRIMARY KEY,
    id_pelanggan INT NOT NULL,
    tanggal_transaksi DATE NOT NULL,
    total_transaksi DECIMAL(12, 2) NOT NULL,
    status_pembayaran VARCHAR(20),
    metode_pembayaran VARCHAR(50),
    -- Add any other transaction fields you might need
    CONSTRAINT fk_transaksi_pelanggan FOREIGN KEY (id_pelanggan) 
        REFERENCES pelanggan (id_pelanggan)
);

CREATE TABLE produk (
    id_produk INT PRIMARY KEY,
    nama_produk VARCHAR(100) NOT NULL,
    harga DECIMAL(10, 2) NOT NULL,
    stok INT NOT NULL DEFAULT 0,
    kategori VARCHAR(50),
    deskripsi TEXT,
    -- Add any other product fields you might need
    CONSTRAINT chk_produk_harga CHECK (harga > 0),
    CONSTRAINT chk_produk_stok CHECK (stok >= 0)
);

CREATE TABLE transaksi_detail (
    id_detail INT PRIMARY KEY,
    id_transaksi INT NOT NULL,
    id_produk INT NOT NULL,
    jumlah INT NOT NULL,
    harga_satuan DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(12, 2) NOT NULL,
    -- Add any other transaction detail fields you might need
    CONSTRAINT fk_detail_transaksi FOREIGN KEY (id_transaksi) 
        REFERENCES transaksi (id_transaksi),
    CONSTRAINT fk_detail_produk FOREIGN KEY (id_produk) 
        REFERENCES produk (id_produk),
    CONSTRAINT chk_detail_jumlah CHECK (jumlah > 0)
);

CREATE INDEX idx_transaksi_pelanggan ON transaksi (id_pelanggan);
CREATE INDEX idx_transaksi_tanggal ON transaksi (tanggal_transaksi);
CREATE INDEX idx_detail_transaksi ON transaksi_detail (id_transaksi);
CREATE INDEX idx_detail_produk ON transaksi_detail (id_produk);

INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, alamat, no_telepon, email, tanggal_registrasi) VALUES
(1, 'Budi Santoso', 'Jl. Merdeka No. 123, Jakarta', '081234567890', 'budi@example.com', '2023-01-15'),
(2, 'Siti Rahayu', 'Jl. Pahlawan No. 45, Bandung', '082345678901', 'siti@example.com', '2023-02-20'),
(3, 'Ahmad Hidayat', 'Jl. Sudirman No. 67, Surabaya', '083456789012', 'ahmad@example.com', '2023-03-10'),
(4, 'Dewi Kusuma', 'Jl. Diponegoro No. 89, Yogyakarta', '084567890123', 'dewi@example.com', '2023-04-05'),
(5, 'Eko Prasetyo', 'Jl. Gatot Subroto No. 12, Semarang', '085678901234', 'eko@example.com', '2023-05-25');

-- Insert data into produk (product) table
INSERT INTO produk (id_produk, nama_produk, harga, stok, kategori, deskripsi) VALUES
(1, 'Laptop Asus ROG', 15000000.00, 10, 'Elektronik', 'Laptop gaming dengan spesifikasi tinggi'),
(2, 'Smartphone Samsung Galaxy', 8000000.00, 15, 'Elektronik', 'Smartphone dengan kamera terbaik'),
(3, 'Headphone Sony', 2000000.00, 20, 'Aksesoris', 'Headphone dengan noise cancelling'),
(4, 'Printer Epson', 3500000.00, 8, 'Elektronik', 'Printer multifungsi dengan scanner'),
(5, 'Mouse Logitech', 500000.00, 25, 'Aksesoris', 'Mouse gaming dengan DPI tinggi'),
(6, 'Keyboard Mechanical', 1200000.00, 12, 'Aksesoris', 'Keyboard gaming dengan switch blue'),
(7, 'Monitor LG 27 inch', 3000000.00, 7, 'Elektronik', 'Monitor dengan refresh rate 144Hz'),
(8, 'Power Bank 20000mAh', 450000.00, 30, 'Aksesoris', 'Power bank dengan fast charging');

INSERT INTO transaksi (id_transaksi, id_pelanggan, tanggal_transaksi, total_transaksi, status_pembayaran, metode_pembayaran) VALUES
(1, 1, '2023-06-10', 15500000.00, 'Lunas', 'Transfer Bank'),
(2, 1, '2023-07-15', 2000000.00, 'Lunas', 'Kartu Kredit'),
(3, 2, '2023-06-20', 8000000.00, 'Lunas', 'Transfer Bank'),
(4, 2, '2023-08-05', 3500000.00, 'Lunas', 'E-Wallet'),
(5, 3, '2023-07-25', 500000.00, 'Lunas', 'Transfer Bank'),
(6, 3, '2023-09-12', 1200000.00, 'Lunas', 'Kartu Debit'),
(7, 4, '2023-08-18', 3000000.00, 'Lunas', 'Transfer Bank'),
(8, 5, '2023-09-22', 15000000.00, 'Lunas', 'Kartu Kredit'),
(9, 1, '2023-10-05', 8450000.00, 'Lunas', 'E-Wallet'),
(10, 2, '2023-10-10', 2700000.00, 'Lunas', 'Transfer Bank');

INSERT INTO transaksi_detail (id_detail, id_transaksi, id_produk, jumlah, harga_satuan, subtotal) VALUES
(1, 1, 1, 1, 15000000.00, 15000000.00),
(2, 1, 5, 1, 500000.00, 500000.00),
(3, 2, 3, 1, 2000000.00, 2000000.00),
(4, 3, 2, 1, 8000000.00, 8000000.00),
(5, 4, 4, 1, 3500000.00, 3500000.00),
(6, 5, 5, 1, 500000.00, 500000.00),
(7, 6, 3, 1, 2000000.00, 2000000.00),
(8, 7, 7, 1, 3000000.00, 3000000.00),
(9, 8, 1, 1, 15000000.00, 15000000.00),
(10, 9, 2, 1, 8000000.00, 8000000.00),
(11, 9, 5, 1, 450000.00, 450000.00),
(12, 10, 3, 1, 2000000.00, 2000000.00),
(13, 10, 7, 1, 700000.00, 700000.00);

SELECT * FROM pelanggan
SELECT * FROM produk
SELECT * FROM transaksi
SELECT * FROM transaksi_detail