import 'package:flutter/cupertino.dart';
import 'package:tasker/layers/domain/entities/task_entity.dart';
import 'package:tasker/layers/domain/usecases/change_task_completion_status/change_task_completion_status.dart';
import 'package:tasker/layers/domain/usecases/delete_task/delete_task_usecase.dart';
import 'package:tasker/layers/domain/usecases/get_all_tasks/get_all_tasks_usecase.dart';
import 'package:tasker/layers/domain/usecases/save_task/save_task_usecase.dart';

class TaskController extends ChangeNotifier {
  final GetAllTasksUsecase _getAllTasksUsecase;
  final DeleteTaskUsecase _deleteTaskUsecase;
  final SaveTaskUsecase _saveTaskUsecase;
  final ChangeTaskCompletionStatusUsecase _changeTaskCompletionStatusUsecase;
  List<TaskEntity> tasksList = [];

  TaskController(
    this._getAllTasksUsecase,
    this._deleteTaskUsecase,
    this._saveTaskUsecase,
    this._changeTaskCompletionStatusUsecase,
  );

  void getAllTasks() {
    tasksList = _getAllTasksUsecase();
    notifyListeners();
  }

  bool editTask(TaskEntity task, String previousTitle) {
    final isEdited = _saveTaskUsecase(task, previousTitle);
    if (isEdited) {
      final indexChangedTask =
          tasksList.indexWhere((e) => e.title == previousTitle);
      tasksList.removeAt(indexChangedTask);
      tasksList.insert(indexChangedTask, task);
      notifyListeners();
    }
    return isEdited;
  }

  bool saveTask(TaskEntity task) {
    final isSaved = _saveTaskUsecase(task);
    if (isSaved) {
      tasksList.add(task);
      notifyListeners();
    }
    return isSaved;
  }

  void deleteTask(String title) {
    final isDeleted = _deleteTaskUsecase(title);
    if (isDeleted) {
      tasksList.removeWhere((e) => e.title == title);
      notifyListeners();
    }
  }

  void changeTaskCompletionStatus(TaskEntity task) {
    _changeTaskCompletionStatusUsecase(task);
    final a = tasksList.firstWhere((e) => e.title == task.title);
    a.isDone = !task.isDone;
    notifyListeners();
  }

  List<TaskEntity> filterTasksByTitle(String title) {
    return tasksList
        .where((e) => e.title.toLowerCase().contains(title) ? true : false)
        .toList();
  }

  List<TaskEntity> filterTasksByDate(DateTime start, DateTime end) {
    return tasksList
        .where((e) =>
            e.expirationDate.isAfter(start) && e.expirationDate.isBefore(end))
        .toList();
  }

  List<TaskEntity> filterTasksByTitleAndDate(
      String string, DateTime start, DateTime end) {
    return tasksList
        .where((e) => e.title.toLowerCase().contains(string))
        .where((e) =>
            e.expirationDate.isAfter(start) && e.expirationDate.isBefore(end))
        .toList();
  }
}
