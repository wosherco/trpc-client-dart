import { initTRPC } from "@trpc/server";
import superjson from "superjson";
import { z } from "zod";

/**
 * Initialization of tRPC backend
 * Should be done only once per backend!
 */
const t = initTRPC.create({
  transformer: superjson,
});

/**
 * Export reusable router and procedure helpers
 * that can be used throughout the router
 */
export const router = t.router;
export const publicProcedure = t.procedure;

export const appRouter = router({
  hello: publicProcedure
    .input(
      z.object({
        hello: z.string(),
      })
    )
    .query(() => ({ hello: "world" })),
  nested: router({
    hello2: publicProcedure.mutation(() => ({ hello: "world" })),
    nestedx2: router({
      hello7: publicProcedure
        .output(z.object({ hello: z.boolean() }))
        .query(() => ({ hello: true })),
    }),
  }),
});

export type AppRouter = typeof appRouter;

export default appRouter;
