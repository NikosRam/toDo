const express = require("express");
const toDoRouter = require("./routes/toDoRoutes");
const userRouter = require("./routes/userRoutes");

const app = express();

app.use(express.json());

app.use("/api/v1/todo", toDoRouter);
app.use("/api/v1/users", userRouter);

module.exports = app;
