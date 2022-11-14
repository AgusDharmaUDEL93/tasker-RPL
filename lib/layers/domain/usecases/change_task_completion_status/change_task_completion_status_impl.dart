import 'package:tasker/layers/domain/entities/task_entity.dart';
import 'package:tasker/layers/domain/repositories/change_task_completion_status_repository.dart';
import 'package:tasker/layers/domain/usecases/change_task_completion_status/change_task_completion_status.dart';

class ChangeTaskCompletionStatusUsecaseImpl
    implements ChangeTaskCompletionStatusUsecase {
  final ChangeTaskCompletionStatusRepository
      _changeTaskCompletionStatusRepository;
  ChangeTaskCompletionStatusUsecaseImpl(
      this._changeTaskCompletionStatusRepository);

  @override
  void call(TaskEntity task) {
    _changeTaskCompletionStatusRepository(task);
  }
}
