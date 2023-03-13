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

exports.updateToDo = async (req, res) => {
  try {
    const toDo = await ToDo.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
      runValidators: true,
    });

    res.status(200).json({
      status: "success",
      data: {
        toDo,
      },
    });
  } catch (err) {
    res.status(400).json({
      status: "fail",
      message: "error",
    });
  }
};

exports.deleteToDo = (req, res) => {
  res.status(204).json({
    status: "success",
    data: null,
  });
};
