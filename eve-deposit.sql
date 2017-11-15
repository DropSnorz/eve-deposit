-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 15 Novembre 2017 à 11:01
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
('last_api_pull_date', '2017-11-08 07:25:23');

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
(1, 'Veldspar', 1230, 0.1, 14.101428571429, 1410.14, 1, '24_64_1', 'primary', NULL, 1),
(2, 'Concentrated Veldspar', 17470, 0.1, 14.114285714286, 1411.42, 1, '24_64_1', 'secondary', 1, 1),
(3, 'Dense Veldspar', 17471, 0.1, 15.357142857143, 1535.71, 1, '24_64_1', 'secondary', 1, 1),
(4, 'Scordite', 1228, 0.15, 17.654285714286, 1176.95, 1, '23_64_15', 'primary', NULL, 1),
(5, 'Condensed Scordite', 17463, 0.15, 18.424285714286, 1228.28, 1, '23_64_15', 'secondary', 4, 1),
(6, 'Massive Scordite', 17464, 0.15, 17.398571428571, 1159.9, 1, '23_64_15', 'secondary', 4, 1),
(7, 'Dark Ochre', 1232, 8, 1289.73, 1612.16, 0, '23_64_8', 'primary', NULL, 1),
(8, 'Onyx Ochre', 17436, 8, 814.36428571429, 1017.95, 0, '23_64_8', 'secondary', 7, 1),
(9, 'Obsidian Ochre', 17437, 8, 1390.5514285714, 1738.18, 0, '23_64_8', 'secondary', 7, 1),
(10, 'Kernite', 20, 1.2, 241.04857142857, 2008.73, 0.7, '23_64_12', 'primary', NULL, 1),
(11, 'Luminous Kernite', 17452, 1.2, 162.99, 1358.25, 0.07, '23_64_12', 'secondary', 10, 1),
(12, 'Fiery Kernite', 17453, 1.2, 208.13285714286, 1734.44, 0.7, '23_64_12', 'secondary', 10, 1),
(13, 'Omber', 1227, 0.6, 110.63857142857, 1843.97, 0.7, '23_64_13', 'primary', NULL, 1),
(14, 'Silvery Omber', 17867, 0.6, 69.661428571429, 1161.02, 0.7, '23_64_13', 'secondary', 13, 1),
(15, 'Golden Omber', 17868, 0.6, 75.087142857143, 1251.45, 0.7, '23_64_13', 'secondary', 13, 1),
(16, 'Hedbergite', 21, 3, 474.83142857143, 1582.77, 0.2, '23_64_9', 'primary', NULL, 1),
(17, 'Vitric Hedbergite', 17440, 3, 410.50571428571, 1368.35, 0.2, '23_64_9', 'secondary', 16, 1),
(18, 'Glazed Hedbergite', 17441, 3, 353.27, 1177.56, 0.2, '23_64_9', 'secondary', 16, 1),
(19, 'Pyroxeres', 1224, 0.3, 47.774285714286, 1592.47, 0.9, '23_64_16', 'primary', NULL, 1),
(20, 'Solid Pyroxeres', 17459, 0.3, 46.66, 1555.33, 0.9, '23_64_16', 'secondary', 19, 1),
(21, 'Viscous Pyroxeres', 17460, 0.3, 51.691428571429, 1723.04, 0.9, '23_64_16', 'secondary', 19, 1),
(22, 'Hemorphite', 1231, 3, 674.12428571429, 2247.08, 0.2, '23_64_10', 'primary', NULL, 1),
(23, 'Vivid Hemorphite', 17444, 3, 433.77571428571, 1445.91, 0.2, '23_64_10', 'secondary', 22, 1),
(24, 'Radiant Hemorphite', 17445, 3, 453.24, 1510.8, 0.2, '23_64_10', 'secondary', 22, 1),
(25, 'Plagioclase', 18, 0.35, 61.79, 1765.42, 0.9, '24_64_2', 'primary', NULL, 1),
(26, 'Azure Plagioclase', 17455, 0.35, 64.094285714286, 1831.26, 0.9, '24_64_2', 'secondary', 25, 1),
(27, 'Rich Plagioclase', 17456, 0.35, 66.737142857143, 1906.77, 0.9, '24_64_2', 'secondary', 25, 1),
(28, 'Jaspet', 1226, 2, 324.07714285714, 1620.38, 0.4, '23_64_11', 'primary', NULL, 1),
(29, 'Pure Jaspet', 17448, 2, 454.03571428571, 2270.17, 0.4, '23_64_11', 'secondary', 28, 1),
(30, 'Pristine Jaspet', 17449, 2, 454.12, 2270.6, 0.4, '23_64_11', 'secondary', 28, 1),
(31, 'Crokite', 1225, 16, 3555.05, 2221.9, 0, '23_64_7', 'primary', NULL, 1),
(32, 'Sharp Crokite', 17432, 16, 2500.53, 1562.83, 0, '23_64_7', 'secondary', 31, 1),
(33, 'Crystalline Crokite', 17433, 16, 2700.5271428571, 1687.82, 0, '23_64_7', 'secondary', 31, 1),
(34, 'Spodumain', 19, 16, 3808.7414285714, 2380.46, 0, '23_64_14', 'primary', NULL, 1),
(35, 'Bright Spodumain', 17466, 16, 3514.7371428571, 2196.71, 0, '23_64_14', 'secondary', 34, 1),
(36, 'Gleaming Spodumain', 17467, 16, 3661.2657142857, 2288.29, 0, '23_64_14', 'secondary', 34, 1),
(37, 'Gneiss', 1229, 5, 1469.6185714286, 2939.23, 0, '25_64_1', 'primary', NULL, 1),
(38, 'Iridescent Gneiss', 17865, 5, 953.24571428571, 1906.49, 0, '25_64_1', 'secondary', 37, 1),
(39, 'Prismatic Gneiss', 17866, 5, 1253.5785714286, 2507.15, 0, '25_64_1', 'secondary', 37, 1),
(40, 'Bistot', 1223, 16, 4964.8485714286, 3103.03, 0, '23_64_6', 'primary', NULL, 1),
(41, 'Triclinic Bistot', 17428, 16, 4498.1328571429, 2811.33, 0, '23_64_6', 'secondary', 40, 1),
(42, 'Monoclinic Bistot', 17429, 16, 3241.41, 2025.88, 0, '23_64_6', 'secondary', 40, 1),
(43, 'Arkonor', 22, 16, 4803.8057142857, 3002.37, 0, '23_64_5', 'primary', NULL, 1),
(44, 'Crimson Arkonor', 17425, 16, 4980.8157142857, 3113, 0, '23_64_5', 'secondary', 43, 1),
(45, 'Prime Arkonor', 17426, 16, 4800.2942857143, 3000.18, 0, '23_64_5', 'secondary', 43, 1),
(46, 'Mercoxit', 11396, 40, 19026.5, 4756.62, 0, '35_64_11', 'primary', NULL, 1),
(47, 'Magma Mercoxit', 17869, 40, 20070.837142857, 5017.7, 0, '35_64_11', 'secondary', 46, 1),
(48, 'Vitreous Mercoxit', 17870, 40, 25595.818571429, 6398.95, 0, '35_64_11', 'secondary', 46, 1),
(49, 'Glacial Mass', 16263, 1000, 1, 1, 1, '51_64_4', 'primary', NULL, 2),
(50, 'Smooth Glacial Mass', 17977, 1000, 1, 1, 1, '51_64_4', 'secondary', 49, 2),
(51, 'Clear Icicle', 16262, 1000, 1, 1, 1, '51_64_2', 'primary', NULL, 2),
(52, 'Enriched Clear Icicle', 17978, 1000, 1000, 1, 1, '51_64_2', 'secondary', 51, 2),
(53, 'Blue Ice', 16264, 1000, 1, 1, 1, '51_64_5', 'primary', NULL, 2),
(54, 'Thick Blue Ice', 17975, 1000, 1, 1, 1, '51_64_5', 'secondary', 53, 2),
(55, 'White Glaze', 16265, 1000, 1, 1, 1, '51_64_8', 'primary', NULL, 2),
(56, 'Pristine White Glaze', 17976, 1000, 1, 1, 1, '51_64_8', 'secondary', 55, 2),
(57, 'Glare Crust', 16266, 1000, 1, 1, 0.4, '51_64_1', 'primary', NULL, 2),
(58, 'Dark Glitter', 16267, 1000, 1, 1, 0.1, '51_64_3', 'primary', NULL, 2),
(59, 'Gelidus', 16268, 1000, 1, 1, 0, '51_64_6', 'primary', NULL, 2),
(60, 'Krystallos', 16269, 1000, 1, 1, 0, '51_64_9', 'primary', NULL, 2);

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
