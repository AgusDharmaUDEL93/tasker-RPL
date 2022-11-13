import 'package:hive/hive.dart';
import 'package:tasker/layers/data/datasources/local/tables/table_task.dart';
import 'package:tasker/layers/data/datasources/save_task_datasource.dart';
import 'package:tasker/layers/domain/entities/task_entity.dart';

class SaveTaskLocalDatasourceImpl implements SaveTaskDatasource {
  final Box<TaskEntity> _box;
  SaveTaskLocalDatasourceImpl(this._box);

  @override
  bool call(TaskEntity task) {
    final newTask = TaskTable(
      title: task.title,
      description: task.description,
      expirationDate: task.expirationDate,
      isDone: task.isDone,
    );
    if (_box.containsKey(task.title)) {
      return false;
    }
    _box.put(task.title, newTask);
    return true;
  }
}
