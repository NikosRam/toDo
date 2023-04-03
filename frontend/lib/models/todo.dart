class ToDo {
  final String title;
  DateTime dueDate;
  bool completed;
  String id;

  ToDo({
    required this.title,
    required this.dueDate,
    this.completed = false,
    required this.id,
  });
}
