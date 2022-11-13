import 'package:tasker/layers/domain/entities/task_entity.dart';

abstract class SaveTaskRepository {
  bool call(TaskEntity task);
}
