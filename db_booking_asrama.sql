-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Okt 2024 pada 13.19
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_booking_asrama`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_booking`
--

CREATE TABLE `tbl_booking` (
  `ID_booking` int(11) NOT NULL,
  `ID_mahasiswa` int(11) NOT NULL,
  `ID_kamar_asrama` int(11) NOT NULL,
  `tanggal_booking_kamar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_gedung_asrama`
--

CREATE TABLE `tbl_gedung_asrama` (
  `ID_gedung_asrama` int(11) NOT NULL,
  `nama_gedung_asrama` varchar(100) NOT NULL,
  `lokasi_gedung_asrama` varchar(200) NOT NULL,
  `harga_gedung_asrama` int(11) NOT NULL,
  `jumlah_lantai_gedung_asrama` int(11) NOT NULL,
  `jumlah_kamar_per_lantai_asrama` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kamar_asrama`
--

CREATE TABLE `tbl_kamar_asrama` (
  `ID_kamar_asrama` int(11) NOT NULL,
  `nomor_kamar_asrama` varchar(20) NOT NULL,
  `fasilitas_kamar_asrama` text NOT NULL,
  `ID_gedung_asrama` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mahasiswa`
--

CREATE TABLE `tbl_mahasiswa` (
  `ID_mahasiswa` int(11) NOT NULL,
  `nama_mahasiswa` varchar(100) NOT NULL,
  `no_regis_mahasiswa` varchar(50) NOT NULL,
  `NIM_mahasiswa` int(11) NOT NULL,
  `fakultas_mahasiswa` varchar(100) NOT NULL,
  `jurusan_mahasiswa` varchar(100) NOT NULL,
  `nomor_telepon_mahasiswa` int(20) NOT NULL,
  `email_mahasiswa` varchar(100) NOT NULL,
  `tempat_lahir_mahasiswa` varchar(100) NOT NULL,
  `tanggal_lahir_mahasiswa` date NOT NULL,
  `jenis_kelamin_mahasiswa` enum('Laki-Laki','Perempuan') NOT NULL,
  `agama_mahasiswa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_orang_tua`
--

CREATE TABLE `tbl_orang_tua` (
  `ID_orang_tua` int(11) NOT NULL,
  `ID_mahasiswa` int(11) NOT NULL,
  `nama_orang_tua` varchar(100) NOT NULL,
  `hubungan_dengan_mahasiswa` varchar(100) NOT NULL,
  `alamat_orang_tua` varchar(100) NOT NULL,
  `nomor_telepon_orang_tua` int(20) NOT NULL,
  `email_orang_tua` varchar(100) NOT NULL,
  `pekerjaan_orang_tua` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pembayaran`
--

CREATE TABLE `tbl_pembayaran` (
  `ID_pembayaran` int(11) NOT NULL,
  `ID_booking` int(11) NOT NULL,
  `tanggal_pembayaran` date NOT NULL,
  `jumlah_pembayaran` int(11) NOT NULL,
  `metode_pembayaran` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pengelola`
--

CREATE TABLE `tbl_pengelola` (
  `ID_pengelola` int(11) NOT NULL,
  `nama_pengelola` varchar(100) NOT NULL,
  `jabatan_pengelola` varchar(100) NOT NULL,
  `nomor_telepon_pengelola` int(20) NOT NULL,
  `email_pengelola` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pengguna`
--

CREATE TABLE `tbl_pengguna` (
  `ID_pengguna` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama_pengguna` varchar(30) NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_pengguna`
--

INSERT INTO `tbl_pengguna` (`ID_pengguna`, `username`, `password`, `nama_pengguna`, `level`) VALUES
(1, 'kharis', 'awuy', 'Kharis Awuy', 1),
(2, 'admin', 'admin', 'Administrator', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD PRIMARY KEY (`ID_booking`);

--
-- Indeks untuk tabel `tbl_gedung_asrama`
--
ALTER TABLE `tbl_gedung_asrama`
  ADD PRIMARY KEY (`ID_gedung_asrama`);

--
-- Indeks untuk tabel `tbl_kamar_asrama`
--
ALTER TABLE `tbl_kamar_asrama`
  ADD PRIMARY KEY (`ID_kamar_asrama`);

--
-- Indeks untuk tabel `tbl_mahasiswa`
--
ALTER TABLE `tbl_mahasiswa`
  ADD PRIMARY KEY (`ID_mahasiswa`),
  ADD UNIQUE KEY `no_regis_mahasiswa` (`no_regis_mahasiswa`),
  ADD UNIQUE KEY `NIM_mahasiswa` (`NIM_mahasiswa`);

--
-- Indeks untuk tabel `tbl_orang_tua`
--
ALTER TABLE `tbl_orang_tua`
  ADD PRIMARY KEY (`ID_orang_tua`);

--
-- Indeks untuk tabel `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD PRIMARY KEY (`ID_pembayaran`);

--
-- Indeks untuk tabel `tbl_pengguna`
--
ALTER TABLE `tbl_pengguna`
  ADD PRIMARY KEY (`ID_pengguna`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_booking`
--
ALTER TABLE `tbl_booking`
  MODIFY `ID_booking` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_gedung_asrama`
--
ALTER TABLE `tbl_gedung_asrama`
  MODIFY `ID_gedung_asrama` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_kamar_asrama`
--
ALTER TABLE `tbl_kamar_asrama`
  MODIFY `ID_kamar_asrama` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_mahasiswa`
--
ALTER TABLE `tbl_mahasiswa`
  MODIFY `ID_mahasiswa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_orang_tua`
--
ALTER TABLE `tbl_orang_tua`
  MODIFY `ID_orang_tua` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  MODIFY `ID_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_pengguna`
--
ALTER TABLE `tbl_pengguna`
  MODIFY `ID_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
