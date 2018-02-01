-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 01 Février 2018 à 13:34
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
('last_api_pull_date', '2018-01-10 10:06:17');

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
(9, 'Heavy Water', 16272, 1, 1, 3),
(10, 'Liquid Ozone', 16273, 1, 1, 3),
(11, 'Strontium', 16275, 1, 1, 3),
(12, 'Oxygen Isotopes', 17887, 1, 1, 3),
(13, 'Helium Isotopes', 16274, 1, 1, 3),
(14, 'Hydrogen Isotopes', 17889, 1, 1, 3),
(15, 'Nitrogen Isotopes', 17888, 1, 1, 3);

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
(1, 'Veldspar', 1230, 0.1, 14.731428571429, 1473.14, 1, '24_64_1', 'primary', NULL, 1, 0),
(2, 'Concentrated Veldspar', 17470, 0.1, 13.531428571429, 1353.14, 1, '24_64_1', 'secondary', 1, 1, 0),
(3, 'Dense Veldspar', 17471, 0.1, 15.884285714286, 1588.42, 1, '24_64_1', 'secondary', 1, 1, 0),
(4, 'Scordite', 1228, 0.15, 18.105714285714, 1207.04, 1, '23_64_15', 'primary', NULL, 1, 0),
(5, 'Condensed Scordite', 17463, 0.15, 17.034285714286, 1135.61, 1, '23_64_15', 'secondary', 4, 1, 0),
(6, 'Massive Scordite', 17464, 0.15, 17.055714285714, 1137.04, 1, '23_64_15', 'secondary', 4, 1, 0),
(7, 'Dark Ochre', 1232, 8, 874.49142857143, 1093.11, 0, '23_64_8', 'primary', NULL, 1, 0),
(8, 'Onyx Ochre', 17436, 8, 800.08, 1000.1, 0, '23_64_8', 'secondary', 7, 1, 0),
(9, 'Obsidian Ochre', 17437, 8, 825.61714285714, 1032.02, 0, '23_64_8', 'secondary', 7, 1, 0),
(10, 'Kernite', 20, 1.2, 230.33857142857, 1919.48, 0.7, '23_64_12', 'primary', NULL, 1, 0),
(11, 'Luminous Kernite', 17452, 1.2, 169.92428571429, 1416.03, 0.07, '23_64_12', 'secondary', 10, 1, 0),
(12, 'Fiery Kernite', 17453, 1.2, 180.01, 1500.08, 0.7, '23_64_12', 'secondary', 10, 1, 0),
(13, 'Omber', 1227, 0.6, 95.487142857143, 1591.45, 0.7, '23_64_13', 'primary', NULL, 1, 0),
(14, 'Silvery Omber', 17867, 0.6, 70.101428571429, 1168.35, 0.7, '23_64_13', 'secondary', 13, 1, 0),
(15, 'Golden Omber', 17868, 0.6, 75.931428571429, 1265.52, 0.7, '23_64_13', 'secondary', 13, 1, 0),
(16, 'Hedbergite', 21, 3, 400.99142857143, 1336.63, 0.2, '23_64_9', 'primary', NULL, 1, 0),
(17, 'Vitric Hedbergite', 17440, 3, 411.95857142857, 1373.19, 0.2, '23_64_9', 'secondary', 16, 1, 0),
(18, 'Glazed Hedbergite', 17441, 3, 395.5, 1318.33, 0.2, '23_64_9', 'secondary', 16, 1, 0),
(19, 'Pyroxeres', 1224, 0.3, 45.202857142857, 1506.76, 0.9, '23_64_16', 'primary', NULL, 1, 0),
(20, 'Solid Pyroxeres', 17459, 0.3, 46.604285714286, 1553.47, 0.9, '23_64_16', 'secondary', 19, 1, 0),
(21, 'Viscous Pyroxeres', 17460, 0.3, 48.955714285714, 1631.85, 0.9, '23_64_16', 'secondary', 19, 1, 0),
(22, 'Hemorphite', 1231, 3, 639.99857142857, 2133.32, 0.2, '23_64_10', 'primary', NULL, 1, 0),
(23, 'Vivid Hemorphite', 17444, 3, 408.31, 1361.03, 0.2, '23_64_10', 'secondary', 22, 1, 0),
(24, 'Radiant Hemorphite', 17445, 3, 537.43428571429, 1791.44, 0.2, '23_64_10', 'secondary', 22, 1, 0),
(25, 'Plagioclase', 18, 0.35, 57.844285714286, 1652.69, 0.9, '24_64_2', 'primary', NULL, 1, 0),
(26, 'Azure Plagioclase', 17455, 0.35, 60.697142857143, 1734.2, 0.9, '24_64_2', 'secondary', 25, 1, 0),
(27, 'Rich Plagioclase', 17456, 0.35, 65.995714285714, 1885.59, 0.9, '24_64_2', 'secondary', 25, 1, 0),
(28, 'Jaspet', 1226, 2, 376.46571428571, 1882.32, 0.4, '23_64_11', 'primary', NULL, 1, 0),
(29, 'Pure Jaspet', 17448, 2, 363.93285714286, 1819.66, 0.4, '23_64_11', 'secondary', 28, 1, 0),
(30, 'Pristine Jaspet', 17449, 2, 371.71, 1858.55, 0.4, '23_64_11', 'secondary', 28, 1, 0),
(31, 'Crokite', 1225, 16, 3676.8657142857, 2298.04, 0, '23_64_7', 'primary', NULL, 1, 0),
(32, 'Sharp Crokite', 17432, 16, 2483.16, 1551.97, 0, '23_64_7', 'secondary', 31, 1, 0),
(33, 'Crystalline Crokite', 17433, 16, 2700.56, 1687.85, 0, '23_64_7', 'secondary', 31, 1, 0),
(34, 'Spodumain', 19, 16, 3228.01, 2017.5, 0, '23_64_14', 'primary', NULL, 1, 0),
(35, 'Bright Spodumain', 17466, 16, 3050.48, 1906.55, 0, '23_64_14', 'secondary', 34, 1, 0),
(36, 'Gleaming Spodumain', 17467, 16, 3373.8442857143, 2108.65, 0, '23_64_14', 'secondary', 34, 1, 0),
(37, 'Gneiss', 1229, 5, 1520.5128571429, 3041.02, 0, '25_64_1', 'primary', NULL, 1, 0),
(38, 'Iridescent Gneiss', 17865, 5, 945.5, 1891, 0, '25_64_1', 'secondary', 37, 1, 0),
(39, 'Prismatic Gneiss', 17866, 5, 1505.21, 3010.42, 0, '25_64_1', 'secondary', 37, 1, 0),
(40, 'Bistot', 1223, 16, 4242.4257142857, 2651.51, 0, '23_64_6', 'primary', NULL, 1, 0),
(41, 'Triclinic Bistot', 17428, 16, 4332.6414285714, 2707.9, 0, '23_64_6', 'secondary', 40, 1, 0),
(42, 'Monoclinic Bistot', 17429, 16, 3210.13, 2006.33, 0, '23_64_6', 'secondary', 40, 1, 0),
(43, 'Arkonor', 22, 16, 4002.3085714286, 2501.44, 0, '23_64_5', 'primary', NULL, 1, 0),
(44, 'Crimson Arkonor', 17425, 16, 6630.9714285714, 4144.35, 0, '23_64_5', 'secondary', 43, 1, 0),
(45, 'Prime Arkonor', 17426, 16, 4543.1742857143, 2839.48, 0, '23_64_5', 'secondary', 43, 1, 0),
(46, 'Mercoxit', 11396, 40, 21458.16, 5364.54, 0, '35_64_11', 'primary', NULL, 1, 1),
(47, 'Magma Mercoxit', 17869, 40, 17330.558571429, 4332.63, 0, '35_64_11', 'secondary', 46, 1, 1),
(48, 'Vitreous Mercoxit', 17870, 40, 18029.151428571, 4507.28, 0, '35_64_11', 'secondary', 46, 1, 1),
(49, 'Glacial Mass', 16263, 1000, 197739.65714286, 1977.39, 1, '51_64_4', 'primary', NULL, 3, 0),
(50, 'Smooth Glacial Mass', 17977, 1000, 275714.37, 2757.14, 1, '51_64_4', 'secondary', 49, 3, 0),
(51, 'Clear Icicle', 16262, 1000, 234014.56285714, 2340.14, 1, '51_64_2', 'primary', NULL, 3, 0),
(52, 'Enriched Clear Icicle', 17978, 1000, 78987.204285714, 789.87, 1, '51_64_2', 'secondary', 51, 3, 0),
(53, 'Blue Ice', 16264, 1000, 269426.30285714, 2694.26, 1, '51_64_5', 'primary', NULL, 3, 0),
(54, 'Thick Blue Ice', 17975, 1000, 105112.73285714, 1051.12, 1, '51_64_5', 'secondary', 53, 3, 0),
(55, 'White Glaze', 16265, 1000, 217714.29428571, 2177.14, 1, '51_64_8', 'primary', NULL, 3, 0),
(56, 'Pristine White Glaze', 17976, 1000, 24564.731428571, 245.64, 1, '51_64_8', 'secondary', 55, 3, 0),
(57, 'Glare Crust', 16266, 1000, 474285.72285714, 4742.85, 0.4, '51_64_1', 'primary', NULL, 3, 0),
(58, 'Dark Glitter', 16267, 1000, 329570.99857143, 3295.7, 0.1, '51_64_3', 'primary', NULL, 3, 0),
(59, 'Gelidus', 16268, 1000, 529011.83, 5290.11, 0, '51_64_6', 'primary', NULL, 3, 0),
(60, 'Krystallos', 16269, 1000, 492609.71857143, 4926.09, 0, '51_64_9', 'primary', NULL, 3, 0),
(61, 'Fullerite-C50', 30370, 1, 5514.2985714286, 55142.98, 0, '62_64_9', 'primary', NULL, 4, 0),
(62, 'Fullerite-C60', 30371, 1, 2125.8871428571, 21258.87, 0, '62_64_9', 'primary', NULL, 4, 0),
(64, 'Fullerite-C70', 30372, 1, 3994.3714285714, 39943.71, 0, '62_64_11', 'primary', NULL, 4, 0),
(65, 'Fullerite-C72', 30373, 2, 13899.362857143, 69496.81, 0, '62_64_14', 'primary', NULL, 4, 0),
(66, 'Fullerite-C84', 30374, 2, 5700.31, 28501.54, 0, '62_64_13', 'primary', NULL, 4, 0),
(67, 'Fullerite-C28', 30375, 2, 10204.991428571, 51024.95, 0, '62_64_13', 'primary', NULL, 4, 0),
(68, 'Fullerite-C32', 30376, 5, 21088.14, 42176.28, 0, '62_64_16', 'primary', NULL, 4, 0),
(69, 'Fullerite-C320', 30377, 5, 51383.637142857, 102767.27, 0, '62_64_15', 'primary', NULL, 4, 0),
(70, 'Fullerite-C540', 30378, 10, 53056.974285714, 53056.97, 0, '62_64_15', 'primary', NULL, 4, 0),
(71, 'Bitumens', 45492, 10, 1, 1, 1, '45492_64', 'primary', NULL, 2, 0),
(72, 'Brimful Bitumens', 46284, 10, 1, 1, 1, '46284_64', 'secondary', 71, 2, 0),
(73, 'Glistening Bitumens', 46284, 10, 1, 1, 1, '46284_64', 'secondary', 71, 2, 0),
(74, 'Coesite', 45493, 10, 1, 1, 1, '45493_64', 'primary', NULL, 2, 0),
(75, 'Brimful Coesite', 46286, 10, 1, 1, 1, '46286_64', 'secondary', 74, 2, 0),
(76, 'Glistening Coesite', 46287, 10, 1, 1, 1, '46287_64', 'secondary', 74, 2, 0),
(77, 'Sylvite', 45491, 10, 1, 1, 1, '45491_64', 'primary', NULL, 2, 0),
(78, 'Brimful Sylite', 46282, 10, 1, 1, 1, '46282_64', 'secondary', 77, 2, 0),
(79, 'Glistening Sylvite', 46283, 10, 1, 1, 1, '46283_64', 'secondary', 77, 2, 0),
(80, 'Zeolites', 45490, 10, 1, 1, 1, '45490_64', 'primary', NULL, 2, 0),
(81, 'Brimful Zeolites', 46280, 10, 1, 1, 1, '46280_64', 'secondary', 80, 2, 0),
(82, 'Glistening Zeolites', 46281, 10, 1, 1, 1, '46281_64', 'secondary', 80, 2, 0),
(83, 'Cobaltite', 45494, 10, 1, 1, 0.9, '45494_64', 'primary', NULL, 2, 0),
(84, 'Copious Cobaltite', 46288, 10, 1, 1, 0.9, '46288_64', 'secondary', 83, 2, 0),
(85, 'Twinkling Cobaltite', 46289, 10, 1, 1, 0.9, '46289_64', 'secondary', 83, 2, 0),
(86, 'Euxenite', 45495, 10, 1, 1, 0.9, '45495_64', 'primary', NULL, 2, 0),
(87, 'Copious Euxenite', 46290, 10, 1, 1, 0.9, '46290_64', 'secondary', 86, 2, 0),
(88, 'Twinkling Euxenite', 46291, 10, 1, 1, 0.9, '46291_64', 'secondary', 86, 2, 0),
(89, 'Scheelite', 45497, 10, 1, 1, 0.9, '45497_64', 'primary', NULL, 2, 0),
(90, 'Copious Scheelite', 46294, 10, 1, 1, 0.9, '46294_64', 'secondary', 89, 2, 0),
(91, 'Twinkling Scheelite', 46295, 10, 1, 1, 0.9, '46295_64', 'secondary', 89, 2, 0),
(92, 'Titanite', 45496, 10, 1, 1, 0.9, '45496_64', 'primary', NULL, 2, 0),
(93, 'Copious Titanite', 46292, 10, 1, 1, 0.9, '46292_64', 'secondary', 92, 2, 0),
(94, 'Twinkling Titanie', 46293, 10, 1, 1, 0.9, '46293_64', 'secondary', 92, 2, 0),
(95, 'Chromite', 45501, 10, 1, 1, 1, '45501_64', 'primary', NULL, 2, 0),
(96, 'Lavish Chromite', 46302, 10, 1, 1, 1, '46302_64', 'secondary', 95, 2, 0),
(97, 'Shimmering Chromite', 46303, 10, 1, 1, 1, '46303_64', 'secondary', 95, 2, 0),
(98, 'Otavite', 45498, 10, 1, 1, 1, '45501_64', 'primary', NULL, 2, 0),
(99, 'Lavish Otavite', 46296, 10, 1, 1, 1, '46296_64', 'secondary', 98, 2, 0),
(100, 'Shimmering Otavaite', 46297, 10, 1, 1, 1, '46297_64', 'secondary', 98, 2, 0),
(101, 'Sperrylite', 45499, 10, 1, 1, 1, '45499_64', 'primary', NULL, 2, 0),
(102, 'Lavish Sperrylite', 46298, 10, 1, 1, 1, '46298_64', 'secondary', 101, 2, 0),
(103, 'Shimmering Sperrylite', 46299, 10, 1, 1, 1, '46299_64', 'secondary', 101, 2, 0),
(104, 'Vanadinite', 45500, 10, 1, 1, 1, '45500_64', 'primary', NULL, 2, 0),
(105, 'Lavish Vanadinite', 46300, 10, 1, 1, 1, '46300_64', 'secondary', 104, 2, 0),
(106, 'Shimmering Vanadinite', 46301, 10, 1, 1, 1, '46301_64', 'secondary', 104, 2, 0),
(107, 'Replete Carnotite', 46304, 10, 1, 1, 0.7, '46304_64', 'secondary', 118, 2, 0),
(108, 'Glowing Carnotite', 46305, 10, 1, 1, 0.7, '46305_64', 'secondary', 118, 2, 0),
(109, 'Cinnabar', 45506, 10, 1, 1, 0.7, '45506_64', 'primary', NULL, 2, 0),
(110, 'Replete Cinnabar', 46310, 10, 1, 1, 0.7, '46310_64', 'secondary', 109, 2, 0),
(111, 'Glowing Cinnabar', 46311, 10, 1, 1, 0.7, '46311_64', 'secondary', 109, 2, 0),
(112, 'Pollucite', 45504, 10, 1, 1, 0.7, '45504_64', 'primary', NULL, 2, 0),
(113, 'Replete Pollucite', 46308, 10, 1, 1, 0.7, '46308_64', 'secondary', 112, 2, 0),
(114, 'Glowing Pollucite', 46309, 10, 1, 1, 0.7, '46309_64', 'secondary', 112, 2, 0),
(115, 'Zircon', 45503, 10, 1, 1, 0.7, '45503_64', 'primary', NULL, 2, 0),
(116, 'Replete Zircon', 46306, 10, 1, 1, 0.7, '46306_64', 'secondary', 115, 2, 0),
(117, 'Glowing Zircon', 46307, 10, 1, 1, 0.7, '46307_64', 'secondary', 115, 2, 0),
(118, 'Carnotite', 45502, 10, 1, 1, 0.7, '45502_64', 'primary', NULL, 2, 0),
(119, 'Loparite', 45512, 10, 1, 1, 0.6, '45512_64', 'primary', NULL, 2, 0),
(120, 'Bountiful Loparite', 46316, 10, 1, 1, 0.6, '46316_64', 'secondary', 119, 2, 0),
(121, 'Shining Loparite', 46317, 10, 1, 1, 0.6, '46317_64', 'secondary', 119, 2, 0),
(122, 'Monazite', 45511, 10, 1, 1, 0.6, '45511_64', 'primary', NULL, 2, 0),
(123, 'Bountiful Monazite', 46314, 10, 1, 1, 0.6, '46314_64', 'secondary', 122, 2, 0),
(124, 'Shining Monazite', 46315, 10, 1, 1, 0.6, '46315_64', 'secondary', 122, 2, 0),
(125, 'Xenotime', 45510, 10, 1, 1, 0.6, '45510_64', 'primary', NULL, 2, 0),
(126, 'Bountiful Xenotime', 46312, 10, 1, 1, 0.6, '46312_64', 'secondary', 125, 2, 0),
(127, 'Shining Xenotime', 46313, 10, 1, 1, 0.6, '46313_64', 'secondary', 125, 2, 0),
(128, 'Ytterbite', 45513, 10, 1, 1, 0.6, '45513_64', 'primary', NULL, 2, 0),
(129, 'Bountiful Ytterbite', 46318, 10, 1, 1, 0.6, '46318_64', 'secondary', 128, 2, 0),
(130, 'Shining Ytterbite', 46319, 10, 1, 1, 0.6, '46319_64', 'secondary', 128, 2, 0);

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
