const mongoose = require("mongoose");

const toDoSchema = new mongoose.Schema({
  title: {
    type: String,
    required: [true, "A toDo must have a name"],
  },
  date: Date,
  completed: {
    type: Boolean,
    default: false,
  },
});

const ToDo = mongoose.model("ToDo", toDoSchema);

module.exports = ToDo;
