-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Jun 2024 pada 10.10
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `metode_pembayaran`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `e_wallet`
--

CREATE TABLE `e_wallet` (
  `Id_Telepon` int(11) NOT NULL,
  `nama_provider` enum('Dana','OVO','GoPay','Shopee') NOT NULL,
  `nomor_akun` varchar(255) NOT NULL,
  `tanggal_transaksi` datetime NOT NULL,
  `jumlah` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kartu_kredit_debit`
--

CREATE TABLE `kartu_kredit_debit` (
  `id` int(11) NOT NULL,
  `nama_bank` varchar(255) NOT NULL,
  `nomor_kartu` varchar(255) NOT NULL,
  `tanggal_transaksi` datetime NOT NULL,
  `jumlah` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nomor_telepon`
--

CREATE TABLE `nomor_telepon` (
  `id` int(11) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `nomor_telepon` varchar(255) NOT NULL,
  `tanggal_transaksi` datetime NOT NULL,
  `jumlah` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transfer_bank`
--

CREATE TABLE `transfer_bank` (
  `Kode_bank` int(11) NOT NULL,
  `jenis_pembayaran` enum('transfer_bank') NOT NULL,
  `bank` enum('BCA','BRI','BNI','Mandiri') NOT NULL,
  `nomor_rekening` varchar(255) NOT NULL,
  `tanggal_transaksi` datetime NOT NULL,
  `jumlah` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `e_wallet`
--
ALTER TABLE `e_wallet`
  ADD PRIMARY KEY (`Id_Telepon`);

--
-- Indeks untuk tabel `kartu_kredit_debit`
--
ALTER TABLE `kartu_kredit_debit`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `nomor_telepon`
--
ALTER TABLE `nomor_telepon`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transfer_bank`
--
ALTER TABLE `transfer_bank`
  ADD PRIMARY KEY (`Kode_bank`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `e_wallet`
--
ALTER TABLE `e_wallet`
  MODIFY `Id_Telepon` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kartu_kredit_debit`
--
ALTER TABLE `kartu_kredit_debit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `nomor_telepon`
--
ALTER TABLE `nomor_telepon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transfer_bank`
--
ALTER TABLE `transfer_bank`
  MODIFY `Kode_bank` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
