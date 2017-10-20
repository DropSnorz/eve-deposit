-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 20 Octobre 2017 à 13:07
-- Version du serveur :  5.7.9
-- Version de PHP :  7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `eve_deposit`
--

-- --------------------------------------------------------

--
-- Structure de la table `app_data`
--

DROP TABLE IF EXISTS `app_data`;
CREATE TABLE IF NOT EXISTS `app_data` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `app_data`
--

INSERT INTO `app_data` (`id`, `value`) VALUES
('last_api_pull_date', '2017-10-20 13:05:29');

-- --------------------------------------------------------

--
-- Structure de la table `mineral`
--

DROP TABLE IF EXISTS `mineral`;
CREATE TABLE IF NOT EXISTS `mineral` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ref` int(11) NOT NULL,
  `unitVolume` double NOT NULL,
  `unitPrice` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `mineral`
--

INSERT INTO `mineral` (`id`, `name`, `ref`, `unitVolume`, `unitPrice`) VALUES
(1, 'Tritanium', 0, 0, 5.71),
(2, 'Pyerite', 0, 0, 5.73),
(3, 'Mexallon', 0, 0, 75.7),
(4, 'Isogen', 0, 0, 52.4),
(5, 'Nocxium', 0, 0, 386),
(6, 'Zydrine', 0, 0, 1130),
(7, 'Megacyte', 0, 0, 11350),
(8, 'Morphite', 0, 0, 11400);

-- --------------------------------------------------------

--
-- Structure de la table `ore`
--

DROP TABLE IF EXISTS `ore`;
CREATE TABLE IF NOT EXISTS `ore` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ref` int(11) NOT NULL,
  `unitVolume` double NOT NULL,
  `unitPrice` double NOT NULL,
  `normalizedPrice` double DEFAULT NULL,
  `securityLevel` double NOT NULL,
  `graphicId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_primaryOre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9C1BDBAC4643D4C7` (`id_primaryOre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `ore`
--

INSERT INTO `ore` (`id`, `name`, `ref`, `unitVolume`, `unitPrice`, `normalizedPrice`, `securityLevel`, `graphicId`, `discr`, `id_primaryOre`) VALUES
(1, 'Veldspar', 1230, 0.1, 15.61, 1561, 1, '24_64_1', 'primary', NULL),
(2, 'Concentrated Veldspar', 17470, 0.1, 15.06, 1506, 1, '24_64_1', 'secondary', 1),
(3, 'Dense Veldspar', 17471, 0.1, 15, 1500, 1, '24_64_1', 'secondary', 1),
(4, 'Scordite', 1228, 0.15, 18.36, 1224, 1, '23_64_15', 'primary', NULL),
(5, 'Condensed Scordite', 17463, 0.15, 18.25, 1216.66, 1, '23_64_15', 'secondary', 4),
(6, 'Massive Scordite', 17464, 0.15, 20.71, 1380.66, 1, '23_64_15', 'secondary', 4),
(7, 'Dark Ochre', 1232, 8, 1003.81, 1254.76, 0, '23_64_8', 'primary', NULL),
(8, 'Onyx Ochre', 17436, 8, 100, 125, 0, '23_64_8', 'secondary', 7),
(9, 'Obsidian Ochre', 17437, 8, 955.72, 1194.65, 0, '23_64_8', 'secondary', 7),
(10, 'Kernite', 20, 1.2, 274.03, 2283.58, 0.7, '23_64_12', 'primary', NULL),
(11, 'Luminous Kernite', 17452, 1.2, 137.1, 1142.5, 0.07, '23_64_12', 'secondary', 10),
(12, 'Fiery Kernite', 17453, 1.2, 208.82, 1740.16, 0.7, '23_64_12', 'secondary', 10),
(13, 'Omber', 1227, 0.6, 121.44, 2024, 0.7, '23_64_13', 'primary', NULL),
(14, 'Silvery Omber', 17867, 0.6, 79.1, 1318.33, 0.7, '23_64_13', 'secondary', 13),
(15, 'Golden Omber', 17868, 0.6, 93.98, 1566.33, 0.7, '23_64_13', 'secondary', 13),
(16, 'Hedbergite', 21, 3, 475.28, 1584.26, 0.2, '23_64_9', 'primary', NULL),
(17, 'Vitric Hedbergite', 17440, 3, 100.01, 333.36, 0.2, '23_64_9', 'secondary', 16),
(18, 'Glazed Hedbergite', 17441, 3, 395.03, 1316.76, 0.2, '23_64_9', 'secondary', 16),
(19, 'Pyroxeres', 1224, 0.3, 57, 1900, 0.9, '23_64_16', 'primary', NULL),
(20, 'Solid Pyroxeres', 17459, 0.3, 56, 1866.66, 0.9, '23_64_16', 'secondary', 19),
(21, 'Viscous Pyroxeres', 17460, 0.3, 55.13, 1837.66, 0.9, '23_64_16', 'secondary', 19),
(22, 'Hemorphite', 1231, 3, 650, 2166.66, 0.2, '23_64_10', 'primary', NULL),
(23, 'Vivid Hemorphite', 17444, 3, 430.25, 1434.16, 0.2, '23_64_10', 'secondary', 22),
(24, 'Radiant Hemorphite', 17445, 3, 429.25, 1430.83, 0.2, '23_64_10', 'secondary', 22),
(25, 'Plagioclase', 18, 0.35, 67, 1914.28, 0.9, '24_64_2', 'primary', NULL),
(26, 'Azure Plagioclase', 17455, 0.35, 64, 1828.57, 0.9, '24_64_2', 'secondary', 25),
(27, 'Rich Plagioclase', 17456, 0.35, 68.29, 1951.14, 0.9, '24_64_2', 'secondary', 25),
(28, 'Jaspet', 1226, 2, 430.33, 2151.65, 0.4, '23_64_11', 'primary', NULL),
(29, 'Pure Jaspet', 17448, 2, 451.61, 2258.05, 0.4, '23_64_11', 'secondary', 28),
(30, 'Pristine Jaspet', 17449, 2, 447.05, 2235.25, 0.4, '23_64_11', 'secondary', 28),
(31, 'Crokite', 1225, 16, 3553.13, 2220.7, 0, '23_64_7', 'primary', NULL),
(32, 'Sharp Crokite', 17432, 16, 2500.51, 1562.81, 0, '23_64_7', 'secondary', 31),
(33, 'Crystalline Crokite', 17433, 16, 2700.38, 1687.73, 0, '23_64_7', 'secondary', 31),
(34, 'Spodumain', 19, 16, 3225.03, 2015.64, 0, '23_64_14', 'primary', NULL),
(35, 'Bright Spodumain', 17466, 16, 3600.51, 2250.31, 0, '23_64_14', 'secondary', 34),
(36, 'Gleaming Spodumain', 17467, 16, 3108.1, 1942.56, 0, '23_64_14', 'secondary', 34),
(37, 'Gneiss', 1229, 5, 1423.42, 2846.84, 0, '25_64_1', 'primary', NULL),
(38, 'Iridescent Gneiss', 17865, 5, 945.3, 1890.6, 0, '25_64_1', 'secondary', 37),
(39, 'Prismatic Gneiss', 17866, 5, 1213.9, 2427.8, 0, '25_64_1', 'secondary', 37),
(40, 'Bistot', 1223, 16, 4651.01, 2906.88, 0, '23_64_6', 'primary', NULL),
(41, 'Triclinic Bistot', 17428, 16, 4264.18, 2665.11, 0, '23_64_6', 'secondary', 40),
(42, 'Monoclinic Bistot', 17429, 16, 3241.09, 2025.68, 0, '23_64_6', 'secondary', 40),
(43, 'Arkonor', 22, 16, 4811.13, 3006.95, 0, '23_64_5', 'primary', NULL),
(44, 'Crimson Arkonor', 17425, 16, 4980.45, 3112.78, 0, '23_64_5', 'secondary', 43),
(45, 'Prime Arkonor', 17426, 16, 4800.11, 3000.06, 0, '23_64_5', 'secondary', 43),
(46, 'Mercoxit', 11396, 40, 17205.52, 4301.38, 0, '35_64_11', 'primary', NULL),
(47, 'Magma Mercoxit', 17869, 40, 16812.55, 4203.13, 0, '35_64_11', 'secondary', 46),
(48, 'Vitreous Mercoxit', 17870, 40, 18028.16, 4507.04, 0, '35_64_11', 'secondary', 46);

-- --------------------------------------------------------

--
-- Structure de la table `ore_mineral`
--

DROP TABLE IF EXISTS `ore_mineral`;
CREATE TABLE IF NOT EXISTS `ore_mineral` (
  `id` int(11) NOT NULL,
  `ore_id` int(11) DEFAULT NULL,
  `mineral_id` int(11) DEFAULT NULL,
  `reprocessingEfficiency` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4012D5375E8AB490` (`ore_id`),
  KEY `IDX_4012D53721F4A72C` (`mineral_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `ore_mineral`
--

INSERT INTO `ore_mineral` (`id`, `ore_id`, `mineral_id`, `reprocessingEfficiency`) VALUES
(1, 1, 1, 41.471),
(2, 4, 1, 23.017),
(3, 4, 2, 11.501),
(4, 7, 1, 12.5),
(5, 7, 4, 2),
(6, 7, 5, 0.15),
(7, 10, 1, 1.111),
(8, 10, 3, 2.224),
(9, 10, 4, 1.111),
(10, 13, 1, 13.333),
(11, 13, 2, 1.667),
(12, 13, 4, 1.417),
(13, 16, 2, 3.333),
(14, 16, 4, 0.667),
(15, 16, 5, 0.333),
(16, 16, 6, 0.063),
(17, 19, 1, 11.667),
(18, 19, 2, 0.816),
(19, 19, 3, 1.659),
(20, 19, 5, 0.152),
(21, 22, 1, 7.333),
(22, 22, 4, 0.333),
(23, 22, 5, 0.4),
(24, 22, 6, 0.05),
(25, 25, 1, 3.033),
(26, 25, 2, 6.067),
(27, 25, 3, 3.033),
(28, 28, 3, 1.75),
(29, 28, 5, 0.375),
(30, 28, 6, 0.4),
(31, 31, 1, 13.125),
(32, 31, 5, 0.475),
(33, 31, 6, 0.084),
(34, 34, 1, 35),
(35, 34, 2, 7.531),
(36, 34, 3, 1.313),
(37, 34, 4, 0.281),
(38, 37, 2, 4.4),
(39, 37, 3, 4.8),
(40, 37, 4, 0.6),
(41, 40, 2, 7.5),
(42, 40, 6, 0.281),
(43, 40, 7, 0.063),
(44, 43, 1, 13.75),
(45, 43, 3, 1.563),
(46, 43, 7, 0.2),
(47, 46, 8, 0.075);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `ore`
--
ALTER TABLE `ore`
  ADD CONSTRAINT `FK_9C1BDBAC4643D4C7` FOREIGN KEY (`id_primaryOre`) REFERENCES `ore` (`id`);

--
-- Contraintes pour la table `ore_mineral`
--
ALTER TABLE `ore_mineral`
  ADD CONSTRAINT `FK_4012D53721F4A72C` FOREIGN KEY (`mineral_id`) REFERENCES `mineral` (`id`),
  ADD CONSTRAINT `FK_4012D5375E8AB490` FOREIGN KEY (`ore_id`) REFERENCES `ore` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
