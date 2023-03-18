const ToDo = require("../models/toDoModel");
const APIFeatures = require("../utils/apiFeatures");
const catchAsync = require("../utils/catchAsync");
const AppError = require("../utils/appError");

exports.aliasCompletedToDos = (req, res, next) => {
  req.query.completed = true;
  next();
};

exports.getAllToDos = catchAsync(async (req, res, next) => {
  const features = new APIFeatures(
    ToDo.find({ user: req.userId }).populate("user"),
    req.query
  )
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
  const toDoData = {
    ...req.body,
    user: req.userId,
  };

  const newToDo = await ToDo.create(toDoData);

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

  if (!toDo) {
    return next(new AppError("No toDo specified for the given ID", 404));
  }

  res.status(200).json({
    status: "success",
    data: {
      toDo,
    },
  });
});

exports.deleteToDo = catchAsync(async (req, res, next) => {
  const toDo = await ToDo.findByIdAndDelete(req.params.id);

  if (!toDo) {
    return next(new AppError("No toDo specified for the given ID", 404));
  }

  res.status(204).json({
    status: "success",
    data: null,
  });
});

exports.getCurrentDayToDos = catchAsync(async (req, res, next) => {
  const startOfToday = new Date();
  startOfToday.setHours(0, 0, 0, 0);
  const endOfToday = new Date();
  endOfToday.setHours(23, 59, 59, 999);

  const toDosToday = await ToDo.find({
    dueDate: { $gte: startOfToday, $lt: endOfToday },
  });

  res.status(200).json({
    status: "success",
    data: toDosToday,
  });
});
