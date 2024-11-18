/*
  Warnings:

  - You are about to drop the `role` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[username]` on the table `Account` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE `account` DROP FOREIGN KEY `Account_roleId_fkey`;

-- AlterTable
ALTER TABLE `account` ADD COLUMN `role` ENUM('USER', 'SUPERVISOR', 'ADMIN_KEUANGAN', 'MANAJER_KEUANGAN', 'SUPER_ADMIN') NOT NULL DEFAULT 'SUPER_ADMIN',
    ADD COLUMN `supervisorId` INTEGER NULL;

-- DropTable
DROP TABLE `role`;

-- CreateIndex
CREATE UNIQUE INDEX `Account_username_key` ON `Account`(`username`);

-- AddForeignKey
ALTER TABLE `Account` ADD CONSTRAINT `Account_supervisorId_fkey` FOREIGN KEY (`supervisorId`) REFERENCES `Account`(`userId`) ON DELETE SET NULL ON UPDATE CASCADE;
