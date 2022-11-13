import 'package:tasker/layers/data/datasources/get_all_tasks_datasource.dart';
import 'package:tasker/layers/domain/entities/task_entity.dart';
import 'package:tasker/layers/domain/repositories/get_all_tasks_repository.dart';

class GetAllTasksRepositoryImpl implements GetAllTasksRepository {
  final GetAllTasksDatasource _getAllTasksDatasource;
  GetAllTasksRepositoryImpl(this._getAllTasksDatasource);

  @override
  List<TaskEntity> call() {
    return _getAllTasksDatasource();
  }
}
