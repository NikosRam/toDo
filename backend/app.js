const express = require("express");
const morgan = require("morgan");
const toDoRouter = require("./routes/toDoRoutes");
const userRouter = require("./routes/userRoutes");

const app = express();

if (process.env.NODE_ENV === "development") {
  app.use(morgan("dev"));
}

app.use(express.json());

app.use("/api/v1/todo", toDoRouter);
app.use("/api/v1/users", userRouter);

module.exports = app;
