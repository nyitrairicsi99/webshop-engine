-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Jan 04. 16:38
-- Kiszolgáló verziója: 10.4.20-MariaDB
-- PHP verzió: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `webshop`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `2fa_codes`
--

DROP TABLE IF EXISTS `2fa_codes`;
CREATE TABLE `2fa_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `expiry` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `cities_id` int(11) DEFAULT NULL,
  `streets_id` int(11) DEFAULT NULL,
  `house_numbers_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `addresses`
--

INSERT INTO `addresses` (`id`, `cities_id`, `streets_id`, `house_numbers_id`) VALUES
(1, 1, 1, 1),
(2, 4, 2, 2),
(3, 5, 2, 2),
(4, 6, 3, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bans`
--

DROP TABLE IF EXISTS `bans`;
CREATE TABLE `bans` (
  `id` int(11) NOT NULL,
  `users_id` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parentcategory` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short` varchar(255) DEFAULT NULL,
  `display_navbar` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `categories`
--

INSERT INTO `categories` (`id`, `parentcategory`, `name`, `short`, `display_navbar`) VALUES
(1, NULL, 'Shoes', 'shoes', 1),
(2, 1, 'Boots', 'boots', 1),
(3, 1, 'Sandals', 'sandals', 1),
(4, NULL, 'Books', 'books', 1),
(5, 4, 'Fantasy', 'fantasy', 1),
(6, 4, 'Horror', 'horror', 1),
(7, NULL, 'Games', 'games', 1),
(8, 4, 'Action', 'action', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `postcodes_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `cities`
--

INSERT INTO `cities` (`id`, `name`, `postcodes_id`) VALUES
(1, 'Pécs', 1),
(4, 'Edenderry', 4),
(5, 'Edenderry', 5),
(6, 'Gádoros', 6);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `longname` varchar(255) DEFAULT NULL,
  `sign` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `house_numbers`
--

DROP TABLE IF EXISTS `house_numbers`;
CREATE TABLE `house_numbers` (
  `id` int(11) NOT NULL,
  `number` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `house_numbers`
--

INSERT INTO `house_numbers` (`id`, `number`) VALUES
(1, '10'),
(2, '44'),
(3, '3/A');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `installed_plugins`
--

DROP TABLE IF EXISTS `installed_plugins`;
CREATE TABLE `installed_plugins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `longname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `order_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `order_states`
--

DROP TABLE IF EXISTS `order_states`;
CREATE TABLE `order_states` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `people`
--

DROP TABLE IF EXISTS `people`;
CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(16) DEFAULT NULL,
  `addresses_id` int(11) DEFAULT NULL,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `people`
--

INSERT INTO `people` (`id`, `phone_number`, `addresses_id`, `first_name`, `last_name`) VALUES
(1, '+36308961902', 1, 'Richard', 'Nyitrai'),
(2, '0894972172', 3, 'Istvan', 'Magashegyi'),
(3, '+36721234567', 4, 'Zoltán', 'Vámosi');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `description`) VALUES
(1, 'admin_access', 'Enable to access the admin page.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `phrases`
--

DROP TABLE IF EXISTS `phrases`;
CREATE TABLE `phrases` (
  `id` int(11) NOT NULL,
  `languages_id` int(11) DEFAULT NULL,
  `phrase` varchar(255) DEFAULT NULL,
  `translated` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `postcodes`
--

DROP TABLE IF EXISTS `postcodes`;
CREATE TABLE `postcodes` (
  `id` int(11) NOT NULL,
  `postcode` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `postcodes`
--

INSERT INTO `postcodes` (`id`, `postcode`) VALUES
(1, '7632'),
(4, '0'),
(5, 'R45W328'),
(6, '5932');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `currencies_id` int(11) DEFAULT NULL,
  `units_id` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `active_from` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `active_to` timestamp NULL DEFAULT current_timestamp(),
  `display_notactive` tinyint(1) DEFAULT NULL,
  `categories_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `products_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `product_order`
--

DROP TABLE IF EXISTS `product_order`;
CREATE TABLE `product_order` (
  `id` int(11) NOT NULL,
  `products_id` int(11) DEFAULT NULL,
  `orders_id` int(11) DEFAULT NULL,
  `discounts_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ranks`
--

DROP TABLE IF EXISTS `ranks`;
CREATE TABLE `ranks` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `ranks`
--

INSERT INTO `ranks` (`id`, `name`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rank_permission`
--

DROP TABLE IF EXISTS `rank_permission`;
CREATE TABLE `rank_permission` (
  `id` int(11) NOT NULL,
  `ranks_id` int(11) DEFAULT NULL,
  `permissions_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `rank_permission`
--

INSERT INTO `rank_permission` (`id`, `ranks_id`, `permissions_id`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `themes_id` int(11) DEFAULT NULL,
  `languages_id` int(11) DEFAULT NULL,
  `license_hash` varchar(255) DEFAULT NULL,
  `webshop_name` varchar(255) DEFAULT NULL,
  `root_directory` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `settings`
--

INSERT INTO `settings` (`themes_id`, `languages_id`, `license_hash`, `webshop_name`, `root_directory`) VALUES
(2, NULL, NULL, 'Szakdolgozat webshop', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `streets`
--

DROP TABLE IF EXISTS `streets`;
CREATE TABLE `streets` (
  `id` int(11) NOT NULL,
  `street` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `streets`
--

INSERT INTO `streets` (`id`, `street`) VALUES
(1, 'Gadó u.'),
(2, 'st Patriks Wood'),
(3, 'Bajcsy-Zsilinszky utca');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `themes`
--

DROP TABLE IF EXISTS `themes`;
CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `folder` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `themes`
--

INSERT INTO `themes` (`id`, `name`, `folder`, `version`) VALUES
(1, 'Default', 'default', '1.0'),
(2, 'Default2.0', 'default', '2.0');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `units`
--

DROP TABLE IF EXISTS `units`;
CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `used_coupons`
--

DROP TABLE IF EXISTS `used_coupons`;
CREATE TABLE `used_coupons` (
  `id` int(11) NOT NULL,
  `coupons_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `people_id` int(11) DEFAULT NULL,
  `ranks_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `people_id`, `ranks_id`) VALUES
(15, 'William', '$2y$10$7828jPg2RgqPfP0.4r7D0OLF3FQ0ANHiy26lk9wVZcJ//PwAseMZe', 'nyitrairicsi99@gmail.com', 1, 1),
(16, 'admin', '$2y$10$SMYAAdK13CdymG1AKcVDhemXJoKiY9CBVdQrDM8J2oTBNm0GVBbtu', 'admin@webshop.hu', 2, 2),
(17, 'user123', '$2y$10$m0r5URVj.osEQ4cEenjLcOn68S/Sg1Yxtw.QrUseGODuxLcB152Wi', 'valami@valami.hu', 3, 2);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `2fa_codes`
--
ALTER TABLE `2fa_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`);

--
-- A tábla indexei `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `house_numbers_id` (`house_numbers_id`),
  ADD KEY `streets_id` (`streets_id`),
  ADD KEY `cities_id` (`cities_id`);

--
-- A tábla indexei `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`);

--
-- A tábla indexei `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parentcategory` (`parentcategory`);

--
-- A tábla indexei `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postcodes_id` (`postcodes_id`);

--
-- A tábla indexei `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `house_numbers`
--
ALTER TABLE `house_numbers`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `installed_plugins`
--
ALTER TABLE `installed_plugins`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state_id` (`state_id`),
  ADD KEY `users_id` (`users_id`);

--
-- A tábla indexei `order_states`
--
ALTER TABLE `order_states`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_id` (`addresses_id`);

--
-- A tábla indexei `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `phrases`
--
ALTER TABLE `phrases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `languages_id` (`languages_id`);

--
-- A tábla indexei `postcodes`
--
ALTER TABLE `postcodes`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_id` (`units_id`),
  ADD KEY `currencies_id` (`currencies_id`),
  ADD KEY `categories_id` (`categories_id`);

--
-- A tábla indexei `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id` (`products_id`);

--
-- A tábla indexei `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_id` (`discounts_id`),
  ADD KEY `products_id` (`products_id`),
  ADD KEY `orders_id` (`orders_id`);

--
-- A tábla indexei `ranks`
--
ALTER TABLE `ranks`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `rank_permission`
--
ALTER TABLE `rank_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_id` (`permissions_id`),
  ADD KEY `ranks_id` (`ranks_id`);

--
-- A tábla indexei `streets`
--
ALTER TABLE `streets`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `used_coupons`
--
ALTER TABLE `used_coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupons_id` (`coupons_id`),
  ADD KEY `users_id` (`users_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `people_id` (`people_id`),
  ADD KEY `ranks_id` (`ranks_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `rank_permission`
--
ALTER TABLE `rank_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

COMMIT;

ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parentcategory`) REFERENCES `categories` (`id`);

ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`house_numbers_id`) REFERENCES `house_numbers` (`id`),
  ADD CONSTRAINT `addresses_ibfk_2` FOREIGN KEY (`streets_id`) REFERENCES `streets` (`id`),
  ADD CONSTRAINT `addresses_ibfk_3` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `addresses_ibfk_4` FOREIGN KEY (`house_numbers_id`) REFERENCES `house_numbers` (`id`),
  ADD CONSTRAINT `addresses_ibfk_5` FOREIGN KEY (`streets_id`) REFERENCES `streets` (`id`),
  ADD CONSTRAINT `addresses_ibfk_6` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `addresses_ibfk_7` FOREIGN KEY (`house_numbers_id`) REFERENCES `house_numbers` (`id`),
  ADD CONSTRAINT `addresses_ibfk_8` FOREIGN KEY (`streets_id`) REFERENCES `streets` (`id`),
  ADD CONSTRAINT `addresses_ibfk_9` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`);

--
-- Megkötések a táblához `bans`
--
ALTER TABLE `bans`
  ADD CONSTRAINT `bans_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bans_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bans_ibfk_3` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Megkötések a táblához `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`postcodes_id`) REFERENCES `postcodes` (`id`),
  ADD CONSTRAINT `cities_ibfk_2` FOREIGN KEY (`postcodes_id`) REFERENCES `postcodes` (`id`),
  ADD CONSTRAINT `cities_ibfk_3` FOREIGN KEY (`postcodes_id`) REFERENCES `postcodes` (`id`);

--
-- Megkötések a táblához `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `order_states` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`state_id`) REFERENCES `order_states` (`id`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`state_id`) REFERENCES `order_states` (`id`),
  ADD CONSTRAINT `orders_ibfk_6` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Megkötések a táblához `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `people_ibfk_1` FOREIGN KEY (`addresses_id`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `people_ibfk_2` FOREIGN KEY (`addresses_id`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `people_ibfk_3` FOREIGN KEY (`addresses_id`) REFERENCES `addresses` (`id`);

--
-- Megkötések a táblához `phrases`
--
ALTER TABLE `phrases`
  ADD CONSTRAINT `phrases_ibfk_1` FOREIGN KEY (`languages_id`) REFERENCES `languages` (`id`),
  ADD CONSTRAINT `phrases_ibfk_2` FOREIGN KEY (`languages_id`) REFERENCES `languages` (`id`),
  ADD CONSTRAINT `phrases_ibfk_3` FOREIGN KEY (`languages_id`) REFERENCES `languages` (`id`);

--
-- Megkötések a táblához `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`units_id`) REFERENCES `units` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`currencies_id`) REFERENCES `currencies` (`id`);

--
-- Megkötések a táblához `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_images_ibfk_2` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_images_ibfk_3` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`);

--
-- Megkötések a táblához `product_order`
--
ALTER TABLE `product_order`
  ADD CONSTRAINT `product_order_ibfk_1` FOREIGN KEY (`discounts_id`) REFERENCES `discounts` (`id`),
  ADD CONSTRAINT `product_order_ibfk_2` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_order_ibfk_3` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `product_order_ibfk_4` FOREIGN KEY (`discounts_id`) REFERENCES `discounts` (`id`),
  ADD CONSTRAINT `product_order_ibfk_5` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_order_ibfk_6` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `product_order_ibfk_7` FOREIGN KEY (`discounts_id`) REFERENCES `discounts` (`id`),
  ADD CONSTRAINT `product_order_ibfk_8` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_order_ibfk_9` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`);

--
-- Megkötések a táblához `rank_permission`
--
ALTER TABLE `rank_permission`
  ADD CONSTRAINT `rank_permission_ibfk_1` FOREIGN KEY (`permissions_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `rank_permission_ibfk_2` FOREIGN KEY (`ranks_id`) REFERENCES `ranks` (`id`),
  ADD CONSTRAINT `rank_permission_ibfk_3` FOREIGN KEY (`permissions_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `rank_permission_ibfk_4` FOREIGN KEY (`ranks_id`) REFERENCES `ranks` (`id`),
  ADD CONSTRAINT `rank_permission_ibfk_5` FOREIGN KEY (`permissions_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `rank_permission_ibfk_6` FOREIGN KEY (`ranks_id`) REFERENCES `ranks` (`id`);

--
-- Megkötések a táblához `used_coupons`
--
ALTER TABLE `used_coupons`
  ADD CONSTRAINT `used_coupons_ibfk_1` FOREIGN KEY (`coupons_id`) REFERENCES `coupons` (`id`),
  ADD CONSTRAINT `used_coupons_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `used_coupons_ibfk_3` FOREIGN KEY (`coupons_id`) REFERENCES `coupons` (`id`),
  ADD CONSTRAINT `used_coupons_ibfk_4` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `used_coupons_ibfk_5` FOREIGN KEY (`coupons_id`) REFERENCES `coupons` (`id`),
  ADD CONSTRAINT `used_coupons_ibfk_6` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Megkötések a táblához `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`ranks_id`) REFERENCES `ranks` (`id`),
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `users_ibfk_4` FOREIGN KEY (`ranks_id`) REFERENCES `ranks` (`id`),
  ADD CONSTRAINT `users_ibfk_5` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `users_ibfk_6` FOREIGN KEY (`ranks_id`) REFERENCES `ranks` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
