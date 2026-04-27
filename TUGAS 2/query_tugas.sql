-- =====================================================
-- GUNAKAN DATABASE
-- =====================================================
USE perpustakaan;

-- =====================================================
-- 1. TABEL KATEGORI_BUKU
-- =====================================================
CREATE TABLE kategori_buku (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(50) NOT NULL UNIQUE,
    deskripsi TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_deleted TINYINT(1) DEFAULT 0
);

-- =====================================================
-- 2. TABEL PENERBIT
-- =====================================================
CREATE TABLE penerbit (
    id_penerbit INT AUTO_INCREMENT PRIMARY KEY,
    nama_penerbit VARCHAR(100) NOT NULL,
    alamat TEXT,
    telepon VARCHAR(15),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_deleted TINYINT(1) DEFAULT 0
);

-- =====================================================
-- 3. TABEL RAK (BONUS)
-- =====================================================
CREATE TABLE rak (
    id_rak INT AUTO_INCREMENT PRIMARY KEY,
    kode_rak VARCHAR(20) NOT NULL UNIQUE,
    nama_rak VARCHAR(50) NOT NULL,
    lokasi VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_deleted TINYINT(1) DEFAULT 0
);

-- =====================================================
-- 4. INSERT KATEGORI
-- =====================================================
INSERT INTO kategori_buku (nama_kategori, deskripsi) VALUES
('Programming', 'Buku pemrograman'),
('Database', 'Buku database'),
('Web Design', 'Buku desain web'),
('Networking', 'Buku jaringan'),
('Security', 'Buku keamanan');

-- =====================================================
-- 5. INSERT PENERBIT
-- =====================================================
INSERT INTO penerbit (nama_penerbit, alamat, telepon, email) VALUES
('Informatika', 'Bandung', '022111111', 'info@informatika.com'),
('Andi', 'Yogyakarta', '027411111', 'andi@publisher.com'),
('Graha Ilmu', 'Yogyakarta', '027422222', 'graha@ilmu.com'),
('Elex Media', 'Jakarta', '021333333', 'elex@media.com'),
('Gramedia', 'Jakarta', '021444444', 'gramedia@store.com');

-- =====================================================
-- 6. INSERT RAK
-- =====================================================
INSERT INTO rak (kode_rak, nama_rak, lokasi) VALUES
('RK-A1', 'Rak A1', 'Lantai 1'),
('RK-A2', 'Rak A2', 'Lantai 1'),
('RK-B1', 'Rak B1', 'Lantai 2'),
('RK-C1', 'Rak C1', 'Lantai 2'),
('RK-D1', 'Rak D1', 'Lantai 3');

-- =====================================================
-- 7. TAMBAH KOLOM RELASI DI BUKU
-- =====================================================
ALTER TABLE buku
ADD COLUMN id_kategori INT,
ADD COLUMN id_penerbit INT,
ADD COLUMN id_rak INT,

-- =====================================================
-- 8. MAPPING DATA LAMA
-- =====================================================
UPDATE buku b
JOIN kategori_buku k ON b.kategori = k.nama_kategori
SET b.id_kategori = k.id_kategori;

UPDATE buku b
JOIN penerbit p ON b.penerbit = p.nama_penerbit
SET b.id_penerbit = p.id_penerbit;

-- =====================================================
-- 9. SET NOT NULL
-- =====================================================
ALTER TABLE buku
MODIFY id_kategori INT NOT NULL,
MODIFY id_penerbit INT NOT NULL;

-- =====================================================
-- 10. FOREIGN KEY
-- =====================================================
ALTER TABLE buku
ADD CONSTRAINT fk_kategori FOREIGN KEY (id_kategori) REFERENCES kategori_buku(id_kategori),
ADD CONSTRAINT fk_penerbit FOREIGN KEY (id_penerbit) REFERENCES penerbit(id_penerbit),
ADD CONSTRAINT fk_rak FOREIGN KEY (id_rak) REFERENCES rak(id_rak);

-- =====================================================
-- 11. HAPUS KOLOM LAMA
-- =====================================================
ALTER TABLE buku
DROP COLUMN kategori,
DROP COLUMN penerbit;

-- =====================================================
-- 12. TAMBAH 12 BUKU BARU
-- =====================================================
INSERT INTO buku 
(kode_buku, judul, id_kategori, id_penerbit, id_rak, pengarang, tahun_terbit, isbn, harga, stok, deskripsi)
VALUES
('BK-010', 'Python Dasar', 1, 1, 1, 'Andi', 2023, '111', 90000, 10, 'Python'),
('BK-011', 'Machine Learning', 1, 2, 2, 'Budi', 2024, '112', 150000, 6, 'ML'),
('BK-012', 'SQL Lanjut', 2, 3, 3, 'Citra', 2023, '113', 120000, 8, 'SQL'),
('BK-013', 'Database Optimasi', 2, 4, 4, 'Dedi', 2024, '114', 135000, 5, 'DB'),
('BK-014', 'UI UX', 3, 5, 5, 'Eka', 2023, '115', 90000, 12, 'UI'),
('BK-015', 'Frontend', 3, 1, 1, 'Fajar', 2024, '116', 110000, 7, 'FE'),
('BK-016', 'Jaringan Cisco', 4, 2, 2, 'Gilang', 2023, '117', 140000, 9, 'Cisco'),
('BK-017', 'Network Security', 4, 3, 3, 'Hadi', 2024, '118', 155000, 4, 'NetSec'),
('BK-018', 'Cyber Security', 5, 4, 4, 'Indra', 2024, '119', 170000, 3, 'Cyber'),
('BK-019', 'Ethical Hacking', 5, 5, 5, 'Joko', 2023, '120', 165000, 5, 'Hack'),
('BK-020', 'NodeJS API', 1, 1, 1, 'Budi Raharjo', 2024, '121', 100000, 11, 'API'),
('BK-021', 'Big Data', 2, 2, 2, 'Sari', 2024, '122', 180000, 6, 'Data');

-- =====================================================
-- 13. QUERY JOIN
-- =====================================================
SELECT b.judul, k.nama_kategori, p.nama_penerbit
FROM buku b
JOIN kategori_buku k ON b.id_kategori = k.id_kategori
JOIN penerbit p ON b.id_penerbit = p.id_penerbit;

-- =====================================================
-- 14. JUMLAH PER KATEGORI
-- =====================================================
SELECT k.nama_kategori, COUNT(*) AS jumlah
FROM buku b
JOIN kategori_buku k ON b.id_kategori = k.id_kategori
GROUP BY k.nama_kategori;

-- =====================================================
-- 15. JUMLAH PER PENERBIT
-- =====================================================
SELECT p.nama_penerbit, COUNT(*) AS jumlah
FROM buku b
JOIN penerbit p ON b.id_penerbit = p.id_penerbit
GROUP BY p.nama_penerbit;

-- =====================================================
-- 16. DETAIL LENGKAP
-- =====================================================
SELECT b.*, k.nama_kategori, p.nama_penerbit
FROM buku b
JOIN kategori_buku k ON b.id_kategori = k.id_kategori
JOIN penerbit p ON b.id_penerbit = p.id_penerbit;

-- =====================================================
-- 17. SOFT DELETE SEMUA TABEL
-- =====================================================
ALTER TABLE anggota ADD COLUMN is_deleted TINYINT(1) DEFAULT 0;
ALTER TABLE transaksi ADD COLUMN is_deleted TINYINT(1) DEFAULT 0;

-- =====================================================
-- 18. STORED PROCEDURE
-- =====================================================
DELIMITER $$

CREATE PROCEDURE tampil_buku()
BEGIN
    SELECT b.judul, k.nama_kategori, p.nama_penerbit, r.nama_rak
    FROM buku b
    JOIN kategori_buku k ON b.id_kategori = k.id_kategori
    JOIN penerbit p ON b.id_penerbit = p.id_penerbit
    LEFT JOIN rak r ON b.id_rak = r.id_rak;
END$$

DELIMITER ;