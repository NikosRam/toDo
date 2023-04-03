class ToDo {
  final String title;
  DateTime dueDate;
  bool completed;

  ToDo({
    required this.title,
    required this.dueDate,
    this.completed = false,
  });
}
