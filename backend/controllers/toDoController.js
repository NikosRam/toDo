const ToDo = require("../models/toDoModel");

exports.getAllToDos = async (req, res) => {
  try {
    const toDos = await ToDo.find();

    res.status(200).json({
      status: "success",
      data: {
        toDos,
      },
    });
  } catch (err) {
    res.status(404).json({
      status: "fail",
      message: "error",
    });
  }
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
