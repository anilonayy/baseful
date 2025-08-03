import { betterAuth, type User } from 'better-auth';
import { drizzleAdapter } from 'better-auth/adapters/drizzle';
import { nextCookies } from 'better-auth/next-js';
import { db } from '../db';

// Validate required environment variables
if (!process.env.AUTH_SECRET) {
  throw new Error('AUTH_SECRET environment variable is required');
}

if (!process.env.AUTH_URL) {
  throw new Error('AUTH_URL environment variable is required');
}

export const auth = betterAuth({
  database: drizzleAdapter(db, {
    provider: 'pg', // PostgreSQL
  }),
  emailAndPassword: {
    enabled: true,
    requireEmailVerification: false, // Set to true in production
  },
  socialProviders: {
    google: {
      clientId: process.env.GOOGLE_CLIENT_ID as string,
      clientSecret: process.env.GOOGLE_CLIENT_SECRET as string,
    },
  },
  plugins: [
    nextCookies(), // Next.js cookie handling
  ],
  secret: process.env.AUTH_SECRET,
  baseURL: process.env.AUTH_URL,
  callbacks: {
    onUserCreate: async (user: User) => {
      // You can add custom logic here when a user is created
      console.log('New user created:', user.email);
      return user;
    },
  },
});

export type Auth = typeof auth;
