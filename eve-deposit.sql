-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 16 Novembre 2017 à 12:24
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
('last_api_pull_date', '2017-11-16 11:35:31');

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
  `type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `mineral`
--

INSERT INTO `mineral` (`id`, `name`, `ref`, `unitVolume`, `unitPrice`, `type`) VALUES
(1, 'Tritanium', 0, 0, 5.71, 1),
(2, 'Pyerite', 0, 0, 5.73, 1),
(3, 'Mexallon', 0, 0, 75.7, 1),
(4, 'Isogen', 0, 0, 52.4, 1),
(5, 'Nocxium', 0, 0, 386, 1),
(6, 'Zydrine', 0, 0, 1130, 1),
(7, 'Megacyte', 0, 0, 11350, 1),
(8, 'Morphite', 0, 0, 11400, 1),
(9, 'Heavy Water', 16272, 1, 1, 2),
(10, 'Liquid Ozone', 16273, 1, 1, 2),
(11, 'Strontium', 16275, 1, 1, 2),
(12, 'Oxygen Isotopes', 17887, 1, 1, 2),
(13, 'Helium Isotopes', 16274, 1, 1, 2),
(14, 'Hydrogen Isotopes', 17889, 1, 1, 2),
(15, 'Nitrogen Isotopes', 17888, 1, 1, 2);

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
  `type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `IDX_9C1BDBAC4643D4C7` (`id_primaryOre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `ore`
--

INSERT INTO `ore` (`id`, `name`, `ref`, `unitVolume`, `unitPrice`, `normalizedPrice`, `securityLevel`, `graphicId`, `discr`, `id_primaryOre`, `type`) VALUES
(1, 'Veldspar', 1230, 0.1, 14.077142857143, 1407.71, 1, '24_64_1', 'primary', NULL, 1),
(2, 'Concentrated Veldspar', 17470, 0.1, 13.137142857143, 1313.71, 1, '24_64_1', 'secondary', 1, 1),
(3, 'Dense Veldspar', 17471, 0.1, 15.708571428571, 1570.85, 1, '24_64_1', 'secondary', 1, 1),
(4, 'Scordite', 1228, 0.15, 18.064285714286, 1204.28, 1, '23_64_15', 'primary', NULL, 1),
(5, 'Condensed Scordite', 17463, 0.15, 18.561428571429, 1237.42, 1, '23_64_15', 'secondary', 4, 1),
(6, 'Massive Scordite', 17464, 0.15, 18.095714285714, 1206.38, 1, '23_64_15', 'secondary', 4, 1),
(7, 'Dark Ochre', 1232, 8, 1150.0342857143, 1437.54, 0, '23_64_8', 'primary', NULL, 1),
(8, 'Onyx Ochre', 17436, 8, 800.08, 1000.1, 0, '23_64_8', 'secondary', 7, 1),
(9, 'Obsidian Ochre', 17437, 8, 955.81, 1194.76, 0, '23_64_8', 'secondary', 7, 1),
(10, 'Kernite', 20, 1.2, 244.08571428571, 2034.04, 0.7, '23_64_12', 'primary', NULL, 1),
(11, 'Luminous Kernite', 17452, 1.2, 150.15285714286, 1251.27, 0.07, '23_64_12', 'secondary', 10, 1),
(12, 'Fiery Kernite', 17453, 1.2, 203.67857142857, 1697.32, 0.7, '23_64_12', 'secondary', 10, 1),
(13, 'Omber', 1227, 0.6, 96.057142857143, 1600.95, 0.7, '23_64_13', 'primary', NULL, 1),
(14, 'Silvery Omber', 17867, 0.6, 69.484285714286, 1158.07, 0.7, '23_64_13', 'secondary', 13, 1),
(15, 'Golden Omber', 17868, 0.6, 75.087142857143, 1251.45, 0.7, '23_64_13', 'secondary', 13, 1),
(16, 'Hedbergite', 21, 3, 475.70571428571, 1585.68, 0.2, '23_64_9', 'primary', NULL, 1),
(17, 'Vitric Hedbergite', 17440, 3, 410.10714285714, 1367.02, 0.2, '23_64_9', 'secondary', 16, 1),
(18, 'Glazed Hedbergite', 17441, 3, 395.51, 1318.36, 0.2, '23_64_9', 'secondary', 16, 1),
(19, 'Pyroxeres', 1224, 0.3, 47.582857142857, 1586.09, 0.9, '23_64_16', 'primary', NULL, 1),
(20, 'Solid Pyroxeres', 17459, 0.3, 46.338571428571, 1544.61, 0.9, '23_64_16', 'secondary', 19, 1),
(21, 'Viscous Pyroxeres', 17460, 0.3, 51.445714285714, 1714.85, 0.9, '23_64_16', 'secondary', 19, 1),
(22, 'Hemorphite', 1231, 3, 546.24857142857, 1820.82, 0.2, '23_64_10', 'primary', NULL, 1),
(23, 'Vivid Hemorphite', 17444, 3, 435.23571428571, 1450.78, 0.2, '23_64_10', 'secondary', 22, 1),
(24, 'Radiant Hemorphite', 17445, 3, 433.71714285714, 1445.72, 0.2, '23_64_10', 'secondary', 22, 1),
(25, 'Plagioclase', 18, 0.35, 62.024285714286, 1772.12, 0.9, '24_64_2', 'primary', NULL, 1),
(26, 'Azure Plagioclase', 17455, 0.35, 61.997142857143, 1771.34, 0.9, '24_64_2', 'secondary', 25, 1),
(27, 'Rich Plagioclase', 17456, 0.35, 66.375714285714, 1896.44, 0.9, '24_64_2', 'secondary', 25, 1),
(28, 'Jaspet', 1226, 2, 322.22714285714, 1611.13, 0.4, '23_64_11', 'primary', NULL, 1),
(29, 'Pure Jaspet', 17448, 2, 450.63571428571, 2253.17, 0.4, '23_64_11', 'secondary', 28, 1),
(30, 'Pristine Jaspet', 17449, 2, 448.83, 2244.15, 0.4, '23_64_11', 'secondary', 28, 1),
(31, 'Crokite', 1225, 16, 3555.03, 2221.89, 0, '23_64_7', 'primary', NULL, 1),
(32, 'Sharp Crokite', 17432, 16, 2502.1171428571, 1563.82, 0, '23_64_7', 'secondary', 31, 1),
(33, 'Crystalline Crokite', 17433, 16, 2700.5085714286, 1687.81, 0, '23_64_7', 'secondary', 31, 1),
(34, 'Spodumain', 19, 16, 3366.0514285714, 2103.78, 0, '23_64_14', 'primary', NULL, 1),
(35, 'Bright Spodumain', 17466, 16, 4668.8571428571, 2918.03, 0, '23_64_14', 'secondary', 34, 1),
(36, 'Gleaming Spodumain', 17467, 16, 3661.2371428571, 2288.27, 0, '23_64_14', 'secondary', 34, 1),
(37, 'Gneiss', 1229, 5, 1500.01, 3000.02, 0, '25_64_1', 'primary', NULL, 1),
(38, 'Iridescent Gneiss', 17865, 5, 1000, 2000, 0, '25_64_1', 'secondary', 37, 1),
(39, 'Prismatic Gneiss', 17866, 5, 1214.36, 2428.71, 0, '25_64_1', 'secondary', 37, 1),
(40, 'Bistot', 1223, 16, 4736.55, 2960.34, 0, '23_64_6', 'primary', NULL, 1),
(41, 'Triclinic Bistot', 17428, 16, 4264.52, 2665.32, 0, '23_64_6', 'secondary', 40, 1),
(42, 'Monoclinic Bistot', 17429, 16, 3241.4, 2025.87, 0, '23_64_6', 'secondary', 40, 1),
(43, 'Arkonor', 22, 16, 4724.1985714286, 2952.62, 0, '23_64_5', 'primary', NULL, 1),
(44, 'Crimson Arkonor', 17425, 16, 4980.8057142857, 3113, 0, '23_64_5', 'secondary', 43, 1),
(45, 'Prime Arkonor', 17426, 16, 6257.4157142857, 3910.88, 0, '23_64_5', 'secondary', 43, 1),
(46, 'Mercoxit', 11396, 40, 19006.077142857, 4751.51, 0, '35_64_11', 'primary', NULL, 1),
(47, 'Magma Mercoxit', 17869, 40, 18485.468571429, 4621.36, 0, '35_64_11', 'secondary', 46, 1),
(48, 'Vitreous Mercoxit', 17870, 40, 21024.4, 5256.1, 0, '35_64_11', 'secondary', 46, 1),
(49, 'Glacial Mass', 16263, 1000, 174285.73142857, 1742.85, 1, '51_64_4', 'primary', NULL, 2),
(50, 'Smooth Glacial Mass', 17977, 1000, 159106.07142857, 1591.06, 1, '51_64_4', 'secondary', 49, 2),
(51, 'Clear Icicle', 16262, 1000, 133167.24142857, 1331.67, 1, '51_64_2', 'primary', NULL, 2),
(52, 'Enriched Clear Icicle', 17978, 1000, 51000.161428571, 510, 1, '51_64_2', 'secondary', 51, 2),
(53, 'Blue Ice', 16264, 1000, 242385.86142857, 2423.85, 1, '51_64_5', 'primary', NULL, 2),
(54, 'Thick Blue Ice', 17975, 1000, 100011.79714286, 1000.11, 1, '51_64_5', 'secondary', 53, 2),
(55, 'White Glaze', 16265, 1000, 197196.73571429, 1971.96, 1, '51_64_8', 'primary', NULL, 2),
(56, 'Pristine White Glaze', 17976, 1000, 24085.08, 240.85, 1, '51_64_8', 'secondary', 55, 2),
(57, 'Glare Crust', 16266, 1000, 525557.07142857, 5255.57, 0.4, '51_64_1', 'primary', NULL, 2),
(58, 'Dark Glitter', 16267, 1000, 162368.73, 1623.68, 0.1, '51_64_3', 'primary', NULL, 2),
(59, 'Gelidus', 16268, 1000, 446984.03857143, 4469.84, 0, '51_64_6', 'primary', NULL, 2),
(60, 'Krystallos', 16269, 1000, 546256.46428571, 5462.56, 0, '51_64_9', 'primary', NULL, 2),
(61, 'Fullerite-C50', 30370, 1, 1, 1, 0, '62_64_9', 'primary', NULL, 3),
(62, 'Fullerite-C60', 30371, 1, 1, 1, 0, '62_64_9', 'primary', NULL, 3),
(64, 'Fullerite-C70', 30372, 1, 1, 1, 0, '62_64_11', 'primary', NULL, 3),
(65, 'Fullerite-C72', 30373, 2, 1, 1, 0, '62_64_14', 'primary', NULL, 3),
(66, 'Fullerite-C84', 30374, 2, 1, 1, 0, '62_64_13', 'primary', NULL, 3),
(67, 'Fullerite-C28', 30375, 2, 1, 1, 0, '62_64_13', 'primary', NULL, 3),
(68, 'Fullerite-C32', 30376, 5, 1, 1, 0, '62_64_16', 'primary', NULL, 3),
(69, 'Fullerite-C320', 30377, 5, 1, 1, 0, '62_64_15', 'primary', NULL, 3),
(70, 'Fullerite-C540', 30378, 10, 1, 1, 0, '62_64_15', 'primary', NULL, 3);

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
