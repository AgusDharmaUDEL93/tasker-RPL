import 'package:tasker/layers/domain/entities/task_entity.dart';
import 'package:hive/hive.dart';

part 'table_task.g.dart';

@HiveType(typeId: 0)
class TaskTable extends TaskEntity {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  DateTime expirationDate;

  @HiveField(3)
  bool isDone;

  TaskTable({
    required this.title,
    required this.description,
    required this.expirationDate,
    this.isDone = false,
  }) : super(
          title: title,
          description: description,
          expirationDate: expirationDate,
          isDone: isDone,
        );
}
