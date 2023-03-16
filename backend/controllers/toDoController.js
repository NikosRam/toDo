const ToDo = require("../models/toDoModel");
const APIFeatures = require("../utils/apiFeatures");
const catchAsync = require("../utils/catchAsync");

exports.aliasCompletedToDos = (req, res, next) => {
  req.query.completed = true;
  next();
};

exports.getAllToDos = catchAsync(async (req, res, next) => {
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
});

exports.createToDo = catchAsync(async (req, res, next) => {
  const newToDo = await ToDo.create(req.body);

  res.status(201).json({
    status: "success",
    data: {
      toDo: newToDo,
    },
  });
});

exports.updateToDo = catchAsync(async (req, res, next) => {
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
});

exports.deleteToDo = catchAsync(async (req, res, next) => {
  await ToDo.findByIdAndDelete(req.params.id);

  res.status(204).json({
    status: "success",
    data: null,
  });
});

exports.getCurrentDayToDos = catchAsync(async (req, res, next) => {
  const today = new Date();

  const start = new Date(
    today.getFullYear(),
    today.getMonth(),
    today.getDate(),
    0,
    0,
    0,
    0
  );
  const end = new Date(
    today.getFullYear(),
    today.getMonth(),
    today.getDate(),
    23,
    59,
    59,
    999
  );

  const toDosToday = await ToDo.aggregate([
    {
      $match: {
        date: {
          $gte: start,
          $lte: end,
        },
      },
    },
  ]);

  res.status(200).json({
    status: "success",
    data: toDosToday,
  });
});
