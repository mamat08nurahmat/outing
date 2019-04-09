-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Apr 09, 2019 at 04:11 AM
-- Server version: 5.7.25
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kuesioner`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `purchase` int(11) DEFAULT NULL,
  `sale` int(11) DEFAULT NULL,
  `profit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `year`, `purchase`, `sale`, `profit`) VALUES
(1, 2013, 2000, 3000, 1000),
(2, 2014, 4500, 5000, 500),
(3, 2015, 3000, 4500, 1500),
(4, 2016, 2000, 3000, 1000),
(5, 2017, 2000, 4000, 2000),
(6, 2018, 2200, 3000, 800),
(7, 2019, 5000, 7000, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(1) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `alamat` text,
  `telp` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `owner` varchar(30) DEFAULT NULL,
  `deskripsi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `nama`, `alamat`, `telp`, `email`, `website`, `owner`, `deskripsi`) VALUES
(1, 'Venus Multimedia', 'Jakarta', '123456', 'admin@venus-multimedia.com', 'http://venus-multimedia.com', 'Mark', 'Be Smart, Be Carrefully');

-- --------------------------------------------------------

--
-- Table structure for table `drawing`
--

CREATE TABLE `drawing` (
  `id_drawing` int(11) NOT NULL,
  `kd_user` varchar(25) NOT NULL,
  `create_at` datetime NOT NULL,
  `kd_peserta` varchar(25) DEFAULT NULL,
  `kd_hadiah` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drawing`
--

INSERT INTO `drawing` (`id_drawing`, `kd_user`, `create_at`, `kd_peserta`, `kd_hadiah`) VALUES
(1, 'K-009', '2019-04-06 15:16:59', '7', 'H-024'),
(2, 'K-009', '2019-04-06 15:18:20', '15', 'H-023'),
(3, 'K-009', '2019-04-06 15:19:32', '1', 'H-026'),
(4, 'K-009', '2019-04-06 15:20:29', '6', 'H-023'),
(5, 'K-009', '2019-04-06 15:21:30', '27', 'H-024'),
(6, 'K-009', '2019-04-06 15:22:12', '24', 'H-024'),
(7, 'K-009', '2019-04-06 15:22:58', '12', 'H-025'),
(8, 'K-009', '2019-04-06 15:23:30', '28', 'H-026'),
(9, 'K-009', '2019-04-06 15:24:42', '5', 'H-027'),
(10, 'K-009', '2019-04-06 15:25:30', '14', 'H-023'),
(11, 'K-009', '2019-04-06 15:26:14', '2', 'H-023'),
(12, 'K-009', '2019-04-06 15:27:04', '16', 'H-027'),
(13, 'K-009', '2019-04-06 15:27:53', '30', 'H-023'),
(14, 'K-009', '2019-04-06 15:28:48', '8', 'H-026'),
(15, 'K-009', '2019-04-06 15:29:39', '25', 'H-026'),
(16, 'K-009', '2019-04-06 15:30:46', '10', 'H-023'),
(17, 'K-009', '2019-04-06 15:31:38', '3', 'H-026'),
(18, 'K-009', '2019-04-06 15:32:39', '18', 'H-026'),
(19, 'K-009', '2019-04-06 15:33:20', '21', 'H-026'),
(20, 'K-009', '2019-04-06 15:34:08', '23', 'H-023'),
(21, 'K-009', '2019-04-06 15:34:46', '11', 'H-023'),
(22, 'K-009', '2019-04-06 15:35:37', '13', 'H-026'),
(23, 'K-009', '2019-04-06 15:36:31', '26', 'H-023');

-- --------------------------------------------------------

--
-- Table structure for table `draw_outing`
--

CREATE TABLE `draw_outing` (
  `kd_draw` varchar(25) NOT NULL,
  `kd_user` varchar(25) NOT NULL,
  `create_at` datetime NOT NULL,
  `kd_peserta` varchar(25) DEFAULT NULL,
  `kd_hadiah` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hadiah`
--

CREATE TABLE `hadiah` (
  `kd_hadiah` varchar(5) NOT NULL,
  `nama_hadiah` varchar(20) NOT NULL,
  `stok` int(10) NOT NULL,
  `kd_institusi` varchar(20) NOT NULL,
  `grand_prize` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hadiah`
--

INSERT INTO `hadiah` (`kd_hadiah`, `nama_hadiah`, `stok`, `kd_institusi`, `grand_prize`) VALUES
('H-001', 'Tappenas', 25, 'I-001', 0),
('H-002', 'Taplus', 38, 'I-001', 0),
('H-003', 'tapcash', 63, 'I-001', 0),
('H-004', 'tappenas', 24, 'I-002', 0),
('H-005', 'taplus', 36, 'I-002', 0),
('H-006', 'tapcash', 60, 'I-002', 0),
('H-007', 'tappenas', 36, 'I-003', 0),
('H-008', 'taplus', 53, 'I-003', 0),
('H-009', 'tapcash', 89, 'I-003', 0),
('H-010', 'tappenas', 45, 'I-004', 0),
('H-011', 'taplus', 67, 'I-004', 0),
('H-012', 'tapcash', 112, 'I-004', 0),
('H-013', 'tappenas', 42, 'I-005', 0),
('H-014', 'taplus', 63, 'I-005', 0),
('H-015', 'tapcash', 105, 'I-005', 0),
('H-016', 'Travel Bag', 1, 'I-007', 0),
('H-017', 'Voucher Belanja', 8, 'I-007', 0),
('H-018', 'Tumbler', 25, 'I-007', 0),
('H-019', 'Boneka', 15, 'I-007', 0),
('H-020', 'TAPLUS', 10, 'I-008', 0),
('H-021', 'TAPENAS', 20, 'I-008', 0),
('H-022', 'TAPCASH', 100, 'I-008', 0),
('H-023', 'TUMBLER', 6, 'I-009', 0),
('H-024', 'PAYUNG', 0, 'I-009', 0),
('H-025', 'TAS ', 0, 'I-009', 0),
('H-026', 'POWER BANK KECIL', 2, 'I-009', 0),
('H-027', 'POWER BANK BESAR', 0, 'I-009', 0),
('H-028', 'ZONK', 0, 'I-009', 1);

-- --------------------------------------------------------

--
-- Table structure for table `institusi`
--

CREATE TABLE `institusi` (
  `kd_institusi` varchar(5) NOT NULL,
  `nama_institusi` varchar(20) NOT NULL,
  `rm` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `institusi`
--

INSERT INTO `institusi` (`kd_institusi`, `nama_institusi`, `rm`) VALUES
('I-001', 'KEMENDIKBUD', 'Ingrid tera'),
('I-002', 'KEMENKES', 'Dwi Ayu'),
('I-003', 'KEMENKUMHAM', 'Yudi Setyawan'),
('I-004', 'KEMENLU', 'Juandri'),
('I-005', 'KKP', 'Juandri'),
('I-006', 'KAI', 'abc'),
('I-007', 'DSS', 'DSS'),
('I-008', 'BUMN', 'reza'),
('I-009', 'OUTING', 'DEA');

-- --------------------------------------------------------

--
-- Table structure for table `kuesioner`
--

CREATE TABLE `kuesioner` (
  `kd_kuesioner` varchar(25) NOT NULL,
  `kd_user` varchar(25) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `umur` varchar(50) DEFAULT NULL,
  `jenis_kelamin` varchar(5) DEFAULT NULL,
  `pekerjaan` int(5) DEFAULT NULL,
  `no_telpon` varchar(50) DEFAULT NULL,
  `bersedia` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `domisili` varchar(50) DEFAULT NULL,
  `penghasilan` int(5) DEFAULT NULL,
  `bank_utama` varchar(50) DEFAULT NULL,
  `produk_bank_utama` varchar(255) DEFAULT NULL,
  `produk_bni` varchar(50) DEFAULT NULL,
  `produk_bank_bni` varchar(255) DEFAULT NULL,
  `rencana` varchar(255) DEFAULT NULL,
  `tanggal_quiz` datetime NOT NULL,
  `kd_hadiah` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kuesioner`
--

INSERT INTO `kuesioner` (`kd_kuesioner`, `kd_user`, `nama`, `umur`, `jenis_kelamin`, `pekerjaan`, `no_telpon`, `bersedia`, `email`, `domisili`, `penghasilan`, `bank_utama`, `produk_bank_utama`, `produk_bni`, `produk_bank_bni`, `rencana`, `tanggal_quiz`, `kd_hadiah`) VALUES
('K-001', 'K-002', 'Rakhmat Rakhmawan', '55', 'L', 1, '085311002294', 'bersedia', 'hapit.akbar@gmail.com', 'Jakarta Pusat', 4, 'BNI', 'tabungan_utama,kartu_kredit_utama', 'YA', 'tabungan_bni,kartu_kredit_bni', 'buka_usaha', '2019-03-29 03:40:20', NULL),
('K-002', 'K-002', 'Fiska Kusumawati', '33', 'P', 1, '085879129129', 'bersedia', 'Fiskakusumawati@gmail.com', 'Jakarta', 3, 'BNI', 'tabungan_utama,kartu_kredit_utama', 'YA', 'tabungan_bni', 'beli_kendaraan', '2019-03-29 03:41:04', NULL),
('K-003', 'K-002', 'Siti Rahayu', '59', 'P', 8, '081386280333', 'bersedia', 'Strahayu8360@gmail.com', 'Depok', 2, 'BNI', 'tabungan_utama', 'YA', 'tabungan_bni', 'buka_usaha', '2019-03-29 08:02:46', NULL),
('K-004', 'K-002', 'Rakhmat Rakhmawan', '54', 'L', 1, '085311002294', 'tidak bersedia', 'Rakhmat.rakhmawan@kemdikbud.go.id', 'Jakarta Pusat', 4, '', 'tabungan_utama,kartu_kredit_utama', 'YA', 'tabungan_bni,kartu_kredit_bni', 'buka_usaha', '2019-03-29 08:04:43', NULL),
('K-005', 'K-007', 'kumala', '44', 'P', 3, '081314989840', 'bersedia', 'kumala.dewi@bni.co.id', 'jakarta', 2, 'BNI', 'kartu_kredit_utama', 'YA', 'tabungan_bni,deposit_bni,kartu_kredit_bni', 'beli_rumah,wisata,buka_usaha', '2019-03-31 07:23:25', NULL),
('K-006', 'K-007', 'KUMALA DEWI', '35', 'P', 6, '081314989840', 'bersedia', 'kumala.dewi@bni.co.id', 'jakarta', 1, '', 'tabungan_utama', 'YA', NULL, NULL, '2019-03-31 10:52:26', NULL),
('K-007', 'K-007', 'James', '23', 'L', 3, '0811234567', 'bersedia', 'James72@gmail.com', 'Jakarta', 5, 'Mandiri', 'tabungan_utama', 'YA', 'deposit_bni,kartu_kredit_bni', 'menikah,wisata', '2019-03-31 10:57:37', 'H-017'),
('K-008', 'K-007', 'Yuki edwinannto', '32', 'L', 6, '081234578', 'bersedia', 'James72@gmail.com', 'Jakarta', 5, 'BNI', 'tabungan_utama,deposit_utama,kartu_kredit_utama', 'YA', 'tabungan_bni,deposit_bni,kartu_kredit_bni', 'menikah,beli_rumah,wisata', '2019-03-31 11:01:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_detail`
--

CREATE TABLE `penjualan_detail` (
  `kd_penjualan` varchar(5) NOT NULL,
  `kd_produk` varchar(10) NOT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_header`
--

CREATE TABLE `penjualan_header` (
  `kd_penjualan` varchar(5) NOT NULL,
  `kd_store` varchar(10) NOT NULL,
  `total_harga` int(20) NOT NULL,
  `tanggal_penjualan` date NOT NULL,
  `kd_user` varchar(5) DEFAULT NULL,
  `buyer` varchar(100) NOT NULL,
  `alamat_buyer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `id_peserta` int(11) NOT NULL,
  `nama_peserta` varchar(25) NOT NULL,
  `is_drawing` int(5) DEFAULT '0',
  `is_outing` int(5) DEFAULT '1',
  `kd_institusi` varchar(25) DEFAULT 'I-009'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peserta`
--

INSERT INTO `peserta` (`id_peserta`, `nama_peserta`, `is_drawing`, `is_outing`, `kd_institusi`) VALUES
(1, 'ANA', 1, 1, 'I-009'),
(2, 'FADHLAN', 1, 1, 'I-009'),
(3, 'MAMAT', 1, 1, 'I-009'),
(4, 'NUNING', 0, 0, 'I-009'),
(5, 'PAK REZA', 1, 1, 'I-009'),
(6, 'PAK NARA', 1, 1, 'I-009'),
(7, 'MBA LYA', 1, 1, 'I-009'),
(8, 'RISTA', 1, 1, 'I-009'),
(9, 'AYU', 0, 0, 'I-009'),
(10, 'CITRA', 1, 1, 'I-009'),
(11, 'SALIA', 1, 1, 'I-009'),
(12, 'ISMAIL', 1, 1, 'I-009'),
(13, 'REY', 1, 1, 'I-009'),
(14, 'YAYAN', 1, 1, 'I-009'),
(15, 'AFI', 1, 1, 'I-009'),
(16, 'ANGEL', 1, 1, 'I-009'),
(17, 'SEPTI', 0, 0, 'I-009'),
(18, 'RUMANA', 1, 1, 'I-009'),
(19, 'DESI', 0, 0, 'I-009'),
(20, 'NUY', 0, 0, 'I-009'),
(21, 'MURNI', 1, 1, 'I-009'),
(22, 'TOPENG', 0, 0, 'I-009'),
(23, 'DEA', 1, 1, 'I-009'),
(24, 'BU NANA', 1, 1, 'I-009'),
(25, 'MAS ANGGA', 1, 1, 'I-009'),
(26, 'ICHA', 1, 1, 'I-009'),
(27, 'TONI', 1, 1, 'I-009'),
(28, 'SOPYAN', 1, 1, 'I-009'),
(29, 'IRFAN', 0, 0, 'I-009'),
(30, 'DANI', 1, 1, 'I-009');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `kd_produk` varchar(5) NOT NULL,
  `nm_produk` varchar(20) NOT NULL,
  `stok` int(10) NOT NULL,
  `harga` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`kd_produk`, `nm_produk`, `stok`, `harga`) VALUES
('B-001', 'abc', 100, 5000),
('B-002', 'xyz', 400, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `kd_quiz` varchar(5) NOT NULL,
  `kd_user` varchar(10) NOT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `no_telpon` varchar(50) DEFAULT NULL,
  `q1` int(5) NOT NULL,
  `q1lainnya` varchar(100) DEFAULT NULL,
  `q2` int(5) NOT NULL,
  `q2lainnya` varchar(100) DEFAULT NULL,
  `q3` int(5) NOT NULL,
  `q3lainnya` varchar(100) DEFAULT NULL,
  `tanggal_quiz` datetime NOT NULL,
  `kd_hadiah` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`kd_quiz`, `kd_user`, `nama_lengkap`, `no_telpon`, `q1`, `q1lainnya`, `q2`, `q2lainnya`, `q3`, `q3lainnya`, `tanggal_quiz`, `kd_hadiah`) VALUES
('Q-001', 'K-002', 'mat001', '0874875454545549', 1, '.', 1, '.', 1, '.', '2019-03-21 05:04:38', 'H-001'),
('Q-002', 'K-002', 'nur123', '087545454845', 3, '.', 1, '.', 5, 'aaaaa', '2019-03-21 05:05:31', 'H-003'),
('Q-003', 'K-003', 'Matt', '087545451515', 1, '.', 3, '.', 1, '.', '2019-03-21 05:46:09', 'H-002'),
('Q-004', 'K-004', 'ghjghj', '657657', 1, '.', 1, '.', 1, '.', '2019-03-21 08:03:06', 'H-002'),
('Q-005', 'K-004', 'Mamat nurahmat', '08777145452', 2, '.', 1, '.', 5, '.abc', '2019-03-21 08:24:36', 'H-003');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `kd_store` varchar(5) NOT NULL,
  `nm_store` varchar(30) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`kd_store`, `nm_store`, `alamat`, `email`) VALUES
('P-001', 'ghghghghgh', 'yytuytuy', 'mamat08nurahmat@gmail.com'),
('P-002', 'xyz', 'jln........', 'aaaaaaaaa@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `kd_user` varchar(5) NOT NULL DEFAULT '0',
  `npp` varchar(100) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL,
  `nama` varchar(25) DEFAULT NULL,
  `level` varchar(50) DEFAULT 'pegawai',
  `kd_institusi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`kd_user`, `npp`, `password`, `nama`, `level`, `kd_institusi`) VALUES
('K-001', '55555', '827ccb0eea8a706c4c34a16891f84e7b', 'Admin Kuesioner', 'KAE', 'ALL'),
('K-002', 'kemendikbud', '827ccb0eea8a706c4c34a16891f84e7b', 'ingrid tera', 'KAE', 'I-001'),
('K-003', 'kemenkes', '827ccb0eea8a706c4c34a16891f84e7b', 'Dwi ayu', 'KAE', 'I-002'),
('K-004', 'kemenkumham', '827ccb0eea8a706c4c34a16891f84e7b', 'yudi setyawan', 'KAE', 'I-003'),
('K-005', 'kemenlu', '827ccb0eea8a706c4c34a16891f84e7b', 'juandri kemenlu', 'KAE', 'I-004'),
('K-006', 'kkp', '827ccb0eea8a706c4c34a16891f84e7b', 'juandri kkp', 'KAE', 'I-005'),
('K-007', 'dss', '827ccb0eea8a706c4c34a16891f84e7b', 'DSS', 'KAE', 'I-007'),
('K-008', 'bumnexpo', '827ccb0eea8a706c4c34a16891f84e7b', 'BUMN EXPO', 'KAE', 'I-008'),
('K-009', 'outing', '827ccb0eea8a706c4c34a16891f84e7b', 'OUTING', 'KAE', 'I-009');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drawing`
--
ALTER TABLE `drawing`
  ADD PRIMARY KEY (`id_drawing`);

--
-- Indexes for table `draw_outing`
--
ALTER TABLE `draw_outing`
  ADD PRIMARY KEY (`kd_draw`);

--
-- Indexes for table `hadiah`
--
ALTER TABLE `hadiah`
  ADD PRIMARY KEY (`kd_hadiah`);

--
-- Indexes for table `institusi`
--
ALTER TABLE `institusi`
  ADD PRIMARY KEY (`kd_institusi`);

--
-- Indexes for table `kuesioner`
--
ALTER TABLE `kuesioner`
  ADD PRIMARY KEY (`kd_kuesioner`);

--
-- Indexes for table `penjualan_header`
--
ALTER TABLE `penjualan_header`
  ADD PRIMARY KEY (`kd_penjualan`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`id_peserta`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`kd_produk`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`kd_quiz`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`kd_store`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`kd_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `drawing`
--
ALTER TABLE `drawing`
  MODIFY `id_drawing` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `peserta`
--
ALTER TABLE `peserta`
  MODIFY `id_peserta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
