import 'package:tasker/layers/domain/entities/task_entity.dart';

abstract class GetAllTasksRepository {
  List<TaskEntity> call();
}
