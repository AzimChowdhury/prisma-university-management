-- CreateEnum
CREATE TYPE "PaymentMethod" AS ENUM ('ONLINE', 'CASH');

-- CreateTable
CREATE TABLE "student_semster_payment_history" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "studentSemesterPaymentId" TEXT NOT NULL,
    "transactionId" TEXT NOT NULL,
    "dueAmount" INTEGER NOT NULL DEFAULT 0,
    "paidAmount" INTEGER NOT NULL DEFAULT 0,
    "paymentMethod" "PaymentMethod" NOT NULL DEFAULT 'ONLINE',
    "isPaid" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "student_semster_payment_history_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "student_semster_payment_history" ADD CONSTRAINT "student_semster_payment_history_studentSemesterPaymentId_fkey" FOREIGN KEY ("studentSemesterPaymentId") REFERENCES "student_semester_payments"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
