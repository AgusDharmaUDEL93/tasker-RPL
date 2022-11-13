import 'package:tasker/layers/data/datasources/delete_task_datasource.dart';
import 'package:tasker/layers/domain/repositories/delete_task_repository.dart';

class DeleteTaskRepositoryImpl implements DeleteTaskRepository {
  final DeleteTaskDatasource _deleteTaskDatasource;
  DeleteTaskRepositoryImpl(this._deleteTaskDatasource);

  @override
  bool call(String title) {
    return _deleteTaskDatasource(title);
  }
}
