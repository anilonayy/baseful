'use server';

import { headers } from 'next/headers';
import { cache } from 'react';
import type { User } from '@/db/schema';
import { auth } from '@/lib/auth';

export const getMe = cache(async () => {
  const session = await auth.api.getSession({
    headers: await headers(),
  });

  return session?.user as User;
});
