-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2025 at 09:57 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pertemuan6`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `kodebrg` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `kodebrg`, `nama_barang`, `harga`) VALUES
(1, '001', 'Monitor 34 inch', 1000000),
(2, '002', 'Proyektor Samsung', 14999000),
(3, '003', 'Proyektor Epson EB-X500', 5500000),
(4, '004', 'Printer HP LaserJet Pro M404n', 3200000),
(5, '005', 'Kursi Kerja Ergonomis Indachi', 850000);

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `kode_buku` int(11) NOT NULL,
  `judul_buku` varchar(255) DEFAULT NULL,
  `pengarang` varchar(255) DEFAULT NULL,
  `penerbit` varchar(255) DEFAULT NULL,
  `tahun_terbit` year(4) DEFAULT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `status_buku` enum('Tersedia','Dipinjam','Hilang','Rusak') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `kode_buku`, `judul_buku`, `pengarang`, `penerbit`, `tahun_terbit`, `kategori`, `status_buku`) VALUES
(1, 12345, 'Python Advance', 'Dr. Pupung', 'Meida Z', '2025', 'IT Books', 'Tersedia'),
(2, 1, 'Membangun Web Modern dengan Laravel', 'Taylor', 'Informatika', '2024', 'Web Programming', 'Tersedia'),
(3, 2, 'Algoritma dan Pemrograman Python', 'Raharjo', 'Andi Offset', '2023', 'Data Science', 'Tersedia'),
(4, 3, 'Keamanan Sistem Informasi', 'Onno W. Purbo', 'Elex Media Komputindo', '2025', 'Network Security', 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `id` int(11) NOT NULL,
  `kodemk` int(11) NOT NULL,
  `namamk` varchar(255) NOT NULL,
  `sks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`id`, `kodemk`, `namamk`, `sks`) VALUES
(1, 1, 'Software', 4),
(2, 0, 'Algoritma dan Pemrograman', 4),
(4, 2, 'Pemrograman Web Lanjut', 3),
(5, 4, 'Kecerdasan Buatan &amp; Machine Learning', 3),
(6, 5, 'Bahasa Inggris Profesi', 2),
(7, 6, 'Praktikum Basis Data', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','dosen','mahasiswa','kaprodi','dekan') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'admin', '$2a$12$XepHnyJZSWRTT05Y2jOA/Ohu.rxddfYubRq4kPirEfvtjdKP2FHCi', 'admin', '2025-11-17 03:29:14'),
(2, 'Andi Nugroho', '$2y$10$lKfeTmqieGNA9crcpAFdH.GcpbYaUb6EHAB/FKFoeIivATxuj8bPG', 'mahasiswa', '2025-11-17 04:11:15'),
(3, 'Harye', '$2y$10$F3n9A0dk/SHbLvmjNuDzO.muNU1LbYBGdxWHtZ2wbERS0q5gMmhSO', 'dosen', '2025-11-17 04:11:29'),
(4, 'budi', '$2y$10$jEfZKoAtrvaowePyPaBY9.7YNzc5Emy7qelbLQd58kDs.15hNtu0.', 'kaprodi', '2025-11-17 05:04:53'),
(5, 'Mr. A', '$2y$10$eeHETw8lu3BmnSvZRKKcx.ZRvwlx.cL.z.26.OFUbXdg3i3k7rqXi', 'dekan', '2025-11-17 05:05:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kodebrg` (`kodebrg`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_buku` (`kode_buku`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kodemk` (`kodemk`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `matakuliah`
--
ALTER TABLE `matakuliah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

