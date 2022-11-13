import 'package:hive/hive.dart';
import 'package:tasker/layers/data/datasources/delete_task_datasource.dart';
import '../../../domain/entities/task_entity.dart';

class DeleteTaskLocalDatasourceImpl implements DeleteTaskDatasource {
  final Box<TaskEntity> _box;
  DeleteTaskLocalDatasourceImpl(this._box);

  @override
  bool call(String title) {
    _box.delete(title);
    return true;
  }
}
