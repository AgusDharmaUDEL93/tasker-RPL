import 'package:tasker/layers/domain/entities/task_entity.dart';

abstract class SaveTaskUsecase {
  bool call(TaskEntity task);
}
