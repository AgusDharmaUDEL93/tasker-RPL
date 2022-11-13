import 'package:tasker/layers/domain/entities/task_entity.dart';

abstract class GetAllTasksUsecase {
  List<TaskEntity> call();
}
