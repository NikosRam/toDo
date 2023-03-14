const ToDo = require("../models/toDoModel");
const APIFeatures = require("../utils/apiFeatures");

exports.aliasCompletedToDos = (req, res, next) => {
  req.query.completed = true;
  next();
};

exports.getAllToDos = async (req, res) => {
  try {
    const features = new APIFeatures(ToDo.find(), req.query)
      .filter()
      .sort()
      .limit()
      .paginate();
    const toDos = await features.query;

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
    res.status(404).json({
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
    res.status(404).json({
      status: "fail",
      message: "error",
    });
  }
};

exports.deleteToDo = async (req, res) => {
  try {
    await ToDo.findByIdAndDelete(req.params.id);

    res.status(204).json({
      status: "success",
      data: null,
    });
  } catch (err) {
    res.status(404).json({
      status: "fail",
      message: "error",
    });
  }
};
