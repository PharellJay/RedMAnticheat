CREATE TABLE IF NOT EXISTS `deadeye_anticheat` (
    `id` int(7) AUTO_INCREMENT PRIMARY KEY,
    `license` VARCHAR(255) NOT NULL,
    `steam` VARCHAR(255) NOT NULL,
    `discord` VARCHAR(255) NOT NULL,
    `ip` VARCHAR(255) NOT NULL,
    `tokens` JSON,
    `banreason` VARCHAR(255) DEFAULT NULL,
    INDEX `idx_license` (`license`),
    INDEX `idx_steam` (`steam`),
    INDEX `idx_discord` (`discord`),
    INDEX `idx_ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `deadeye_anticheat_tokens` (
    `ban_id` int(7) NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    INDEX `idx_token` (`token`),
    CONSTRAINT `fk_deadeye_anticheat_ban` FOREIGN KEY (`ban_id`)
        REFERENCES `deadeye_anticheat` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB CHARSET=utf8mb4;
