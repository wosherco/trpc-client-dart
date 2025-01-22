import { Hono } from "hono";
import { trpcServer } from "@hono/trpc-server";
import { appRouter } from "./router";
import { logger } from "hono/logger";

const app = new Hono();

app.use("*", logger());

app.use(
  "/trpc/*",
  trpcServer({
    router: appRouter,
  })
);

export default app;
