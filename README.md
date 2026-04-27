# Tugas 2 - Desain Database Perpustakaan

Dokumen ini berisi penjelasan setiap query, hasil implementasi, serta screenshot dari database perpustakaan.

---

## Query 1: Membuat tabel `kategori_buku`
Query ini digunakan untuk membuat tabel kategori.

![Query 1](ss2/query_1.png)

---

## Query 2: Membuat tabel `penerbit`
Query ini digunakan untuk membuat tabel penerbit.

![Query 2](ss2/query_2.png)

---

## Query 3: Membuat tabel `rak`
Query ini digunakan untuk membuat tabel rak sebagai lokasi penyimpanan buku.

![Query 3](ss2/query_3.png)

---

## Query 4: Insert data kategori buku
Query ini digunakan untuk menambahkan data kategori buku.

### Isi tabel kategori_buku
![Kategori Buku](ss2/isi_tabel_kategori_buku.png)

![Query 4](ss2/query_4.png)

---

## Query 5: Insert data penerbit
Query ini digunakan untuk menambahkan data penerbit.

### Isi tabel penerbit
![Penerbit](ss2/isi_tabel_penerbit.png)

![Query 5](ss2/query_5.png)

---

## Query 6: Insert data rak
Query ini digunakan untuk menambahkan data rak.

### Isi tabel rak
![Rak](ss2/isi_tabel_rak.png)

![Query 6](ss2/query_6.png)

---

## Query 7: Menambahkan kolom relasi pada tabel buku
Query ini digunakan untuk menambahkan kolom:
- id_kategori
- id_penerbit
- id_rak

![Query 7](ss2/query_7.png)

---

## Query 8: Mapping kategori lama
Query ini digunakan untuk menghubungkan kategori lama ke tabel kategori_buku.

![Query 8](ss2/query_8.png)

---

## Query 9: Mapping penerbit lama
Query ini digunakan untuk menghubungkan penerbit lama ke tabel penerbit.

![Query 9](ss2/query_9.png)

---

## Query 10: Menambahkan foreign key
Query ini digunakan untuk membuat relasi antar tabel menggunakan foreign key.

![Query 10](ss2/query_10.png)

---

## Query 11: Menghapus kolom lama
Query ini digunakan untuk menghapus kolom kategori dan penerbit lama.

![Query 11](ss2/query_11.png)

---

## Query 12: Menambahkan 12 buku baru
Query ini digunakan untuk memenuhi minimal jumlah buku.

### Isi tabel buku
![Isi Buku](ss2/isi tabel buku.png)

![Query 12](ss2/query_12.png)

---

## Query 13: JOIN buku, kategori, penerbit
Query ini digunakan untuk menampilkan data buku beserta kategori dan penerbit.

![Query 13](ss2/query_13.png)

---

## Query 14: Jumlah buku per kategori
Query ini digunakan untuk menghitung jumlah buku per kategori.

![Query 14](ss2/query_14.png)

---

## Query 15: Jumlah buku per penerbit
Query ini digunakan untuk menghitung jumlah buku per penerbit.

![Query 15](ss2/query_15.png)

---

## Query 16: Detail lengkap buku
Query ini digunakan untuk menampilkan semua informasi buku.

![Query 16](ss2/query_16.png)

---

## Query 17: Implementasi soft delete
Query ini digunakan untuk menambahkan kolom is_deleted.

![Query 17](ss2/query_17.png)

---

## Data Tabel Tambahan

### Isi tabel anggota
![Anggota](ss2/isi_tabel_anggota.png)

### Isi tabel transaksi
![Transaksi](ss2/isi_tabel_transaksi.png)

---

## Query 18: Stored Procedure
Query ini digunakan untuk membuat procedure agar query JOIN bisa dipanggil ulang.

![Query 18](ss2/query_18.png) 

### Cara Pakai
Untuk menjalankan stored procedure, gunakan perintah berikut:

```sql
CALL tampil_buku();
```

![Hasil](ss2/cara_panggil_query_18.png) 

---

## ERD Database Perpustakaan

ERD menggambarkan hubungan antar tabel dalam database.

![ERD](ss2/ERD_Database_Perpustakaan.png)

---
