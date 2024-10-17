-- CreateTable
CREATE TABLE `cities` (
    `idcity` INTEGER NOT NULL,
    `city` VARCHAR(45) NOT NULL,
    `FK_idcountry` INTEGER NOT NULL,

    PRIMARY KEY (`idcity`, `FK_idcountry`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `comments` (
    `idcomment` INTEGER NOT NULL,
    `FK_idevent` INTEGER NOT NULL,
    `FK_iduser` INTEGER NOT NULL,
    `comment` VARCHAR(512) NOT NULL,
    `date_comment` DATE NOT NULL,

    PRIMARY KEY (`idcomment`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `country` (
    `idcountry` INTEGER NOT NULL,
    `name_country` VARCHAR(45) NOT NULL,

    UNIQUE INDEX `idcountry_UNIQUE`(`idcountry`),
    PRIMARY KEY (`idcountry`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `event` (
    `idevent` INTEGER NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    `start_date` DATETIME(0) NOT NULL,
    `end_date` DATETIME(0) NULL,
    `description` VARCHAR(45) NULL,
    `number_of_ticket` INTEGER NOT NULL,
    `photo` BLOB NULL,
    `contact_info` VARCHAR(45) NOT NULL,
    `FK_idevent_category` INTEGER NOT NULL,
    `FK_idlocation` INTEGER NOT NULL,
    `status` TINYINT NOT NULL,

    UNIQUE INDEX `id_event_UNIQUE`(`idevent`),
    PRIMARY KEY (`idevent`, `FK_idlocation`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `event_category` (
    `idevent_category` INTEGER NOT NULL,
    `category_type` VARCHAR(45) NOT NULL,

    PRIMARY KEY (`idevent_category`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `event_locations` (
    `id_event_location` INTEGER NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    `FK_idcity` INTEGER NOT NULL,

    PRIMARY KEY (`id_event_location`, `FK_idcity`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `event_ticket` (
    `idevent_ticket` INTEGER NOT NULL,
    `name` VARCHAR(45) NULL,
    `price` FLOAT NOT NULL,
    `start_date` DATETIME(0) NOT NULL,
    `end_date` DATETIME(0) NOT NULL,
    `FK_idevent` INTEGER NOT NULL,

    PRIMARY KEY (`idevent_ticket`, `FK_idevent`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `favourite_event` (
    `idfavourite_event` INTEGER NOT NULL,
    `FK_idevent` INTEGER NOT NULL,
    `FK_iduser` INTEGER NOT NULL,

    PRIMARY KEY (`idfavourite_event`, `FK_idevent`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order` (
    `idorder` INTEGER NOT NULL,
    `data` DATE NOT NULL,
    `total_amount` FLOAT NOT NULL,
    `total_tax_amount` FLOAT NOT NULL,
    `FK_iduser` INTEGER NOT NULL,

    PRIMARY KEY (`idorder`, `FK_iduser`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order_ticket` (
    `idorder_ticket` INTEGER NOT NULL,
    `FK_idevent_ticket` INTEGER NOT NULL,
    `FK_idorder` INTEGER NOT NULL,
    `FK_idticket_status` INTEGER NOT NULL,

    PRIMARY KEY (`idorder_ticket`, `FK_idevent_ticket`, `FK_idorder`, `FK_idticket_status`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payment` (
    `idpayment` INTEGER NOT NULL,
    `FK_idorder` INTEGER NOT NULL,
    `FK_idpayment_methods` INTEGER NOT NULL,
    `FK_idpayment_status` INTEGER NOT NULL,

    PRIMARY KEY (`idpayment`, `FK_idorder`, `FK_idpayment_methods`, `FK_idpayment_status`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `iduser` INTEGER NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    `second_name` VARCHAR(45) NULL,
    `surname` VARCHAR(45) NOT NULL,
    `FK_iduser_type` INTEGER NOT NULL,
    `email` VARCHAR(45) NOT NULL,
    `phonenumber` INTEGER NOT NULL,
    `zipcode` VARCHAR(45) NOT NULL,
    `street` VARCHAR(45) NOT NULL,
    `FK_idcity` INTEGER NOT NULL,
    `password` VARCHAR(45) NOT NULL,

    PRIMARY KEY (`iduser`, `FK_iduser_type`, `FK_idcity`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_type` (
    `iduser_type` INTEGER NOT NULL,
    `name_type` VARCHAR(45) NOT NULL,

    PRIMARY KEY (`iduser_type`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
