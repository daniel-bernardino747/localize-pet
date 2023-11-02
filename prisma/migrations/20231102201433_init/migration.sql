-- CreateTable
CREATE TABLE "accounts" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "role" TEXT NOT NULL DEFAULT 'CUSTOMER',
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "profileId" INTEGER NOT NULL,
    CONSTRAINT "accounts_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "profiles" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "profiles" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pets" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "owner_id" INTEGER NOT NULL,
    "characteristicId" INTEGER NOT NULL,
    CONSTRAINT "pets_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "profiles" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "pets_characteristicId_fkey" FOREIGN KEY ("characteristicId") REFERENCES "characteristics" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "collars" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "qrcode" TEXT NOT NULL,
    "pet_id" INTEGER NOT NULL,
    CONSTRAINT "collars_pet_id_fkey" FOREIGN KEY ("pet_id") REFERENCES "pets" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "characteristics" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "age" INTEGER NOT NULL,
    "breed_id" INTEGER NOT NULL,
    "temperamentId" INTEGER NOT NULL,
    "pet_description" TEXT NOT NULL,
    "owner_description" TEXT NOT NULL,
    CONSTRAINT "characteristics_breed_id_fkey" FOREIGN KEY ("breed_id") REFERENCES "breeds" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "characteristics_temperamentId_fkey" FOREIGN KEY ("temperamentId") REFERENCES "Temperament" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Temperament" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "description" TEXT NOT NULL,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "breeds" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT
);

-- CreateIndex
CREATE UNIQUE INDEX "accounts_email_key" ON "accounts"("email");

-- CreateIndex
CREATE UNIQUE INDEX "accounts_profileId_key" ON "accounts"("profileId");

-- CreateIndex
CREATE UNIQUE INDEX "pets_characteristicId_key" ON "pets"("characteristicId");

-- CreateIndex
CREATE UNIQUE INDEX "collars_qrcode_key" ON "collars"("qrcode");

-- CreateIndex
CREATE UNIQUE INDEX "collars_pet_id_key" ON "collars"("pet_id");

-- CreateIndex
CREATE UNIQUE INDEX "Temperament_name_key" ON "Temperament"("name");
