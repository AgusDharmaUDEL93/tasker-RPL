import 'package:tasker/layers/domain/repositories/delete_task_repository.dart';
import 'package:tasker/layers/domain/usecases/delete_task/delete_task_usecase.dart';

class DeleteTaskUsecaseImpl implements DeleteTaskUsecase {
  final DeleteTaskRepository _deleteTaskRepository;
  DeleteTaskUsecaseImpl(this._deleteTaskRepository);

  @override
  bool call(String title) {
    return _deleteTaskRepository(title);
  }
}
