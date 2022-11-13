import 'package:tasker/layers/domain/entities/task_entity.dart';
import 'package:tasker/layers/domain/usecases/delete_task/delete_task_usecase.dart';
import 'package:tasker/layers/domain/usecases/get_all_tasks/get_all_tasks_usecase.dart';
import 'package:tasker/layers/domain/usecases/save_task/save_task_usecase.dart';

class TaskController {
  final GetAllTasksUsecase _getAllTasksUsecase;
  final DeleteTaskUsecase _deleteTaskUsecase;
  final SaveTaskUsecase _saveTaskUsecase;

  TaskController(
    this._getAllTasksUsecase,
    this._deleteTaskUsecase,
    this._saveTaskUsecase,
  );

  List<TaskEntity> getAllTasks() {
    return _getAllTasksUsecase();
  }

  bool saveTask(TaskEntity task) {
    return _saveTaskUsecase(task);
  }

  bool deleteTask(String title) {
    return _deleteTaskUsecase(title);
  }
}
