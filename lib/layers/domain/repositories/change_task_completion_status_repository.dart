import '../entities/task_entity.dart';

abstract class ChangeTaskCompletionStatusRepository {
  void call(TaskEntity task);
}
