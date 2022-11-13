import 'package:hive/hive.dart';
import 'package:tasker/layers/data/datasources/get_all_tasks_datasource.dart';
import '../../../domain/entities/task_entity.dart';

class GetAllTasksDatasourceImpl implements GetAllTasksDatasource {
  final Box<TaskEntity> _box;
  GetAllTasksDatasourceImpl(this._box);

  @override
  List<TaskEntity> call() {
    return _box.values.toList();
  }
}
