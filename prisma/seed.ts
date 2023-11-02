// prisma/seed.ts

import { PrismaClient } from '@prisma/client';

// initialize Prisma Client
const prisma = new PrismaClient();

async function main() {
  // create admin account
  await prisma.account.upsert({
    where: {
      email: 'ludomat@gmail.com',
    },
    update: {
      email: 'ludomat@gmail.com',
    },
    create: {
      email: 'ludomat@gmail.com',
      password: 'admin123',
      role: 'ADMIN',
      profile: {
        create: {
          firstName: 'Luís',
          lastName: 'Ludomat',
        },
      },
    },
  });
}

// execute the main function
main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    // close Prisma Client at the end
    await prisma.$disconnect();
  });
