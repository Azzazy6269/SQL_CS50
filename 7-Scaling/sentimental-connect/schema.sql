-- SQL Script
DROP TABLE IF EXISTS `connection_users`,
                     `connection_with_school`,
                     `connection_with_companies`,
                     `Users`,
                     `School_and_universities`,
                     `Companies`;


CREATE TABLE  `Users`(
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(10) NOT NULL,
    `last_name`  VARCHAR(10) NOT NULL,
    `username`   VARCHAR(25) NOT NULL,
    `password`   VARCHAR(25) NOT NULL,
    PRIMARY KEY (`id`)
);


CREATE TABLE `School_and_universities`(
    `id` INT UNSIGNED AUTO_INCREMENT,
    `school_name` VARCHAR(25) NOT NULL,
    `school_type`        VARCHAR(25) NOT NULL,
    `school_location`    VARCHAR(25) NOT NULL,
    `foundation_year`SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `Companies`(
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name_of_company` VARCHAR(15) NOT NULL,
    `industry`        VARCHAR(25) NOT NULL,
    `location`        VARCHAR(25) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `connection_users`(
    `id_user1` INT UNSIGNED ,
    `id_user2` INT UNSIGNED ,
    PRIMARY KEY (`id_user1`,`id_user2`),
    FOREIGN KEY (`id_user1`) REFERENCES `Users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`id_user2`) REFERENCES `Users`(`id`) ON DELETE CASCADE
);

CREATE TABLE `connection_with_school`(
    `id_user`   INT UNSIGNED ,
    `id_school` INT UNSIGNED ,
    PRIMARY KEY (`id_user`,`id_school`),
    FOREIGN KEY (`id_user`) REFERENCES `Users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`id_school`) REFERENCES `School_and_universities`(`id`) ON DELETE CASCADE
);

CREATE TABLE `connection_with_companies`(
    `id_user`    INT UNSIGNED ,
    `id_company` INT UNSIGNED ,
    PRIMARY KEY (`id_user`,`id_company`),
    FOREIGN KEY (`id_user`) REFERENCES `Users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`id_company`) REFERENCES `Companies`(`id`) ON DELETE CASCADE
);

INSERT INTO `Users`(`id`,`first_name`,`last_name`,`username`,`password`)
    VALUES(1,'Claudine','Gay','claudine','password'),
          (2,'Reid','Hoffman','reid','password');

INSERT INTO `School_and_universities`(`id`,`school_name`,`school_type`,`school_location`,`foundation_year`)
    VALUES(1,'Harvard University','university','Cambridge, Massachusetts',1636);

INSERT INTO `Companies`(`id`,`name_of_company`,`industry`,`location`)
    VALUES(1,'LinkedIn','technology company','Sunnyvale, California');

INSERT INTO `connection_with_school`(`id_user`,`id_school`)
    VALUES(1,1);

INSERT INTO `connection_with_companies`(`id_user`,`id_company`)
    VALUES(2,1);


