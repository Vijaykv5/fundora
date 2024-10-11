/*
  Warnings:

  - The primary key for the `Campaign` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `createdAt` on the `Campaign` table. All the data in the column will be lost.
  - You are about to drop the column `currentAmount` on the `Campaign` table. All the data in the column will be lost.
  - You are about to drop the column `endDate` on the `Campaign` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Campaign` table. All the data in the column will be lost.
  - You are about to drop the column `startDate` on the `Campaign` table. All the data in the column will be lost.
  - You are about to drop the column `status` on the `Campaign` table. All the data in the column will be lost.
  - You are about to drop the column `targetAmount` on the `Campaign` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Campaign` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Campaign` table. All the data in the column will be lost.
  - The `id` column on the `Campaign` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Donation` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `donationDate` on the `Donation` table. All the data in the column will be lost.
  - You are about to drop the column `donorEmail` on the `Donation` table. All the data in the column will be lost.
  - You are about to drop the column `donorName` on the `Donation` table. All the data in the column will be lost.
  - You are about to drop the column `paymentMethodId` on the `Donation` table. All the data in the column will be lost.
  - The `id` column on the `Donation` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the `CampaignCategory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Category` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PaymentMethod` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Transaction` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `title` to the `Campaign` table without a default value. This is not possible if the table is not empty.
  - Added the required column `donor` to the `Donation` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `campaignId` on the `Donation` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "Campaign" DROP CONSTRAINT "Campaign_userId_fkey";

-- DropForeignKey
ALTER TABLE "CampaignCategory" DROP CONSTRAINT "CampaignCategory_campaignId_fkey";

-- DropForeignKey
ALTER TABLE "CampaignCategory" DROP CONSTRAINT "CampaignCategory_categoryId_fkey";

-- DropForeignKey
ALTER TABLE "Donation" DROP CONSTRAINT "Donation_campaignId_fkey";

-- DropForeignKey
ALTER TABLE "Donation" DROP CONSTRAINT "Donation_paymentMethodId_fkey";

-- DropForeignKey
ALTER TABLE "Transaction" DROP CONSTRAINT "Transaction_donationId_fkey";

-- DropIndex
DROP INDEX "Campaign_id_key";

-- DropIndex
DROP INDEX "Donation_id_key";

-- AlterTable
ALTER TABLE "Campaign" DROP CONSTRAINT "Campaign_pkey",
DROP COLUMN "createdAt",
DROP COLUMN "currentAmount",
DROP COLUMN "endDate",
DROP COLUMN "name",
DROP COLUMN "startDate",
DROP COLUMN "status",
DROP COLUMN "targetAmount",
DROP COLUMN "updatedAt",
DROP COLUMN "userId",
ADD COLUMN     "title" TEXT NOT NULL,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Campaign_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Donation" DROP CONSTRAINT "Donation_pkey",
DROP COLUMN "donationDate",
DROP COLUMN "donorEmail",
DROP COLUMN "donorName",
DROP COLUMN "paymentMethodId",
ADD COLUMN     "donor" TEXT NOT NULL,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "campaignId",
ADD COLUMN     "campaignId" INTEGER NOT NULL,
ADD CONSTRAINT "Donation_pkey" PRIMARY KEY ("id");

-- DropTable
DROP TABLE "CampaignCategory";

-- DropTable
DROP TABLE "Category";

-- DropTable
DROP TABLE "PaymentMethod";

-- DropTable
DROP TABLE "Transaction";

-- DropTable
DROP TABLE "User";

-- DropEnum
DROP TYPE "CampaignStatus";

-- DropEnum
DROP TYPE "PaymentStatus";

-- AddForeignKey
ALTER TABLE "Donation" ADD CONSTRAINT "Donation_campaignId_fkey" FOREIGN KEY ("campaignId") REFERENCES "Campaign"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
