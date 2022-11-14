import 'package:tasker/layers/domain/entities/task_entity.dart';
import 'package:tasker/layers/domain/repositories/save_task_repository.dart';
import 'package:tasker/layers/domain/usecases/save_task/save_task_usecase.dart';

class SaveTaskUsecaseImpl implements SaveTaskUsecase {
  final SaveTaskRepository _saveTaskRepository;
  SaveTaskUsecaseImpl(this._saveTaskRepository);

  @override
  bool call(TaskEntity task, [String? previousTitle]) {
    return _saveTaskRepository(task, previousTitle);
  }
}
