const ToDo = require("../models/toDoModel");

exports.getAllToDos = (req, res) => {
  res.status(200).json({
    status: "success",
    data: {
      message: "here are the toDos",
    },
  });
};

exports.createToDo = async (req, res) => {
  try {
    const newToDo = await ToDo.create(req.body);

    res.status(201).json({
      status: "success",
      data: {
        toDo: newToDo,
      },
    });
  } catch (err) {
    res.status(400).json({
      status: "fail",
      message: "error",
    });
  }
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
