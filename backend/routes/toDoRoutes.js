const express = require("express");
const toDoController = require("../controllers/toDoController");

const router = express.Router();

router
  .route("/completed")
  .get(toDoController.aliasCompletedToDos, toDoController.getAllToDos);

router.route("/todos-today").get(toDoController.getCurrentDayToDos);

router
  .route("/")
  .get(toDoController.getAllToDos)
  .post(toDoController.createToDo);

router
  .route("/:id")
  .patch(toDoController.updateToDo)
  .delete(toDoController.deleteToDo);

module.exports = router;
