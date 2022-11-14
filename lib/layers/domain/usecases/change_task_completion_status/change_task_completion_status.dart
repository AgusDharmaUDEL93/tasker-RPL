import 'package:tasker/layers/domain/entities/task_entity.dart';

abstract class ChangeTaskCompletionStatusUsecase {
  void call(TaskEntity task);
}
