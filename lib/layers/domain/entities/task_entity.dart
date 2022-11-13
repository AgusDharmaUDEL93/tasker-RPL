class TaskEntity {
  String title;
  String description;
  DateTime expirationDate;
  bool isDone;

  TaskEntity({
    required this.title,
    required this.description,
    required this.expirationDate,
    required this.isDone,
  });
}
