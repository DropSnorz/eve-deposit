-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 07 Février 2018 à 18:07
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
('last_api_pull_date', '2018-02-07 13:23:23');

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
  PRIMARY KEY (`id`),
  KEY `IDX_9C1BDBAC4643D4C7` (`id_primaryOre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `ore`
--

INSERT INTO `ore` (`id`, `name`, `ref`, `unitVolume`, `unitPrice`, `normalizedPrice`, `securityLevel`, `graphicId`, `discr`, `id_primaryOre`, `type`, `special`, `category`) VALUES
(1, 'Veldspar', 1230, 0.1, 17.258571428571, 1725.85, 1, '24_64_1', 'primary', NULL, 1, 0, NULL),
(2, 'Concentrated Veldspar', 17470, 0.1, 17.085714285714, 1708.57, 1, '24_64_1', 'secondary', 1, 1, 0, NULL),
(3, 'Dense Veldspar', 17471, 0.1, 16.895714285714, 1689.57, 1, '24_64_1', 'secondary', 1, 1, 0, NULL),
(4, 'Scordite', 1228, 0.15, 19.252857142857, 1283.52, 1, '23_64_15', 'primary', NULL, 1, 0, NULL),
(5, 'Condensed Scordite', 17463, 0.15, 18.37, 1224.66, 1, '23_64_15', 'secondary', 4, 1, 0, NULL),
(6, 'Massive Scordite', 17464, 0.15, 18.475714285714, 1231.71, 1, '23_64_15', 'secondary', 4, 1, 0, NULL),
(7, 'Dark Ochre', 1232, 8, 874.56571428571, 1093.2, 0, '23_64_8', 'primary', NULL, 1, 0, NULL),
(8, 'Onyx Ochre', 17436, 8, 789.34142857143, 986.67, 0, '23_64_8', 'secondary', 7, 1, 0, NULL),
(9, 'Obsidian Ochre', 17437, 8, 955.93571428571, 1194.91, 0, '23_64_8', 'secondary', 7, 1, 0, NULL),
(10, 'Kernite', 20, 1.2, 271.49714285714, 2262.47, 0.7, '23_64_12', 'primary', NULL, 1, 0, NULL),
(11, 'Luminous Kernite', 17452, 1.2, 191.40571428571, 1595.04, 0.07, '23_64_12', 'secondary', 10, 1, 0, NULL),
(12, 'Fiery Kernite', 17453, 1.2, 203.41, 1695.08, 0.7, '23_64_12', 'secondary', 10, 1, 0, NULL),
(13, 'Omber', 1227, 0.6, 96.901428571429, 1615.02, 0.7, '23_64_13', 'primary', NULL, 1, 0, NULL),
(14, 'Silvery Omber', 17867, 0.6, 69.397142857143, 1156.61, 0.7, '23_64_13', 'secondary', 13, 1, 0, NULL),
(15, 'Golden Omber', 17868, 0.6, 75.947142857143, 1265.78, 0.7, '23_64_13', 'secondary', 13, 1, 0, NULL),
(16, 'Hedbergite', 21, 3, 327.06, 1090.2, 0.2, '23_64_9', 'primary', NULL, 1, 0, NULL),
(17, 'Vitric Hedbergite', 17440, 3, 428.92428571429, 1429.74, 0.2, '23_64_9', 'secondary', 16, 1, 0, NULL),
(18, 'Glazed Hedbergite', 17441, 3, 395.63714285714, 1318.79, 0.2, '23_64_9', 'secondary', 16, 1, 0, NULL),
(19, 'Pyroxeres', 1224, 0.3, 51.267142857143, 1708.9, 0.9, '23_64_16', 'primary', NULL, 1, 0, NULL),
(20, 'Solid Pyroxeres', 17459, 0.3, 52.868571428571, 1762.28, 0.9, '23_64_16', 'secondary', 19, 1, 0, NULL),
(21, 'Viscous Pyroxeres', 17460, 0.3, 50.594285714286, 1686.47, 0.9, '23_64_16', 'secondary', 19, 1, 0, NULL),
(22, 'Hemorphite', 1231, 3, 687.23, 2290.76, 0.2, '23_64_10', 'primary', NULL, 1, 0, NULL),
(23, 'Vivid Hemorphite', 17444, 3, 300.31285714286, 1001.04, 0.2, '23_64_10', 'secondary', 22, 1, 0, NULL),
(24, 'Radiant Hemorphite', 17445, 3, 433.61, 1445.36, 0.2, '23_64_10', 'secondary', 22, 1, 0, NULL),
(25, 'Plagioclase', 18, 0.35, 65.854285714286, 1881.55, 0.9, '24_64_2', 'primary', NULL, 1, 0, NULL),
(26, 'Azure Plagioclase', 17455, 0.35, 63.415714285714, 1811.87, 0.9, '24_64_2', 'secondary', 25, 1, 0, NULL),
(27, 'Rich Plagioclase', 17456, 0.35, 68.825714285714, 1966.44, 0.9, '24_64_2', 'secondary', 25, 1, 0, NULL),
(28, 'Jaspet', 1226, 2, 484.46571428571, 2422.32, 0.4, '23_64_11', 'primary', NULL, 1, 0, NULL),
(29, 'Pure Jaspet', 17448, 2, 333.51571428571, 1667.57, 0.4, '23_64_11', 'secondary', 28, 1, 0, NULL),
(30, 'Pristine Jaspet', 17449, 2, 364.57142857143, 1822.85, 0.4, '23_64_11', 'secondary', 28, 1, 0, NULL),
(31, 'Crokite', 1225, 16, 3114.3371428571, 1946.46, 0, '23_64_7', 'primary', NULL, 1, 0, NULL),
(32, 'Sharp Crokite', 17432, 16, 2483.1914285714, 1551.99, 0, '23_64_7', 'secondary', 31, 1, 0, NULL),
(33, 'Crystalline Crokite', 17433, 16, 2700.6071428571, 1687.87, 0, '23_64_7', 'secondary', 31, 1, 0, NULL),
(34, 'Spodumain', 19, 16, 3697.8757142857, 2311.17, 0, '23_64_14', 'primary', NULL, 1, 0, NULL),
(35, 'Bright Spodumain', 17466, 16, 3050.48, 1906.55, 0, '23_64_14', 'secondary', 34, 1, 0, NULL),
(36, 'Gleaming Spodumain', 17467, 16, 3108.45, 1942.78, 0, '23_64_14', 'secondary', 34, 1, 0, NULL),
(37, 'Gneiss', 1229, 5, 1580.3914285714, 3160.78, 0, '25_64_1', 'primary', NULL, 1, 0, NULL),
(38, 'Iridescent Gneiss', 17865, 5, 945.60714285714, 1891.21, 0, '25_64_1', 'secondary', 37, 1, 0, NULL),
(39, 'Prismatic Gneiss', 17866, 5, 1505.94, 3011.88, 0, '25_64_1', 'secondary', 37, 1, 0, NULL),
(40, 'Bistot', 1223, 16, 4772.5842857143, 2982.86, 0, '23_64_6', 'primary', NULL, 1, 0, NULL),
(41, 'Triclinic Bistot', 17428, 16, 3827.65, 2392.28, 0, '23_64_6', 'secondary', 40, 1, 0, NULL),
(42, 'Monoclinic Bistot', 17429, 16, 3245.2114285714, 2028.25, 0, '23_64_6', 'secondary', 40, 1, 0, NULL),
(43, 'Arkonor', 22, 16, 4004.2328571429, 2502.64, 0, '23_64_5', 'primary', NULL, 1, 0, NULL),
(44, 'Crimson Arkonor', 17425, 16, 4857.3271428571, 3035.82, 0, '23_64_5', 'secondary', 43, 1, 0, NULL),
(45, 'Prime Arkonor', 17426, 16, 5571.7928571429, 3482.37, 0, '23_64_5', 'secondary', 43, 1, 0, NULL),
(46, 'Mercoxit', 11396, 40, 19433.898571429, 4858.47, 0, '35_64_11', 'primary', NULL, 1, 1, NULL),
(47, 'Magma Mercoxit', 17869, 40, 16622.198571429, 4155.54, 0, '35_64_11', 'secondary', 46, 1, 1, NULL),
(48, 'Vitreous Mercoxit', 17870, 40, 20436.338571429, 5109.08, 0, '35_64_11', 'secondary', 46, 1, 1, NULL),
(49, 'Glacial Mass', 16263, 1000, 221212.01571429, 2212.12, 1, '51_64_4', 'primary', NULL, 3, 0, NULL),
(50, 'Smooth Glacial Mass', 17977, 1000, 298571.53857143, 2985.71, 1, '51_64_4', 'secondary', 49, 3, 0, NULL),
(51, 'Clear Icicle', 16262, 1000, 234836.39571429, 2348.36, 1, '51_64_2', 'primary', NULL, 3, 0, NULL),
(52, 'Enriched Clear Icicle', 17978, 1000, 169701.33714286, 1697.01, 1, '51_64_2', 'secondary', 51, 3, 0, NULL),
(53, 'Blue Ice', 16264, 1000, 300671.08142857, 3006.71, 1, '51_64_5', 'primary', NULL, 3, 0, NULL),
(54, 'Thick Blue Ice', 17975, 1000, 100011.9, 1000.11, 1, '51_64_5', 'secondary', 53, 3, 0, NULL),
(55, 'White Glaze', 16265, 1000, 214573.18714286, 2145.73, 1, '51_64_8', 'primary', NULL, 3, 0, NULL),
(56, 'Pristine White Glaze', 17976, 1000, 23513.094285714, 235.13, 1, '51_64_8', 'secondary', 55, 3, 0, NULL),
(57, 'Glare Crust', 16266, 1000, 529591.88714286, 5295.91, 0.4, '51_64_1', 'primary', NULL, 3, 0, NULL),
(58, 'Dark Glitter', 16267, 1000, 278415.58428571, 2784.15, 0.1, '51_64_3', 'primary', NULL, 3, 0, NULL),
(59, 'Gelidus', 16268, 1000, 582287.17428571, 5822.87, 0, '51_64_6', 'primary', NULL, 3, 0, NULL),
(60, 'Krystallos', 16269, 1000, 447998.58857143, 4479.98, 0, '51_64_9', 'primary', NULL, 3, 0, NULL),
(61, 'Fullerite-C50', 30370, 1, 6221.1, 62210.99, 0, '62_64_9', 'primary', NULL, 4, 0, NULL),
(62, 'Fullerite-C60', 30371, 1, 1834.3957142857, 18343.95, 0, '62_64_9', 'primary', NULL, 4, 0, NULL),
(64, 'Fullerite-C70', 30372, 1, 3136.9842857143, 31369.84, 0, '62_64_11', 'primary', NULL, 4, 0, NULL),
(65, 'Fullerite-C72', 30373, 2, 17042.59, 85212.95, 0, '62_64_14', 'primary', NULL, 4, 0, NULL),
(66, 'Fullerite-C84', 30374, 2, 7228.8885714286, 36144.44, 0, '62_64_13', 'primary', NULL, 4, 0, NULL),
(67, 'Fullerite-C28', 30375, 2, 12899.688571429, 64498.44, 0, '62_64_13', 'primary', NULL, 4, 0, NULL),
(68, 'Fullerite-C32', 30376, 5, 21393.171428571, 42786.34, 0, '62_64_16', 'primary', NULL, 4, 0, NULL),
(69, 'Fullerite-C320', 30377, 5, 59712.42, 119424.83, 0, '62_64_15', 'primary', NULL, 4, 0, NULL),
(70, 'Fullerite-C540', 30378, 10, 61241.797142857, 61241.79, 0, '62_64_15', 'primary', NULL, 4, 0, NULL),
(71, 'Bitumens', 45492, 10, 2127.7714285714, 2127.77, 1, '45492_64', 'primary', NULL, 2, 0, 'Ubiquitous Moon Ores'),
(72, 'Brimful Bitumens', 46284, 10, 2579.6728571429, 2579.67, 1, '46284_64', 'secondary', 71, 2, 0, 'Ubiquitous Moon Ores'),
(73, 'Glistening Bitumens', 46284, 10, 2579.6728571429, 2579.67, 1, '46284_64', 'secondary', 71, 2, 0, 'Ubiquitous Moon Ores'),
(74, 'Coesite', 45493, 10, 6714.2885714286, 6714.28, 1, '45493_64', 'primary', NULL, 2, 0, 'Ubiquitous Moon Ores'),
(75, 'Brimful Coesite', 46286, 10, 5900, 5900, 1, '46286_64', 'secondary', 74, 2, 0, 'Ubiquitous Moon Ores'),
(76, 'Glistening Coesite', 46287, 10, 0, 0, 1, '46287_64', 'secondary', 74, 2, 0, 'Ubiquitous Moon Ores'),
(77, 'Sylvite', 45491, 10, 3110.4771428571, 3110.47, 1, '45491_64', 'primary', NULL, 2, 0, 'Ubiquitous Moon Ores'),
(78, 'Brimful Sylite', 46282, 10, 1650.0114285714, 1650.01, 1, '46282_64', 'secondary', 77, 2, 0, 'Ubiquitous Moon Ores'),
(79, 'Glistening Sylvite', 46283, 10, 7857.1714285714, 7857.17, 1, '46283_64', 'secondary', 77, 2, 0, 'Ubiquitous Moon Ores'),
(80, 'Zeolites', 45490, 10, 7463.2428571429, 7463.24, 1, '45490_64', 'primary', NULL, 2, 0, 'Ubiquitous Moon Ores'),
(81, 'Brimful Zeolites', 46280, 10, 1150.0357142857, 1150.03, 1, '46280_64', 'secondary', 80, 2, 0, 'Ubiquitous Moon Ores'),
(82, 'Glistening Zeolites', 46281, 10, 0, 0, 1, '46281_64', 'secondary', 80, 2, 0, 'Ubiquitous Moon Ores'),
(83, 'Cobaltite', 45494, 10, 13470.722857143, 13470.72, 0.9, '45494_64', 'primary', NULL, 2, 0, 'Common Moon Ores'),
(84, 'Copious Cobaltite', 46288, 10, 2286.2985714286, 2286.29, 0.9, '46288_64', 'secondary', 83, 2, 0, 'Common Moon Ores'),
(85, 'Twinkling Cobaltite', 46289, 10, 3928.5714285714, 3928.57, 0.9, '46289_64', 'secondary', 83, 2, 0, 'Common Moon Ores'),
(86, 'Euxenite', 45495, 10, 2943.1685714286, 2943.16, 0.9, '45495_64', 'primary', NULL, 2, 0, 'Common Moon Ores'),
(87, 'Copious Euxenite', 46290, 10, 0, 0, 0.9, '46290_64', 'secondary', 86, 2, 0, 'Common Moon Ores'),
(88, 'Twinkling Euxenite', 46291, 10, 11099.425714286, 11099.42, 0.9, '46291_64', 'secondary', 86, 2, 0, 'Common Moon Ores'),
(89, 'Scheelite', 45497, 10, 3657.1785714286, 3657.17, 0.9, '45497_64', 'primary', NULL, 2, 0, 'Common Moon Ores'),
(90, 'Copious Scheelite', 46294, 10, 8284.5728571429, 8284.57, 0.9, '46294_64', 'secondary', 89, 2, 0, 'Common Moon Ores'),
(91, 'Twinkling Scheelite', 46295, 10, 3542.8571428571, 3542.85, 0.9, '46295_64', 'secondary', 89, 2, 0, 'Common Moon Ores'),
(92, 'Titanite', 45496, 10, 8501.7742857143, 8501.77, 0.9, '45496_64', 'primary', NULL, 2, 0, 'Common Moon Ores'),
(93, 'Copious Titanite', 46292, 10, 2008.5728571429, 2008.57, 0.9, '46292_64', 'secondary', 92, 2, 0, 'Common Moon Ores'),
(94, 'Twinkling Titanie', 46293, 10, 12190.431428571, 12190.43, 0.9, '46293_64', 'secondary', 92, 2, 0, 'Common Moon Ores'),
(95, 'Chromite', 45501, 10, 3686.4357142857, 3686.43, 1, '45501_64', 'primary', NULL, 2, 0, 'Uncommon Moon Ores'),
(96, 'Lavish Chromite', 46302, 10, 2501.0128571429, 2501.01, 1, '46302_64', 'secondary', 95, 2, 0, 'Uncommon Moon Ores'),
(97, 'Shimmering Chromite', 46303, 10, 10085.01, 10085.01, 1, '46303_64', 'secondary', 95, 2, 0, 'Uncommon Moon Ores'),
(98, 'Otavite', 45498, 10, 5357.8842857143, 5357.88, 1, '45501_64', 'primary', NULL, 2, 0, 'Uncommon Moon Ores'),
(99, 'Lavish Otavite', 46296, 10, 3901.03, 3901.03, 1, '46296_64', 'secondary', 98, 2, 0, 'Uncommon Moon Ores'),
(100, 'Shimmering Otavaite', 46297, 10, 23855.432857143, 23855.43, 1, '46297_64', 'secondary', 98, 2, 0, 'Uncommon Moon Ores'),
(101, 'Sperrylite', 45499, 10, 2329.4342857143, 2329.43, 1, '45499_64', 'primary', NULL, 2, 0, 'Uncommon Moon Ores'),
(102, 'Lavish Sperrylite', 46298, 10, 2500.7485714286, 2500.74, 1, '46298_64', 'secondary', 101, 2, 0, 'Uncommon Moon Ores'),
(103, 'Shimmering Sperrylite', 46299, 10, 5814.5785714286, 5814.57, 1, '46299_64', 'secondary', 101, 2, 0, 'Uncommon Moon Ores'),
(104, 'Vanadinite', 45500, 10, 11783.925714286, 11783.92, 1, '45500_64', 'primary', NULL, 2, 0, 'Uncommon Moon Ores'),
(105, 'Lavish Vanadinite', 46300, 10, 4956.7471428571, 4956.74, 1, '46300_64', 'secondary', 104, 2, 0, 'Uncommon Moon Ores'),
(106, 'Shimmering Vanadinite', 46301, 10, 0, 0, 1, '46301_64', 'secondary', 104, 2, 0, 'Uncommon Moon Ores'),
(107, 'Replete Carnotite', 46304, 10, 13621.285714286, 13621.28, 0.7, '46304_64', 'secondary', 118, 2, 0, 'Rare Moon Ores'),
(108, 'Glowing Carnotite', 46305, 10, 0, 0, 0.7, '46305_64', 'secondary', 118, 2, 0, 'Rare Moon Ores'),
(109, 'Cinnabar', 45506, 10, 5885.7171428571, 5885.71, 0.7, '45506_64', 'primary', NULL, 2, 0, 'Rare Moon Ores'),
(110, 'Replete Cinnabar', 46310, 10, 7628.2814285714, 7628.28, 0.7, '46310_64', 'secondary', 109, 2, 0, 'Rare Moon Ores'),
(111, 'Glowing Cinnabar', 46311, 10, 0, 0, 0.7, '46311_64', 'secondary', 109, 2, 0, 'Rare Moon Ores'),
(112, 'Pollucite', 45504, 10, 6526.27, 6526.27, 0.7, '45504_64', 'primary', NULL, 2, 0, 'Rare Moon Ores'),
(113, 'Replete Pollucite', 46308, 10, 4914.3157142857, 4914.31, 0.7, '46308_64', 'secondary', 112, 2, 0, 'Rare Moon Ores'),
(114, 'Glowing Pollucite', 46309, 10, 19171.381428571, 19171.38, 0.7, '46309_64', 'secondary', 112, 2, 0, 'Rare Moon Ores'),
(115, 'Zircon', 45503, 10, 5200.0242857143, 5200.02, 0.7, '45503_64', 'primary', NULL, 2, 0, 'Rare Moon Ores'),
(116, 'Replete Zircon', 46306, 10, 7935.74, 7935.74, 0.7, '46306_64', 'secondary', 115, 2, 0, 'Rare Moon Ores'),
(117, 'Glowing Zircon', 46307, 10, 0, 0, 0.7, '46307_64', 'secondary', 115, 2, 0, 'Rare Moon Ores'),
(118, 'Carnotite', 45502, 10, 16093.001428571, 16093, 0.7, '45502_64', 'primary', NULL, 2, 0, 'Rare Moon Ores'),
(119, 'Loparite', 45512, 10, 13371.435714286, 13371.43, 0.6, '45512_64', 'primary', NULL, 2, 0, 'Exceptional Moon Ores'),
(120, 'Bountiful Loparite', 46316, 10, 19285.757142857, 19285.75, 0.6, '46316_64', 'secondary', 119, 2, 0, 'Exceptional Moon Ores'),
(121, 'Shining Loparite', 46317, 10, 14957.141428571, 14957.14, 0.6, '46317_64', 'secondary', 119, 2, 0, 'Exceptional Moon Ores'),
(122, 'Monazite', 45511, 10, 12333.372857143, 12333.37, 0.6, '45511_64', 'primary', NULL, 2, 0, 'Exceptional Moon Ores'),
(123, 'Bountiful Monazite', 46314, 10, 42285.712857143, 42285.71, 0.6, '46314_64', 'secondary', 122, 2, 0, 'Exceptional Moon Ores'),
(124, 'Shining Monazite', 46315, 10, 15000.018571429, 15000.01, 0.6, '46315_64', 'secondary', 122, 2, 0, 'Exceptional Moon Ores'),
(125, 'Xenotime', 45510, 10, 12971.431428571, 12971.43, 0.6, '45510_64', 'primary', NULL, 2, 0, 'Exceptional Moon Ores'),
(126, 'Bountiful Xenotime', 46312, 10, 18249.857142857, 18249.85, 0.6, '46312_64', 'secondary', 125, 2, 0, 'Exceptional Moon Ores'),
(127, 'Shining Xenotime', 46313, 10, 0, 0, 0.6, '46313_64', 'secondary', 125, 2, 0, 'Exceptional Moon Ores'),
(128, 'Ytterbite', 45513, 10, 10100.147142857, 10100.14, 0.6, '45513_64', 'primary', NULL, 2, 0, 'Exceptional Moon Ores'),
(129, 'Bountiful Ytterbite', 46318, 10, 10731.408571429, 10731.4, 0.6, '46318_64', 'secondary', 128, 2, 0, 'Exceptional Moon Ores'),
(130, 'Shining Ytterbite', 46319, 10, 10000.008571429, 10000, 0.6, '46319_64', 'secondary', 128, 2, 0, 'Exceptional Moon Ores');

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
