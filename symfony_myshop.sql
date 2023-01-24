-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 24 jan. 2023 à 11:35
-- Version du serveur :  10.3.29-MariaDB
-- Version de PHP : 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `symfony_myshop`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230124093311', '2023-01-24 10:33:13', 138);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reservation_text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `title`, `description`, `price`, `city`, `postal_code`, `reservation_text`, `image`, `created_at`) VALUES
(1, 'Apple Mac Mini', 'Désormais doté de la puce M2, le Mac mini vous offre toute la puissance dont vous avez besoin pour redoubler d\'efficacité. Ajoutez à cela une large gamme de ports, et vous obtenez un ordinateur de bureau prêt à s\'intégrer à n\'importe quel environ­nement.', 1500, 'Lille', '59800', 'Alain de Loin', '1674554060.jpg', '2023-01-24 10:54:20'),
(2, 'Nedis Récepteur HDMI sans fil', 'Conçu par Nedis voici un système de présentation Wi-Fi sans fil portable qui prend en charge la transmission sans fil de la sortie HDMI (jusqu\'à 4K). Il vous permet de basculer rapidement, sans fil et sans effort entre plusieurs appareils de diffusion.', 200, 'Lyon', '69000', '', '1674554208.jpg', '2023-01-24 10:56:48'),
(3, 'Corsair Vengeance RGB DDR5 64 Go', 'La mémoire Corsair Vengeance RGB DDR5 fournit des performances et des fréquences plus élevées avec de meilleures capacités optimisées pour les cartes mères Intel tout en illuminant votre PC avec un éclairage RGB dynamique sur dix zones personnalisables individuellement.', 350, 'Lyon', '69100', '', '1674554381.jpg', '2023-01-24 10:59:41'),
(4, 'Fox Spirit GT-850P V2 80PLUS Platinum', 'L\'alimentation Fox Spirit GT-850P V2 80PLUS Platinum est idéale pour la conception d\'une configuration de dernière génération. Fiabilité, haute efficacité énergétique et modularité totale sont ses principaux atouts. Connectique complète et dimensions standards permettent de l\'intégrer facilement.', 129, 'Marseille', '13000', '', '1674554437.jpg', '2023-01-24 11:00:37'),
(5, 'ASRock B550 Extreme4', 'La carte mère ASRock B550 Extreme4 est conçue pour accueillir les processeurs AMD Ryzen 3ème génération sur socket AM4. Elle permettra l\'assemblage d\'une configuration puissante et polyvalente capable de s\'acquitter de toutes les tâches.', 199, 'Paris', '75012', '', '1674554484.jpg', '2023-01-24 11:01:24'),
(6, 'Maclocks Universal HoverTab', 'Sécurisez n\'importe quelle tablette avec le support Maclocks HoverTab. Ce support de sécurité, avec verrou universel, est adapté pour toutes les tablettes comme iPad et Galaxy Tab. Avec son design élégant et son angle de vision à 60°, ce support offre confort et fiabilité.', 95, 'Marseille', '13000', '', '1674554569.jpg', '2023-01-24 11:02:49'),
(7, 'Advance GTA 210', 'La souris Advance RGB GTA 210 est une souris optique dédiée au gaming qui vous offre une excellente ergonomie, de la réactivité et une excellente précision grâce à son capteur optique 2400 dpi réglable. Son rétroéclairage RGB avec 5 modes prédéfinis vous fait profiter d\'un style moderne.', 15, 'Lille', '59800', '', '1674555240.jpg', '2023-01-24 11:14:00'),
(8, 'Logitech G Pro HERO', 'Profitez d\'une vitesse et une précision exceptionnelles avec la souris Logitech G Pro HERO. Spécialement conçue pour l\'eSport, elle intègre un capteur optique Hero de 25 000 dpi pour que chaque mouvement puisse faire mouche.', 25, 'Lyon', '13000', '', '1674555336.jpg', '2023-01-24 11:15:36'),
(9, 'Dacomex douchette CCD', 'Avec le lecteur codes-barres Dacomex douchette CCD, lisez vos codes-barres avec une facilité déconcertante.', 89, 'Lille', '59800', '', '1674555367.jpg', '2023-01-24 11:16:07'),
(10, 'LDLC RGB PAD', 'Le tapis de souris gaming LDLC RGB PAD offre aux gamers une glisse parfaite, la précision dont ils ont besoin et le style qui leur ressemble. Il dispose d\'une large surface lisse, d\'un revêtement spécial \"sans friction\", d\'une base antidérapante et d\'une bande LED RGB.', 35, 'Paris', '75012', '', '1674555399.jpg', '2023-01-24 11:16:39'),
(11, 'Logitech G G440 Hard Gaming Mouse Pad', 'Le tapis de souris Logitech G440 Hard Gaming Mouse Pad présente une surface en polymère rigide à faible friction, parfaitement adaptée au jeu haute résolution, améliorant le contrôle de la souris et permettant un placement précis du curseur.', 25, 'Marseille', '13000', '', '1674555428.jpg', '2023-01-24 11:17:08'),
(12, 'Pavé numérique USB 19 touches compatible Windows e', 'D\'un design sobre et robuste, ce pavé numérique sera indispensable pour les utilisateurs de portables qui souhaitent bénéficier d\'un confort de travail similaire à un clavier classique.', 15, 'Marseille', '13000', '', '1674555461.jpg', '2023-01-24 11:17:41'),
(13, 'Fitbit Sense 2 Bleu Brumeux/Aluminium Or Pâle', 'Le bracelet connecté Fitbit Sense 2 vous aide à être en harmonie avec votre corps via des outils pour la santé cardiaque, la gestion du stress, la température cutanée et plus encore. Simple à utiliser, il est étanche jusqu\'à 50 mètres et vous permet d\'enregistrer facilement votre humeur.', 250, 'Lyon', '69000', '', '1674555496.jpg', '2023-01-24 11:18:16'),
(14, 'DJI Avata Pro-View', 'Découvrez la liberté de ceux qui peuvent s\'envoler avec le DJI Avata Pro-View. En combinant le drone Avata avec casque et contrôleur de mouvement, voler devient accessible à tous. [1] Vivez le frisson de l\'immersion totale avec une sécurité et un contrôle inégalé.', 1500, 'Marseille', '13000', '', '1674555530.jpg', '2023-01-24 11:18:50'),
(15, 'DJI Mini 3 Pro', 'Avec le DJI Mini 3, vous possédez un drone alliant puissance et portabilité. En effet, il est équipé d\'une caméra embarquée de 4K qui vous garantit des images de qualité exceptionnelle. Profitez alors d\'une perspective unique pour mettre en avant les moments les plus importants de votre vie.', 850, 'Lille', '59800', '', '1674555561.jpg', '2023-01-24 11:19:21'),
(16, 'Withings Nokia Body+ Blanc', 'Suivez avec précision votre poids et votre composition corporelle grâce à la balance Nokia Body+. Ce modèle connecté en Wi-Fi ou Bluetooth synchronise les données de poids, masse grasse, musculaire, hydrique et osseuse directement sur une application dédiée.', 89, 'Paris', '75012', '', '1674555594.jpg', '2023-01-24 11:19:54'),
(17, 'Withings Tensiomètre Connecté avec ECG et Stéthosc', 'ensiomètre Connectée BPM Core Withings. Synchronisation via Bluetooth ou Wifi. Compatible Android et iOs. Détecte 3 maladies cardiovasculaires : hypertension', 250, 'Marseille', '13000', '', '1674555636.jpg', '2023-01-24 11:20:36');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
