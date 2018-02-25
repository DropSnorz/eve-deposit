-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 25 Février 2018 à 14:19
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
('api_update_lock', 'free'),
('last_api_pull_date', '2018-02-25 12:50:41');

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
(1, 'Tritanium', 1, 0, 5.71, 1),
(2, 'Pyerite', 2, 0, 5.73, 1),
(3, 'Mexallon', 3, 0, 75.7, 1),
(4, 'Isogen', 4, 0, 52.4, 1),
(5, 'Nocxium', 5, 0, 386, 1),
(6, 'Zydrine', 6, 0, 1130, 1),
(7, 'Megacyte', 7, 0, 11350, 1),
(8, 'Morphite', 8, 0, 11400, 1),
(9, 'Heavy Water', 16272, 1, 1, 3),
(10, 'Liquid Ozone', 16273, 1, 1, 3),
(11, 'Strontium', 16275, 1, 1, 3),
(12, 'Oxygen Isotopes', 17887, 1, 1, 3),
(13, 'Helium Isotopes', 16274, 1, 1, 3),
(14, 'Hydrogen Isotopes', 17889, 1, 1, 3),
(15, 'Nitrogen Isotopes', 17888, 1, 1, 3),
(16, 'Atmospheric Gases', 16634, 1, 1, 2),
(17, 'Atmospheric Cadmium', 16643, 1, 1, 2),
(18, 'Caesium', 16647, 1, 1, 2),
(19, 'Chromium', 16641, 1, 1, 2),
(20, 'Cobalt', 16640, 1, 1, 2),
(21, 'Dysprosium', 16650, 1, 1, 2),
(22, 'Evaporite Deposits', 16635, 1, 1, 2),
(23, 'Hafnium', 16648, 1, 1, 2),
(24, 'Hydrocarbons', 16633, 1, 1, 2),
(25, 'Mercury', 16646, 1, 1, 2),
(26, 'Neodynium', 16651, 1, 1, 2),
(27, 'Platinium', 16644, 1, 1, 2),
(28, 'Promethium', 16652, 1, 1, 2),
(29, 'Scandium', 16639, 1, 1, 2),
(30, 'Silicates', 16636, 1, 1, 2),
(31, 'Technetium', 16649, 1, 1, 2),
(32, 'Thulium', 16649, 1, 1, 2),
(33, 'Titanium', 16638, 1, 1, 2),
(34, 'Tungsten', 16637, 1, 1, 2),
(35, 'Vanadium', 16642, 1, 1, 2);

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
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `variantBonus` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9C1BDBAC4643D4C7` (`id_primaryOre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `ore`
--

INSERT INTO `ore` (`id`, `name`, `ref`, `unitVolume`, `unitPrice`, `normalizedPrice`, `securityLevel`, `graphicId`, `discr`, `id_primaryOre`, `type`, `special`, `category`, `variantBonus`) VALUES
(1, 'Veldspar', 1230, 0.1, 16.555714285714, 1655.57, 1, '24_64_1', 'primary', NULL, 1, 0, NULL, NULL),
(2, 'Concentrated Veldspar', 17470, 0.1, 16.431428571429, 1643.14, 1, '24_64_1', 'secondary', 1, 1, 0, NULL, 0.05),
(3, 'Dense Veldspar', 17471, 0.1, 17.872857142857, 1787.28, 1, '24_64_1', 'secondary', 1, 1, 0, NULL, 0.1),
(4, 'Scordite', 1228, 0.15, 18.697142857143, 1246.47, 1, '23_64_15', 'primary', NULL, 1, 0, NULL, NULL),
(5, 'Condensed Scordite', 17463, 0.15, 18.428571428571, 1228.57, 1, '23_64_15', 'secondary', 4, 1, 0, NULL, 0.05),
(6, 'Massive Scordite', 17464, 0.15, 19.311428571429, 1287.42, 1, '23_64_15', 'secondary', 4, 1, 0, NULL, 0.1),
(7, 'Dark Ochre', 1232, 8, 0, 0, 0, '23_64_8', 'primary', NULL, 1, 0, NULL, NULL),
(8, 'Onyx Ochre', 17436, 8, 798.69857142857, 998.37, 0, '23_64_8', 'secondary', 7, 1, 0, NULL, 0.05),
(9, 'Obsidian Ochre', 17437, 8, 956.07, 1195.08, 0, '23_64_8', 'secondary', 7, 1, 0, NULL, 0.1),
(10, 'Kernite', 20, 1.2, 240.16, 2001.33, 0.7, '23_64_12', 'primary', NULL, 1, 0, NULL, NULL),
(11, 'Luminous Kernite', 17452, 1.2, 189.33714285714, 1577.8, 0.07, '23_64_12', 'secondary', 10, 1, 0, NULL, 0.05),
(12, 'Fiery Kernite', 17453, 1.2, 194.43428571429, 1620.28, 0.7, '23_64_12', 'secondary', 10, 1, 0, NULL, 0.1),
(13, 'Omber', 1227, 0.6, 99.241428571429, 1654.02, 0.7, '23_64_13', 'primary', NULL, 1, 0, NULL, NULL),
(14, 'Silvery Omber', 17867, 0.6, 69.262857142857, 1154.38, 0.7, '23_64_13', 'secondary', 13, 1, 0, NULL, 0.05),
(15, 'Golden Omber', 17868, 0.6, 77.517142857143, 1291.95, 0.7, '23_64_13', 'secondary', 13, 1, 0, NULL, 0.1),
(16, 'Hedbergite', 21, 3, 327.18, 1090.6, 0.2, '23_64_9', 'primary', NULL, 1, 0, NULL, NULL),
(17, 'Vitric Hedbergite', 17440, 3, 410.79, 1369.3, 0.2, '23_64_9', 'secondary', 16, 1, 0, NULL, 0.05),
(18, 'Glazed Hedbergite', 17441, 3, 396.27714285714, 1320.92, 0.2, '23_64_9', 'secondary', 16, 1, 0, NULL, 0.1),
(19, 'Pyroxeres', 1224, 0.3, 50.378571428571, 1679.28, 0.9, '23_64_16', 'primary', NULL, 1, 0, NULL, NULL),
(20, 'Solid Pyroxeres', 17459, 0.3, 49.64, 1654.66, 0.9, '23_64_16', 'secondary', 19, 1, 0, NULL, 0.05),
(21, 'Viscous Pyroxeres', 17460, 0.3, 52.215714285714, 1740.52, 0.9, '23_64_16', 'secondary', 19, 1, 0, NULL, 0.1),
(22, 'Hemorphite', 1231, 3, 602.24285714286, 2007.47, 0.2, '23_64_10', 'primary', NULL, 1, 0, NULL, NULL),
(23, 'Vivid Hemorphite', 17444, 3, 352.37428571429, 1174.58, 0.2, '23_64_10', 'secondary', 22, 1, 0, NULL, 0.05),
(24, 'Radiant Hemorphite', 17445, 3, 437.05285714286, 1456.84, 0.2, '23_64_10', 'secondary', 22, 1, 0, NULL, 0.1),
(25, 'Plagioclase', 18, 0.35, 60.588571428571, 1731.1, 0.9, '24_64_2', 'primary', NULL, 1, 0, NULL, NULL),
(26, 'Azure Plagioclase', 17455, 0.35, 65.734285714286, 1878.12, 0.9, '24_64_2', 'secondary', 25, 1, 0, NULL, 0.05),
(27, 'Rich Plagioclase', 17456, 0.35, 68.25, 1950, 0.9, '24_64_2', 'secondary', 25, 1, 0, NULL, 0.1),
(28, 'Jaspet', 1226, 2, 375.01428571429, 1875.07, 0.4, '23_64_11', 'primary', NULL, 1, 0, NULL, NULL),
(29, 'Pure Jaspet', 17448, 2, 377.58, 1887.9, 0.4, '23_64_11', 'secondary', 28, 1, 0, NULL, 0.05),
(30, 'Pristine Jaspet', 17449, 2, 373.07571428571, 1865.37, 0.4, '23_64_11', 'secondary', 28, 1, 0, NULL, 0.1),
(31, 'Crokite', 1225, 16, 3634.0628571429, 2271.28, 0, '23_64_7', 'primary', NULL, 1, 0, NULL, NULL),
(32, 'Sharp Crokite', 17432, 16, 2483.3528571429, 1552.09, 0, '23_64_7', 'secondary', 31, 1, 0, NULL, 0.05),
(33, 'Crystalline Crokite', 17433, 16, 2700.7185714286, 1687.94, 0, '23_64_7', 'secondary', 31, 1, 0, NULL, 0.1),
(34, 'Spodumain', 19, 16, 3231.0228571429, 2019.38, 0, '23_64_14', 'primary', NULL, 1, 0, NULL, NULL),
(35, 'Bright Spodumain', 17466, 16, 3050.53, 1906.58, 0, '23_64_14', 'secondary', 34, 1, 0, NULL, 0.05),
(36, 'Gleaming Spodumain', 17467, 16, 3492.9771428571, 2183.11, 0, '23_64_14', 'secondary', 34, 1, 0, NULL, 0.1),
(37, 'Gneiss', 1229, 5, 1517.45, 3034.9, 0, '25_64_1', 'primary', NULL, 1, 0, NULL, NULL),
(38, 'Iridescent Gneiss', 17865, 5, 976.28428571429, 1952.56, 0, '25_64_1', 'secondary', 37, 1, 0, NULL, 0.05),
(39, 'Prismatic Gneiss', 17866, 5, 1505.3, 3010.59, 0, '25_64_1', 'secondary', 37, 1, 0, NULL, 0.1),
(40, 'Bistot', 1223, 16, 4849.3, 3030.81, 0, '23_64_6', 'primary', NULL, 1, 0, NULL, NULL),
(41, 'Triclinic Bistot', 17428, 16, 2550.1471428571, 1593.84, 0, '23_64_6', 'secondary', 40, 1, 0, NULL, 0.05),
(42, 'Monoclinic Bistot', 17429, 16, 3496.0642857143, 2185.04, 0, '23_64_6', 'secondary', 40, 1, 0, NULL, 0.1),
(43, 'Arkonor', 22, 16, 4317.8371428571, 2698.64, 0, '23_64_5', 'primary', NULL, 1, 0, NULL, NULL),
(44, 'Crimson Arkonor', 17425, 16, 4850.6985714286, 3031.68, 0, '23_64_5', 'secondary', 43, 1, 0, NULL, 0.05),
(45, 'Prime Arkonor', 17426, 16, 5829.0757142857, 3643.17, 0, '23_64_5', 'secondary', 43, 1, 0, NULL, 0.1),
(46, 'Mercoxit', 11396, 40, 21006.382857143, 5251.59, 0, '35_64_11', 'primary', NULL, 1, 1, NULL, NULL),
(47, 'Magma Mercoxit', 17869, 40, 18209.48, 4552.37, 0, '35_64_11', 'secondary', 46, 1, 1, NULL, 0.05),
(48, 'Vitreous Mercoxit', 17870, 40, 20116.607142857, 5029.15, 0, '35_64_11', 'secondary', 46, 1, 1, NULL, 0.1),
(49, 'Glacial Mass', 16263, 1000, 217142.88285714, 2171.42, 1, '51_64_4', 'primary', NULL, 3, 0, NULL, NULL),
(50, 'Smooth Glacial Mass', 17977, 1000, 309747.73714286, 3097.47, 1, '51_64_4', 'secondary', 49, 3, 0, NULL, NULL),
(51, 'Clear Icicle', 16262, 1000, 238921.22, 2389.21, 1, '51_64_2', 'primary', NULL, 3, 0, NULL, NULL),
(52, 'Enriched Clear Icicle', 17978, 1000, 180000.01428571, 1800, 1, '51_64_2', 'secondary', 51, 3, 0, NULL, NULL),
(53, 'Blue Ice', 16264, 1000, 326295.15571429, 3262.95, 1, '51_64_5', 'primary', NULL, 3, 0, NULL, NULL),
(54, 'Thick Blue Ice', 17975, 1000, 100011.96285714, 1000.11, 1, '51_64_5', 'secondary', 53, 3, 0, NULL, NULL),
(55, 'White Glaze', 16265, 1000, 241858.65142857, 2418.58, 1, '51_64_8', 'primary', NULL, 3, 0, NULL, NULL),
(56, 'Pristine White Glaze', 17976, 1000, 52206.011428571, 522.06, 1, '51_64_8', 'secondary', 55, 3, 0, NULL, NULL),
(57, 'Glare Crust', 16266, 1000, 461095.78, 4610.95, 0.4, '51_64_1', 'primary', NULL, 3, 0, NULL, NULL),
(58, 'Dark Glitter', 16267, 1000, 338285.43571429, 3382.85, 0.1, '51_64_3', 'primary', NULL, 3, 0, NULL, NULL),
(59, 'Gelidus', 16268, 1000, 420002.07285714, 4200.02, 0, '51_64_6', 'primary', NULL, 3, 0, NULL, NULL),
(60, 'Krystallos', 16269, 1000, 388571.42714286, 3885.71, 0, '51_64_9', 'primary', NULL, 3, 0, NULL, NULL),
(61, 'Fullerite-C50', 30370, 1, 4017.99, 40179.9, 0, '62_64_9', 'primary', NULL, 4, 0, NULL, NULL),
(62, 'Fullerite-C60', 30371, 1, 1576.5171428571, 15765.17, 0, '62_64_9', 'primary', NULL, 4, 0, NULL, NULL),
(64, 'Fullerite-C70', 30372, 1, 2428.9828571429, 24289.82, 0, '62_64_11', 'primary', NULL, 4, 0, NULL, NULL),
(65, 'Fullerite-C72', 30373, 2, 8789.18, 43945.89, 0, '62_64_14', 'primary', NULL, 4, 0, NULL, NULL),
(66, 'Fullerite-C84', 30374, 2, 4083.7942857143, 20418.97, 0, '62_64_13', 'primary', NULL, 4, 0, NULL, NULL),
(67, 'Fullerite-C28', 30375, 2, 7663.7742857143, 38318.87, 0, '62_64_13', 'primary', NULL, 4, 0, NULL, NULL),
(68, 'Fullerite-C32', 30376, 5, 15973.371428571, 31946.74, 0, '62_64_16', 'primary', NULL, 4, 0, NULL, NULL),
(69, 'Fullerite-C320', 30377, 5, 53003.175714286, 106006.35, 0, '62_64_15', 'primary', NULL, 4, 0, NULL, NULL),
(70, 'Fullerite-C540', 30378, 10, 46568.951428571, 46568.95, 0, '62_64_15', 'primary', NULL, 4, 0, NULL, NULL),
(71, 'Bitumens', 45492, 10, 14687.288571429, 14687.28, 1, '45492_64', 'primary', NULL, 2, 0, 'Ubiquitous Moon Ores', NULL),
(72, 'Brimful Bitumens', 46284, 10, 2507.1485714286, 2507.14, 1, '46284_64', 'secondary', 71, 2, 0, 'Ubiquitous Moon Ores', 0.15),
(73, 'Glistening Bitumens', 46284, 10, 2507.1485714286, 2507.14, 1, '46284_64', 'secondary', 71, 2, 0, 'Ubiquitous Moon Ores', 1),
(74, 'Coesite', 45493, 10, 4285.8585714286, 4285.85, 1, '45493_64', 'primary', NULL, 2, 0, 'Ubiquitous Moon Ores', NULL),
(75, 'Brimful Coesite', 46286, 10, 3806.1328571429, 3806.13, 1, '46286_64', 'secondary', 74, 2, 0, 'Ubiquitous Moon Ores', 0.15),
(76, 'Glistening Coesite', 46287, 10, 7285.7142857143, 7285.71, 1, '46287_64', 'secondary', 74, 2, 0, 'Ubiquitous Moon Ores', 1),
(77, 'Sylvite', 45491, 10, 2973.3585714286, 2973.35, 1, '45491_64', 'primary', NULL, 2, 0, 'Ubiquitous Moon Ores', NULL),
(78, 'Brimful Sylite', 46282, 10, 1650.0042857143, 1650, 1, '46282_64', 'secondary', 77, 2, 0, 'Ubiquitous Moon Ores', 0.15),
(79, 'Glistening Sylvite', 46283, 10, 4571.4685714286, 4571.46, 1, '46283_64', 'secondary', 77, 2, 0, 'Ubiquitous Moon Ores', 1),
(80, 'Zeolites', 45490, 10, 9637.5871428571, 9637.58, 1, '45490_64', 'primary', NULL, 2, 0, 'Ubiquitous Moon Ores', NULL),
(81, 'Brimful Zeolites', 46280, 10, 7985.0885714286, 7985.08, 1, '46280_64', 'secondary', 80, 2, 0, 'Ubiquitous Moon Ores', 0.15),
(82, 'Glistening Zeolites', 46281, 10, 2000.0657142857, 2000.06, 1, '46281_64', 'secondary', 80, 2, 0, 'Ubiquitous Moon Ores', 1),
(83, 'Cobaltite', 45494, 10, 21580.08, 21580.08, 0.9, '45494_64', 'primary', NULL, 2, 0, 'Common Moon Ores', NULL),
(84, 'Copious Cobaltite', 46288, 10, 3200.0228571429, 3200.02, 0.9, '46288_64', 'secondary', 83, 2, 0, 'Common Moon Ores', 0.15),
(85, 'Twinkling Cobaltite', 46289, 10, 31225.247142857, 31225.24, 0.9, '46289_64', 'secondary', 83, 2, 0, 'Common Moon Ores', 1),
(86, 'Euxenite', 45495, 10, 4728.9, 4728.9, 0.9, '45495_64', 'primary', NULL, 2, 0, 'Common Moon Ores', NULL),
(87, 'Copious Euxenite', 46290, 10, 1714.5857142857, 1714.58, 0.9, '46290_64', 'secondary', 86, 2, 0, 'Common Moon Ores', 0.15),
(88, 'Twinkling Euxenite', 46291, 10, 11099.424285714, 11099.42, 0.9, '46291_64', 'secondary', 86, 2, 0, 'Common Moon Ores', 1),
(89, 'Scheelite', 45497, 10, 7615.2314285714, 7615.23, 0.9, '45497_64', 'primary', NULL, 2, 0, 'Common Moon Ores', NULL),
(90, 'Copious Scheelite', 46294, 10, 3484.4928571429, 3484.49, 0.9, '46294_64', 'secondary', 89, 2, 0, 'Common Moon Ores', 0.15),
(91, 'Twinkling Scheelite', 46295, 10, 2828.8571428571, 2828.85, 0.9, '46295_64', 'secondary', 89, 2, 0, 'Common Moon Ores', 1),
(92, 'Titanite', 45496, 10, 10071.428571429, 10071.42, 0.9, '45496_64', 'primary', NULL, 2, 0, 'Common Moon Ores', NULL),
(93, 'Copious Titanite', 46292, 10, 3543.4285714286, 3543.42, 0.9, '46292_64', 'secondary', 92, 2, 0, 'Common Moon Ores', 0.15),
(94, 'Twinkling Titanie', 46293, 10, 11904.725714286, 11904.72, 0.9, '46293_64', 'secondary', 92, 2, 0, 'Common Moon Ores', 1),
(95, 'Chromite', 45501, 10, 2844.0057142857, 2844, 1, '45501_64', 'primary', NULL, 2, 0, 'Uncommon Moon Ores', NULL),
(96, 'Lavish Chromite', 46302, 10, 2501.5757142857, 2501.57, 1, '46302_64', 'secondary', 95, 2, 0, 'Uncommon Moon Ores', 0.15),
(97, 'Shimmering Chromite', 46303, 10, 7543.1457142857, 7543.14, 1, '46303_64', 'secondary', 95, 2, 0, 'Uncommon Moon Ores', 1),
(98, 'Otavite', 45498, 10, 1833.1485714286, 1833.14, 1, '45501_64', 'primary', NULL, 2, 0, 'Uncommon Moon Ores', NULL),
(99, 'Lavish Otavite', 46296, 10, 36485.705714286, 36485.7, 1, '46296_64', 'secondary', 98, 2, 0, 'Uncommon Moon Ores', 0.15),
(100, 'Shimmering Otavaite', 46297, 10, 28141.291428571, 28141.29, 1, '46297_64', 'secondary', 98, 2, 0, 'Uncommon Moon Ores', 1),
(101, 'Sperrylite', 45499, 10, 2686.58, 2686.58, 1, '45499_64', 'primary', NULL, 2, 0, 'Uncommon Moon Ores', NULL),
(102, 'Lavish Sperrylite', 46298, 10, 2891.9957142857, 2891.99, 1, '46298_64', 'secondary', 101, 2, 0, 'Uncommon Moon Ores', 0.15),
(103, 'Shimmering Sperrylite', 46299, 10, 3501.01, 3501.01, 1, '46299_64', 'secondary', 101, 2, 0, 'Uncommon Moon Ores', 1),
(104, 'Vanadinite', 45500, 10, 0, 0, 1, '45500_64', 'primary', NULL, 2, 0, 'Uncommon Moon Ores', NULL),
(105, 'Lavish Vanadinite', 46300, 10, 12101.148571429, 12101.14, 1, '46300_64', 'secondary', 104, 2, 0, 'Uncommon Moon Ores', 0.15),
(106, 'Shimmering Vanadinite', 46301, 10, 2829.7314285714, 2829.73, 1, '46301_64', 'secondary', 104, 2, 0, 'Uncommon Moon Ores', 1),
(107, 'Replete Carnotite', 46304, 10, 8572.0042857143, 8572, 0.7, '46304_64', 'secondary', 118, 2, 0, 'Rare Moon Ores', 0.15),
(108, 'Glowing Carnotite', 46305, 10, 6233.3557142857, 6233.35, 0.7, '46305_64', 'secondary', 118, 2, 0, 'Rare Moon Ores', 1),
(109, 'Cinnabar', 45506, 10, 1691.8285714286, 1691.82, 0.7, '45506_64', 'primary', NULL, 2, 0, 'Rare Moon Ores', NULL),
(110, 'Replete Cinnabar', 46310, 10, 5657.4385714286, 5657.43, 0.7, '46310_64', 'secondary', 109, 2, 0, 'Rare Moon Ores', 0.15),
(111, 'Glowing Cinnabar', 46311, 10, 10000.145714286, 10000.14, 0.7, '46311_64', 'secondary', 109, 2, 0, 'Rare Moon Ores', 1),
(112, 'Pollucite', 45504, 10, 0, 0, 0.7, '45504_64', 'primary', NULL, 2, 0, 'Rare Moon Ores', NULL),
(113, 'Replete Pollucite', 46308, 10, 9177.6671428571, 9177.66, 0.7, '46308_64', 'secondary', 112, 2, 0, 'Rare Moon Ores', 0.15),
(114, 'Glowing Pollucite', 46309, 10, 10714.317142857, 10714.31, 0.7, '46309_64', 'secondary', 112, 2, 0, 'Rare Moon Ores', 1),
(115, 'Zircon', 45503, 10, 5200.0242857143, 5200.02, 0.7, '45503_64', 'primary', NULL, 2, 0, 'Rare Moon Ores', NULL),
(116, 'Replete Zircon', 46306, 10, 7935.74, 7935.74, 0.7, '46306_64', 'secondary', 115, 2, 0, 'Rare Moon Ores', 0.15),
(117, 'Glowing Zircon', 46307, 10, 15757.152857143, 15757.15, 0.7, '46307_64', 'secondary', 115, 2, 0, 'Rare Moon Ores', 1),
(118, 'Carnotite', 45502, 10, 5714.3028571429, 5714.3, 0.7, '45502_64', 'primary', NULL, 2, 0, 'Rare Moon Ores', NULL),
(119, 'Loparite', 45512, 10, 10914.285714286, 10914.28, 0.6, '45512_64', 'primary', NULL, 2, 0, 'Exceptional Moon Ores', NULL),
(120, 'Bountiful Loparite', 46316, 10, 15214.285714286, 15214.28, 0.6, '46316_64', 'secondary', 119, 2, 0, 'Exceptional Moon Ores', 0.15),
(121, 'Shining Loparite', 46317, 10, 14900, 14900, 0.6, '46317_64', 'secondary', 119, 2, 0, 'Exceptional Moon Ores', 1),
(122, 'Monazite', 45511, 10, 12142.691428571, 12142.69, 0.6, '45511_64', 'primary', NULL, 2, 0, 'Exceptional Moon Ores', NULL),
(123, 'Bountiful Monazite', 46314, 10, 12875.001428571, 12875, 0.6, '46314_64', 'secondary', 122, 2, 0, 'Exceptional Moon Ores', 0.15),
(124, 'Shining Monazite', 46315, 10, 140000.02142857, 140000.02, 0.6, '46315_64', 'secondary', 122, 2, 0, 'Exceptional Moon Ores', 1),
(125, 'Xenotime', 45510, 10, 11634.884285714, 11634.88, 0.6, '45510_64', 'primary', NULL, 2, 0, 'Exceptional Moon Ores', NULL),
(126, 'Bountiful Xenotime', 46312, 10, 16071.428571429, 16071.42, 0.6, '46312_64', 'secondary', 125, 2, 0, 'Exceptional Moon Ores', 0.15),
(127, 'Shining Xenotime', 46313, 10, 18285.714285714, 18285.71, 0.6, '46313_64', 'secondary', 125, 2, 0, 'Exceptional Moon Ores', 1),
(128, 'Ytterbite', 45513, 10, 11800, 11800, 0.6, '45513_64', 'primary', NULL, 2, 0, 'Exceptional Moon Ores', NULL),
(129, 'Bountiful Ytterbite', 46318, 10, 10415.147142857, 10415.14, 0.6, '46318_64', 'secondary', 128, 2, 0, 'Exceptional Moon Ores', 0.15),
(130, 'Shining Ytterbite', 46319, 10, 11428.58, 11428.58, 0.6, '46319_64', 'secondary', 128, 2, 0, 'Exceptional Moon Ores', 1),
(131, 'Stable Veldspar', 46689, 0.1, 13.982857142857, 1398.28, 1, '24_64_1', 'secondary', 1, 1, 0, NULL, 0.15),
(132, 'Glossy Scordite', 46687, 0.15, 13.62, 908, 1, '23_64_15', 'secondary', 4, 1, 0, NULL, 0.15),
(133, 'Jet Ochre', 46675, 8, 955.05285714286, 1193.81, 1, '23_64_8', 'secondary', 7, 1, 0, NULL, 0.15),
(134, 'Resplendant Kernite', 46683, 1.2, 132.02285714286, 1100.19, 1, '23_64_12', 'secondary', 10, 1, 0, NULL, 0.15),
(135, 'Platinoid Omber', 46684, 0.6, 54.347142857143, 905.78, 1, '23_64_13', 'secondary', 13, 1, 0, NULL, 0.15),
(136, 'Lustrous Hedbergite', 46680, 3, 412.92428571429, 1376.41, 1, '23_64_9', 'secondary', 16, 1, 0, NULL, 0.15),
(137, 'Opulent Pyroxeres', 46686, 0.3, 51.32, 1710.66, 1, '23_64_16', 'secondary', 19, 1, 0, NULL, 0.15),
(138, 'Scintillating Hemorphite', 46681, 3, 264.28571428571, 880.95, 1, '23_64_10', 'secondary', 22, 1, 0, NULL, 0.15),
(139, 'Sparkling Plagioclase', 46685, 0.35, 31.428571428571, 897.95, 1, '24_64_2', 'secondary', 25, 1, 0, NULL, 0.15),
(140, 'Immaculate Jaspet', 46682, 2, 0, 0, 1, '23_64_11', 'secondary', 28, 1, 0, NULL, 0.15),
(141, 'Pellucid Crokite', 46677, 16, 2700.4014285714, 1687.75, 1, '23_64_7', 'secondary', 31, 1, 0, NULL, 0.15),
(142, 'Dazzling Spodumain', 46688, 16, 3110.21, 1943.88, 1, '23_64_14', 'secondary', 34, 1, 0, NULL, 0.15),
(143, 'Brilliant Gneiss', 46679, 5, 1300.1328571429, 2600.26, 1, '25_64_1', 'secondary', 37, 1, 0, NULL, 0.15),
(144, 'Cubic Bistot', 46676, 16, 7159.81, 4474.88, 1, '23_64_6', 'secondary', 40, 1, 0, NULL, 0.15),
(145, 'Flawless Arkonor', 46678, 16, 4517.6857142857, 2823.55, 1, '23_64_5', 'secondary', 43, 1, 0, NULL, 0.15);

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
(75, 55, 15, 414),
(76, 71, 24, 0.065),
(77, 71, 1, 6),
(78, 71, 2, 6),
(79, 71, 3, 0.4),
(80, 74, 1, 10),
(81, 74, 2, 2),
(82, 74, 3, 0.4),
(83, 74, 30, 0.065),
(84, 77, 1, 8),
(85, 77, 2, 4),
(86, 77, 3, 0.4),
(87, 77, 22, 0.065),
(88, 80, 1, 4),
(89, 80, 1, 8),
(90, 80, 3, 0.4),
(91, 80, 19, 0.065),
(92, 83, 1, 7.5),
(93, 83, 2, 10),
(94, 83, 3, 0.5),
(95, 83, 20, 0.04),
(96, 86, 1, 10),
(97, 86, 2, 7.5),
(98, 86, 3, 0.5),
(99, 86, 29, 0.04),
(100, 89, 1, 12.5),
(101, 89, 2, 5),
(102, 89, 3, 0.5),
(103, 89, 35, 0.04),
(104, 92, 1, 15),
(105, 92, 2, 2.5),
(106, 92, 3, 0.5),
(107, 92, 32, 0.04),
(108, 95, 2, 5),
(109, 95, 3, 1.25),
(110, 95, 4, 0.75),
(111, 95, 5, 0.05),
(112, 95, 24, 0.01),
(113, 95, 19, 0.04),
(114, 98, 2, 5),
(115, 98, 3, 1.5),
(116, 98, 4, 0.5),
(117, 98, 5, 0.05),
(118, 98, 16, 0.01),
(119, 98, 17, 0.04),
(120, 101, 2, 5),
(121, 101, 3, 1),
(122, 101, 4, 1),
(123, 101, 6, 0.05),
(124, 101, 22, 0.01),
(125, 101, 27, 0.04),
(126, 104, 2, 5),
(127, 104, 3, 0.75),
(128, 104, 4, 1.25),
(129, 104, 6, 0.05),
(130, 104, 30, 0.01),
(131, 104, 35, 0.04),
(132, 118, 3, 1),
(133, 118, 4, 1.25),
(134, 118, 6, 0.05),
(135, 118, 16, 0.015),
(136, 118, 20, 0.01),
(137, 118, 31, 0.05),
(138, 109, 3, 1.5),
(139, 109, 4, 0.75),
(140, 109, 7, 0.05),
(141, 109, 22, 0.015),
(142, 109, 34, 0.01),
(143, 109, 25, 0.05),
(144, 112, 3, 1.25),
(145, 112, 4, 1),
(146, 112, 6, 0.05),
(147, 112, 24, 0.015),
(148, 112, 29, 0.01),
(149, 112, 18, 0.05),
(150, 115, 3, 1.75),
(151, 115, 4, 0.5),
(152, 115, 7, 0.05),
(153, 115, 30, 0.015),
(154, 115, 33, 0.01),
(155, 115, 23, 0.05),
(156, 119, 5, 0.1),
(157, 119, 6, 0.2),
(158, 119, 7, 0.05),
(159, 119, 24, 0.02),
(160, 119, 29, 0.02),
(161, 119, 27, 0.01),
(162, 119, 28, 0.022),
(163, 122, 5, 0.05),
(164, 122, 6, 0.15),
(165, 122, 7, 0.15),
(166, 122, 22, 0.02),
(167, 122, 34, 0.02),
(168, 122, 19, 0.01),
(169, 122, 26, 0.022),
(170, 125, 5, 0.2),
(171, 125, 6, 0.1),
(172, 125, 7, 0.05),
(173, 125, 16, 0.02),
(174, 125, 20, 0.02),
(175, 125, 35, 0.01),
(176, 125, 21, 0.022),
(177, 128, 5, 0.05),
(178, 128, 6, 0.1),
(179, 128, 7, 0.2),
(180, 128, 30, 0.02),
(181, 128, 33, 0.02),
(182, 128, 17, 0.01),
(183, 128, 32, 0.022);

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
