-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Apr 2024 pada 16.43
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kasir`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tab_detail_penjualan`
--

CREATE TABLE `tab_detail_penjualan` (
  `no_detail` int(11) NOT NULL,
  `no_penjualan` int(11) NOT NULL,
  `no_produk` int(11) NOT NULL,
  `jumlah_produk` int(11) NOT NULL,
  `sub_total` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tab_detail_penjualan`
--

INSERT INTO `tab_detail_penjualan` (`no_detail`, `no_penjualan`, `no_produk`, `jumlah_produk`, `sub_total`) VALUES
(1, 20240001, 1, 5, '850000.00'),
(2, 20240001, 2, 2, '201000.00'),
(3, 20240001, 5, 27, '162000.00'),
(4, 20240002, 5, 23, '138000.00'),
(5, 20240002, 4, 5, '11000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tab_pelanggan`
--

CREATE TABLE `tab_pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(151) NOT NULL,
  `alamat` text NOT NULL,
  `no_telepon` varchar(21) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tab_pelanggan`
--

INSERT INTO `tab_pelanggan` (`id_pelanggan`, `nama`, `alamat`, `no_telepon`) VALUES
(1, 'Budi', 'Jl. 17 Agustus 1945', '0812345678'),
(2, 'Siti', 'Jl. Kemerdekaan No. 47', '0898765432'),
(3, '\'Sample Special Character!@#$%', '\'12@#&!($*', '!@#&*)%!@#(');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tab_penjualan`
--

CREATE TABLE `tab_penjualan` (
  `no_penjualan` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `total_harga` decimal(11,2) NOT NULL,
  `id_pelanggan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tab_penjualan`
--

INSERT INTO `tab_penjualan` (`no_penjualan`, `tanggal`, `total_harga`, `id_pelanggan`) VALUES
(20240001, '2024-04-30', '1213000.00', 1),
(20240002, '2024-01-01', '149000.00', 2),
(20240003, '2024-01-01', '0.00', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tab_produk`
--

CREATE TABLE `tab_produk` (
  `no_produk` int(11) NOT NULL,
  `nama` varchar(151) NOT NULL,
  `harga` decimal(11,2) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tab_produk`
--

INSERT INTO `tab_produk` (`no_produk`, `nama`, `harga`, `stok`) VALUES
(1, 'Papan Silikon', '170000.00', 20),
(2, 'Alat Solder', '100500.00', 3),
(3, 'Mie Instant Indomie Goreng', '3500.00', 100),
(4, 'Telur Ayam', '2200.00', 246),
(5, 'Dorayaki Sari Roti', '6000.00', 0),
(6, '\'Sampel Quote\"', '0.00', 0),
(7, '!@#$%^&*()_+{}|:\"<>?~', '0.00', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tab_user`
--

CREATE TABLE `tab_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(151) NOT NULL,
  `sandi` varchar(151) NOT NULL,
  `hak_akses` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tab_user`
--

INSERT INTO `tab_user` (`id`, `nama`, `sandi`, `hak_akses`) VALUES
(0, 'admin', 'infomin', 7),
(1, 'Petugas1', 'nugasdulu', 1),
(2, '\'Petugas\'', '?sampel?', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tab_detail_penjualan`
--
ALTER TABLE `tab_detail_penjualan`
  ADD PRIMARY KEY (`no_detail`),
  ADD KEY `no_penjualan` (`no_penjualan`),
  ADD KEY `no_produk` (`no_produk`);

--
-- Indeks untuk tabel `tab_pelanggan`
--
ALTER TABLE `tab_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `tab_penjualan`
--
ALTER TABLE `tab_penjualan`
  ADD PRIMARY KEY (`no_penjualan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indeks untuk tabel `tab_produk`
--
ALTER TABLE `tab_produk`
  ADD PRIMARY KEY (`no_produk`);

--
-- Indeks untuk tabel `tab_user`
--
ALTER TABLE `tab_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tab_detail_penjualan`
--
ALTER TABLE `tab_detail_penjualan`
  MODIFY `no_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tab_pelanggan`
--
ALTER TABLE `tab_pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tab_penjualan`
--
ALTER TABLE `tab_penjualan`
  MODIFY `no_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20240004;

--
-- AUTO_INCREMENT untuk tabel `tab_produk`
--
ALTER TABLE `tab_produk`
  MODIFY `no_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tab_user`
--
ALTER TABLE `tab_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tab_detail_penjualan`
--
ALTER TABLE `tab_detail_penjualan`
  ADD CONSTRAINT `tab_detail_penjualan_ibfk_1` FOREIGN KEY (`no_produk`) REFERENCES `tab_produk` (`no_produk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tab_detail_penjualan_ibfk_2` FOREIGN KEY (`no_penjualan`) REFERENCES `tab_penjualan` (`no_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tab_penjualan`
--
ALTER TABLE `tab_penjualan`
  ADD CONSTRAINT `tab_penjualan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `tab_pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
