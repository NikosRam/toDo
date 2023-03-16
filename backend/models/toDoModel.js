const mongoose = require("mongoose");

const toDoSchema = new mongoose.Schema({
  title: {
    type: String,
    required: [true, "A toDo must have a name"],
    trim: true,
    minlength: [1, "minimum characters: 1"],
    maxlength: [30, "maximum characters: 30"],
  },
  dateCreated: {
    type: Date,
    default: Date.now(),
  },
  dueDate: {
    type: Date,
    default: Date.now(),
  },
  completed: {
    type: Boolean,
    default: false,
  },
});

const ToDo = mongoose.model("ToDo", toDoSchema);

module.exports = ToDo;
