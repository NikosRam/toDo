const express = require("express");
const toDoController = require("../controllers/toDoController");
const authController = require("../controllers/authController");

const router = express.Router();

router
  .route("/completed")
  .get(
    authController.protect,
    toDoController.aliasCompletedToDos,
    toDoController.getAllToDos
  );

router
  .route("/todos-today")
  .get(authController.protect, toDoController.getCurrentDayToDos);

router
  .route("/")
  .get(authController.protect, toDoController.getAllToDos)
  .post(authController.protect, toDoController.createToDo);

router
  .route("/:id")
  .patch(authController.protect, toDoController.updateToDo)
  .delete(authController.protect, toDoController.deleteToDo);

module.exports = router;
