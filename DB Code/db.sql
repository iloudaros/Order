CREATE TABLE `Users` (
  `id` int PRIMARY KEY,
  `name` char(15),
  `surname` char(20),
  `email` varchar(255),
  `role` char(20)
);

CREATE TABLE `Log` (
  `id` bigint PRIMARY KEY,
  `user` int,
  `date` date,
  `table` char(15),
  `type` ENUM ('Insert', 'Update', 'Delete')
);

CREATE TABLE `Items` (
  `id` bigint PRIMARY KEY,
  `name` char(15),
  `category` char(15),
  `supervisor` int,
  `room` int,
  `exp_date` date,
  `comments` varchar(255)
);

CREATE TABLE `Item_Categories` (
  `title` char(15)
);

CREATE TABLE `Rooms` (
  `id` int PRIMARY KEY,
  `name` char(15),
  `floor` int(3),
  `building` int,
  `categories` char(15)
);

CREATE TABLE `Room_Categories` (
  `name` char(15)
);

CREATE TABLE `Buildings` (
  `id` int PRIMARY KEY,
  `name` char(15),
  `Address` char(100)
);

CREATE TABLE `Rights` (
  `item` bigint,
  `room` int,
  PRIMARY KEY (`item`, `room`)
);

CREATE TABLE `Moves` (
  `id` bigint PRIMARY KEY,
  `origin_room` int,
  `destination_room` int,
  `building` int,
  `timestamp` datetime,
  `legal` bit
);

ALTER TABLE `Log` ADD FOREIGN KEY (`user`) REFERENCES `Users` (`id`);

ALTER TABLE `Items` ADD FOREIGN KEY (`category`) REFERENCES `Item_Categories` (`title`);

ALTER TABLE `Items` ADD FOREIGN KEY (`supervisor`) REFERENCES `Users` (`id`);

ALTER TABLE `Items` ADD FOREIGN KEY (`room`) REFERENCES `Rooms` (`id`);

ALTER TABLE `Rooms` ADD FOREIGN KEY (`building`) REFERENCES `Buildings` (`id`);

ALTER TABLE `Rooms` ADD FOREIGN KEY (`categories`) REFERENCES `Room_Categories` (`name`);

ALTER TABLE `Rights` ADD FOREIGN KEY (`item`) REFERENCES `Items` (`id`);

ALTER TABLE `Rights` ADD FOREIGN KEY (`room`) REFERENCES `Rooms` (`id`);

ALTER TABLE `Moves` ADD FOREIGN KEY (`origin_room`) REFERENCES `Rooms` (`id`);

ALTER TABLE `Moves` ADD FOREIGN KEY (`destination_room`) REFERENCES `Rooms` (`id`);

ALTER TABLE `Moves` ADD FOREIGN KEY (`building`) REFERENCES `Buildings` (`id`);
