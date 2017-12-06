-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 06 Décembre 2017 à 20:00
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
('last_api_pull_date', '2017-11-26 20:07:18');

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
  `special` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_9C1BDBAC4643D4C7` (`id_primaryOre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `ore`
--

INSERT INTO `ore` (`id`, `name`, `ref`, `unitVolume`, `unitPrice`, `normalizedPrice`, `securityLevel`, `graphicId`, `discr`, `id_primaryOre`, `type`, `special`) VALUES
(1, 'Veldspar', 1230, 0.1, 14.374285714286, 1437.42, 1, '24_64_1', 'primary', NULL, 1, 0),
(2, 'Concentrated Veldspar', 17470, 0.1, 14.5, 1450, 1, '24_64_1', 'secondary', 1, 1, 0),
(3, 'Dense Veldspar', 17471, 0.1, 15.807142857143, 1580.71, 1, '24_64_1', 'secondary', 1, 1, 0),
(4, 'Scordite', 1228, 0.15, 17.7, 1179.99, 1, '23_64_15', 'primary', NULL, 1, 0),
(5, 'Condensed Scordite', 17463, 0.15, 18.065714285714, 1204.38, 1, '23_64_15', 'secondary', 4, 1, 0),
(6, 'Massive Scordite', 17464, 0.15, 18.448571428571, 1229.9, 1, '23_64_15', 'secondary', 4, 1, 0),
(7, 'Dark Ochre', 1232, 8, 1020.7542857143, 1275.94, 0, '23_64_8', 'primary', NULL, 1, 0),
(8, 'Onyx Ochre', 17436, 8, 828.65142857143, 1035.81, 0, '23_64_8', 'secondary', 7, 1, 0),
(9, 'Obsidian Ochre', 17437, 8, 955.82, 1194.77, 0, '23_64_8', 'secondary', 7, 1, 0),
(10, 'Kernite', 20, 1.2, 265.64571428571, 2213.71, 0.7, '23_64_12', 'primary', NULL, 1, 0),
(11, 'Luminous Kernite', 17452, 1.2, 154.62142857143, 1288.51, 0.07, '23_64_12', 'secondary', 10, 1, 0),
(12, 'Fiery Kernite', 17453, 1.2, 203.65, 1697.08, 0.7, '23_64_12', 'secondary', 10, 1, 0),
(13, 'Omber', 1227, 0.6, 90.058571428571, 1500.97, 0.7, '23_64_13', 'primary', NULL, 1, 0),
(14, 'Silvery Omber', 17867, 0.6, 69.648571428571, 1160.8, 0.7, '23_64_13', 'secondary', 13, 1, 0),
(15, 'Golden Omber', 17868, 0.6, 75.241428571429, 1254.02, 0.7, '23_64_13', 'secondary', 13, 1, 0),
(16, 'Hedbergite', 21, 3, 474.99, 1583.29, 0.2, '23_64_9', 'primary', NULL, 1, 0),
(17, 'Vitric Hedbergite', 17440, 3, 410.10714285714, 1367.02, 0.2, '23_64_9', 'secondary', 16, 1, 0),
(18, 'Glazed Hedbergite', 17441, 3, 404.69714285714, 1348.99, 0.2, '23_64_9', 'secondary', 16, 1, 0),
(19, 'Pyroxeres', 1224, 0.3, 47.168571428571, 1572.28, 0.9, '23_64_16', 'primary', NULL, 1, 0),
(20, 'Solid Pyroxeres', 17459, 0.3, 46.872857142857, 1562.42, 0.9, '23_64_16', 'secondary', 19, 1, 0),
(21, 'Viscous Pyroxeres', 17460, 0.3, 51.458571428571, 1715.28, 0.9, '23_64_16', 'secondary', 19, 1, 0),
(22, 'Hemorphite', 1231, 3, 687.38857142857, 2291.29, 0.2, '23_64_10', 'primary', NULL, 1, 0),
(23, 'Vivid Hemorphite', 17444, 3, 436.28714285714, 1454.29, 0.2, '23_64_10', 'secondary', 22, 1, 0),
(24, 'Radiant Hemorphite', 17445, 3, 460.57285714286, 1535.24, 0.2, '23_64_10', 'secondary', 22, 1, 0),
(25, 'Plagioclase', 18, 0.35, 61.462857142857, 1756.08, 0.9, '24_64_2', 'primary', NULL, 1, 0),
(26, 'Azure Plagioclase', 17455, 0.35, 61.88, 1768, 0.9, '24_64_2', 'secondary', 25, 1, 0),
(27, 'Rich Plagioclase', 17456, 0.35, 66.768571428571, 1907.67, 0.9, '24_64_2', 'secondary', 25, 1, 0),
(28, 'Jaspet', 1226, 2, 314.58857142857, 1572.94, 0.4, '23_64_11', 'primary', NULL, 1, 0),
(29, 'Pure Jaspet', 17448, 2, 450.25, 2251.25, 0.4, '23_64_11', 'secondary', 28, 1, 0),
(30, 'Pristine Jaspet', 17449, 2, 446.19142857143, 2230.95, 0.4, '23_64_11', 'secondary', 28, 1, 0),
(31, 'Crokite', 1225, 16, 3545.1, 2215.68, 0, '23_64_7', 'primary', NULL, 1, 0),
(32, 'Sharp Crokite', 17432, 16, 2483.1371428571, 1551.96, 0, '23_64_7', 'secondary', 31, 1, 0),
(33, 'Crystalline Crokite', 17433, 16, 2492.4828571429, 1557.8, 0, '23_64_7', 'secondary', 31, 1, 0),
(34, 'Spodumain', 19, 16, 3227.08, 2016.92, 0, '23_64_14', 'primary', NULL, 1, 0),
(35, 'Bright Spodumain', 17466, 16, 3050.47, 1906.54, 0, '23_64_14', 'secondary', 34, 1, 0),
(36, 'Gleaming Spodumain', 17467, 16, 3165.3528571429, 1978.34, 0, '23_64_14', 'secondary', 34, 1, 0),
(37, 'Gneiss', 1229, 5, 1500.0128571429, 3000.02, 0, '25_64_1', 'primary', NULL, 1, 0),
(38, 'Iridescent Gneiss', 17865, 5, 1000, 2000, 0, '25_64_1', 'secondary', 37, 1, 0),
(39, 'Prismatic Gneiss', 17866, 5, 1214.36, 2428.71, 0, '25_64_1', 'secondary', 37, 1, 0),
(40, 'Bistot', 1223, 16, 4736.3142857143, 2960.19, 0, '23_64_6', 'primary', NULL, 1, 0),
(41, 'Triclinic Bistot', 17428, 16, 4264.52, 2665.32, 0, '23_64_6', 'secondary', 40, 1, 0),
(42, 'Monoclinic Bistot', 17429, 16, 3241.4942857143, 2025.93, 0, '23_64_6', 'secondary', 40, 1, 0),
(43, 'Arkonor', 22, 16, 4771.1514285714, 2981.96, 0, '23_64_5', 'primary', NULL, 1, 0),
(44, 'Crimson Arkonor', 17425, 16, 4980.82, 3113.01, 0, '23_64_5', 'secondary', 43, 1, 0),
(45, 'Prime Arkonor', 17426, 16, 4800.32, 3000.2, 0, '23_64_5', 'secondary', 43, 1, 0),
(46, 'Mercoxit', 11396, 40, 19006.08, 4751.51, 0, '35_64_11', 'primary', NULL, 1, 1),
(47, 'Magma Mercoxit', 17869, 40, 18057.475714286, 4514.36, 0, '35_64_11', 'secondary', 46, 1, 1),
(48, 'Vitreous Mercoxit', 17870, 40, 19572.007142857, 4893, 0, '35_64_11', 'secondary', 46, 1, 1),
(49, 'Glacial Mass', 16263, 1000, 180964.56285714, 1809.64, 1, '51_64_4', 'primary', NULL, 2, 0),
(50, 'Smooth Glacial Mass', 17977, 1000, 160263.26571429, 1602.63, 1, '51_64_4', 'secondary', 49, 2, 0),
(51, 'Clear Icicle', 16262, 1000, 193577.84571429, 1935.77, 1, '51_64_2', 'primary', NULL, 2, 0),
(52, 'Enriched Clear Icicle', 17978, 1000, 51857.314285714, 518.57, 1, '51_64_2', 'secondary', 51, 2, 0),
(53, 'Blue Ice', 16264, 1000, 217152.67428571, 2171.52, 1, '51_64_5', 'primary', NULL, 2, 0),
(54, 'Thick Blue Ice', 17975, 1000, 100011.82857143, 1000.11, 1, '51_64_5', 'secondary', 53, 2, 0),
(55, 'White Glaze', 16265, 1000, 212285.86285714, 2122.85, 1, '51_64_8', 'primary', NULL, 2, 0),
(56, 'Pristine White Glaze', 17976, 1000, 24850.72, 248.5, 1, '51_64_8', 'secondary', 55, 2, 0),
(57, 'Glare Crust', 16266, 1000, 631285.78285714, 6312.85, 0.4, '51_64_1', 'primary', NULL, 2, 0),
(58, 'Dark Glitter', 16267, 1000, 230369.29, 2303.69, 0.1, '51_64_3', 'primary', NULL, 2, 0),
(59, 'Gelidus', 16268, 1000, 420634.90285714, 4206.34, 0, '51_64_6', 'primary', NULL, 2, 0),
(60, 'Krystallos', 16269, 1000, 557370.03285714, 5573.7, 0, '51_64_9', 'primary', NULL, 2, 0),
(61, 'Fullerite-C50', 30370, 1, 5101.34, 51013.4, 0, '62_64_9', 'primary', NULL, 3, 0),
(62, 'Fullerite-C60', 30371, 1, 2263.5057142857, 22635.05, 0, '62_64_9', 'primary', NULL, 3, 0),
(64, 'Fullerite-C70', 30372, 1, 6660.5314285714, 66605.31, 0, '62_64_11', 'primary', NULL, 3, 0),
(65, 'Fullerite-C72', 30373, 2, 22252.172857143, 111260.86, 0, '62_64_14', 'primary', NULL, 3, 0),
(66, 'Fullerite-C84', 30374, 2, 5778.1971428571, 28890.98, 0, '62_64_13', 'primary', NULL, 3, 0),
(67, 'Fullerite-C28', 30375, 2, 17292.28, 86461.4, 0, '62_64_13', 'primary', NULL, 3, 0),
(68, 'Fullerite-C32', 30376, 5, 21476.695714286, 42953.39, 0, '62_64_16', 'primary', NULL, 3, 0),
(69, 'Fullerite-C320', 30377, 5, 63564.407142857, 127128.81, 0, '62_64_15', 'primary', NULL, 3, 0),
(70, 'Fullerite-C540', 30378, 10, 59226.9, 59226.9, 0, '62_64_15', 'primary', NULL, 3, 0);

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
(47, 46, 8, 0.075),
(48, 53, 9, 69),
(49, 53, 10, 35),
(50, 53, 11, 1),
(51, 53, 12, 414),
(52, 51, 9, 69),
(53, 51, 10, 35),
(54, 51, 11, 1),
(55, 51, 13, 414),
(56, 58, 9, 691),
(57, 58, 10, 1381),
(58, 58, 11, 69),
(59, 59, 9, 345),
(60, 59, 10, 691),
(61, 59, 11, 104),
(62, 49, 9, 69),
(63, 49, 10, 35),
(64, 49, 11, 1),
(65, 49, 14, 414),
(66, 57, 9, 1381),
(67, 57, 10, 691),
(68, 57, 11, 35),
(69, 60, 9, 173),
(70, 60, 10, 691),
(71, 60, 11, 173),
(72, 55, 9, 69),
(73, 55, 10, 35),
(74, 55, 11, 1),
(75, 55, 15, 414);

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
