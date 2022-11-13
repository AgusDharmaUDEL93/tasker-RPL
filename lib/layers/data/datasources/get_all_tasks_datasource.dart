import 'package:tasker/layers/domain/entities/task_entity.dart';

abstract class GetAllTasksDatasource {
  List<TaskEntity> call();
}
