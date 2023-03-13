const ToDo = require("../models/toDoModel");

exports.getAllToDos = (req, res) => {
  res.status(200).json({
    status: "success",
    data: {
      message: "here are the toDos",
    },
  });
};

exports.createToDo = (req, res) => {
  res.status(201).json({
    status: "success",
    data: {
      message: "toDo created",
    },
  });
};

exports.updateToDo = (req, res) => {
  res.status(200).json({
    status: "success",
    data: {
      tour: "Updated todo here",
    },
  });
};

exports.deleteToDo = (req, res) => {
  res.status(204).json({
    status: "success",
    data: null,
  });
};
