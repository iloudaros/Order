CREATE TABLE "Users" (
  "id" int PRIMARY KEY,
  "name" char(15),
  "surname" char(20),
  "role" char(20)
);

CREATE TABLE "Items" (
  "id" bigint PRIMARY KEY,
  "name" char(15),
  "category" char(15),
  "supervisor" int,
  "room" int,
  "comments" varchar
);

CREATE TABLE "Item_Categories" (
  "title" char(15)
);

CREATE TABLE "Rooms" (
  "id" int PRIMARY KEY,
  "name" char(15),
  "floor" int(3),
  "building" int,
  "categories" char(15)
);

CREATE TABLE "Room_Categories" (
  "name" char(15)
);

CREATE TABLE "Buildings" (
  "id" int PRIMARY KEY,
  "name" char(15),
  "Address" char(100)
);

ALTER TABLE "Items" ADD FOREIGN KEY ("category") REFERENCES "Item_Categories" ("title");

ALTER TABLE "Items" ADD FOREIGN KEY ("supervisor") REFERENCES "Users" ("id");

ALTER TABLE "Items" ADD FOREIGN KEY ("room") REFERENCES "Rooms" ("id");

ALTER TABLE "Rooms" ADD FOREIGN KEY ("building") REFERENCES "Buildings" ("id");

ALTER TABLE "Rooms" ADD FOREIGN KEY ("categories") REFERENCES "Room_Categories" ("name");
