-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 04 Feb 2016 pada 04.37
-- Versi Server: 5.6.14
-- Versi PHP: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `travel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activity`
--

CREATE TABLE IF NOT EXISTS `activity` (
  `id_paket` varchar(20) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `harga` int(10) NOT NULL,
  PRIMARY KEY (`id_paket`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `multiday tour`
--

CREATE TABLE IF NOT EXISTS `multiday tour` (
  `id_hotel` varchar(20) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `harga` int(10) NOT NULL,
  PRIMARY KEY (`id_hotel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nota`
--

CREATE TABLE IF NOT EXISTS `nota` (
  `id_nota` varchar(20) NOT NULL,
  `id_produk` varchar(20) NOT NULL,
  `id_penumpang` varchar(20) NOT NULL,
  `paket` varchar(10) NOT NULL,
  `waktu pemesanan` datetime NOT NULL,
  `total harga` int(10) NOT NULL,
  PRIMARY KEY (`id_nota`,`id_produk`,`id_penumpang`),
  KEY `id_penumpang` (`id_penumpang`),
  KEY `id_produk` (`id_produk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penumpang`
--

CREATE TABLE IF NOT EXISTS `penumpang` (
  `id_penumpang` varchar(30) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  PRIMARY KEY (`id_penumpang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
  `id_produk` varchar(30) NOT NULL,
  `id_paket` varchar(20) NOT NULL,
  `id_hotel` varchar(20) NOT NULL,
  `nama_produk` varchar(20) NOT NULL,
  PRIMARY KEY (`id_produk`,`id_paket`,`id_hotel`),
  KEY `id_hotel` (`id_hotel`),
  KEY `id_paket` (`id_paket`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `id_supplier` varchar(20) NOT NULL,
  `nama_paket` varchar(10) NOT NULL,
  `harga supplier` int(10) NOT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_tour`
--

CREATE TABLE IF NOT EXISTS `transaksi_tour` (
  `id_produk` varchar(30) NOT NULL,
  `id_suplier` varchar(20) NOT NULL,
  `id_tour` varchar(20) NOT NULL,
  `keuntugan` int(10) NOT NULL,
  PRIMARY KEY (`id_produk`,`id_suplier`,`id_tour`),
  KEY `id_suplier` (`id_suplier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`id_penumpang`) REFERENCES `penumpang` (`id_penumpang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nota_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `multiday tour` (`id_hotel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produk_ibfk_2` FOREIGN KEY (`id_paket`) REFERENCES `activity` (`id_paket`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi_tour`
--
ALTER TABLE `transaksi_tour`
  ADD CONSTRAINT `transaksi_tour_ibfk_2` FOREIGN KEY (`id_suplier`) REFERENCES `supplier` (`id_supplier`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_tour_ibfk_3` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
