import '../../domain/entities/task_entity.dart';

abstract class ChangeTaskCompletionStatusDatasource {
  void call(TaskEntity task);
}
