import 'package:hive/hive.dart';
import 'package:tasker/layers/data/datasources/change_task_completion_status_datasource.dart';
import 'package:tasker/layers/data/datasources/local/tables/table_task.dart';
import 'package:tasker/layers/domain/entities/task_entity.dart';

class ChangeTaskCompletionStatusDatasourceImpl
    implements ChangeTaskCompletionStatusDatasource {
  final Box<TaskEntity> _box;
  ChangeTaskCompletionStatusDatasourceImpl(this._box);

  @override
  void call(TaskEntity task) {
    final newTask = TaskTable(
      title: task.title,
      description: task.description,
      expirationDate: task.expirationDate,
      isDone: !task.isDone,
    );
    _box.put(task.title, newTask);
  }
}
