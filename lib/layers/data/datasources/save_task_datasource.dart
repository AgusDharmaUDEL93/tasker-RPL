import 'package:tasker/layers/domain/entities/task_entity.dart';

abstract class SaveTaskDatasource {
  bool call(TaskEntity task, String? previousTitle);
}
