CREATE TABLE IF NOT EXISTS `hu_motels_coowners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `motelid` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `hu_motels_owned` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `owner` varchar(60) NOT NULL,
  `motelid` varchar(60) NOT NULL,
  `motelname` varchar(80) NOT NULL,
  `renting` int(2) NOT NULL DEFAULT 0,
  `renting_price` int(11) NOT NULL DEFAULT 0,
  `condo` int(2) NOT NULL DEFAULT 0,
  `pending_charge` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `hu_motels_pending` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `motelid` varchar(60) NOT NULL,
  `renting_price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


-- Dumping structure for table hakdogutilitiesv1.hu_motels_tenants
CREATE TABLE IF NOT EXISTS `hu_motels_tenants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `motelid` varchar(60) NOT NULL,
  `motelname` varchar(80) NOT NULL,
  `renting_price` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
