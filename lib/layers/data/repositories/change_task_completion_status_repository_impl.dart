import 'package:tasker/layers/data/datasources/change_task_completion_status_datasource.dart';
import 'package:tasker/layers/domain/entities/task_entity.dart';
import 'package:tasker/layers/domain/repositories/change_task_completion_status_repository.dart';

class ChangeTaskCompletionStatusRepositoryImpl
    implements ChangeTaskCompletionStatusRepository {
  final ChangeTaskCompletionStatusDatasource
      _changeTaskCompletionStatusDatasource;
  ChangeTaskCompletionStatusRepositoryImpl(
      this._changeTaskCompletionStatusDatasource);

  @override
  void call(TaskEntity task) {
    _changeTaskCompletionStatusDatasource(task);
  }
}
