import 'package:tasker/layers/data/datasources/save_task_datasource.dart';
import 'package:tasker/layers/domain/repositories/save_task_repository.dart';

import '../../domain/entities/task_entity.dart';

class SaveTaskRepositoryImpl implements SaveTaskRepository {
  final SaveTaskDatasource _saveTaskDatasource;
  SaveTaskRepositoryImpl(this._saveTaskDatasource);

  @override
  bool call(TaskEntity task, [String? previousTitle]) {
    return _saveTaskDatasource(task, previousTitle);
  }
}
