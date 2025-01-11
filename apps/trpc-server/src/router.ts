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
export const protectedProcedure = t.procedure.input(
  z.object({
    userId: z.string(),
  })
);

export const appRouter = router({
  hello: publicProcedure
    .input(
      z.object({
        hello: z.string(),
        works: z.object({
          yes: z.boolean(),
          no: z.boolean(),
        }),
        date: z.enum(["today", "yesterday", "tomorrow"]),
      })
    )
    .query(() => ({ hello: "world" })),
  nested: router({
    hello2: protectedProcedure
      .input(
        z.object({
          listId: z.string(),
          date: z.enum(["today", "yesterday", "tomorrow"]),
        })
      )
      .mutation(() => ({ hello: "world" })),
    nestedx2: router({
      hello7: publicProcedure
        .output(z.object({ hello: z.boolean() }))
        .query(() => ({ hello: true })),
    }),
  }),
});

export type AppRouter = typeof appRouter;

export default appRouter;
