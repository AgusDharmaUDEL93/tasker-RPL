import 'package:tasker/layers/domain/entities/task_entity.dart';
import 'package:tasker/layers/domain/repositories/get_all_tasks_repository.dart';
import 'package:tasker/layers/domain/usecases/get_all_tasks/get_all_tasks_usecase.dart';

class GetAllTasksUsecaseImpl implements GetAllTasksUsecase {
  final GetAllTasksRepository _getAllTasksRepository;
  GetAllTasksUsecaseImpl(this._getAllTasksRepository);

  @override
  List<TaskEntity> call() {
    return _getAllTasksRepository();
  }
}
