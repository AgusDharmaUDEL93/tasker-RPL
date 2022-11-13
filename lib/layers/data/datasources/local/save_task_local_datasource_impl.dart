import 'package:hive/hive.dart';
import 'package:tasker/layers/data/datasources/save_task_datasource.dart';
import 'package:tasker/layers/domain/entities/task_entity.dart';

class SaveTaskLocalDatasourceImpl implements SaveTaskDatasource {
  final Box<TaskEntity> _box;
  SaveTaskLocalDatasourceImpl(this._box);

  @override
  bool call(TaskEntity task) {
    _box.put(task.title.toLowerCase(), task);
    return true;
  }
}
