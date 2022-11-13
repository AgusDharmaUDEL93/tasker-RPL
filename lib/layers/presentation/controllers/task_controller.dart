import 'package:flutter/cupertino.dart';
import 'package:tasker/layers/domain/entities/task_entity.dart';
import 'package:tasker/layers/domain/usecases/delete_task/delete_task_usecase.dart';
import 'package:tasker/layers/domain/usecases/get_all_tasks/get_all_tasks_usecase.dart';
import 'package:tasker/layers/domain/usecases/save_task/save_task_usecase.dart';

class TaskController extends ChangeNotifier {
  final GetAllTasksUsecase _getAllTasksUsecase;
  final DeleteTaskUsecase _deleteTaskUsecase;
  final SaveTaskUsecase _saveTaskUsecase;
  List<TaskEntity> tasksList = [];

  TaskController(
    this._getAllTasksUsecase,
    this._deleteTaskUsecase,
    this._saveTaskUsecase,
  );

  void getAllTasks() {
    tasksList = _getAllTasksUsecase();
    notifyListeners();
  }

  void saveTask(TaskEntity task) {
    final isSaved = _saveTaskUsecase(task);
    if (isSaved) {
      tasksList.add(task);
      notifyListeners();
    }
  }

  void deleteTask(String title) {
    final isDeleted = _deleteTaskUsecase(title);
    if (isDeleted) {
      tasksList.removeWhere((e) => e.title == title);
      notifyListeners();
    }
  }
}
