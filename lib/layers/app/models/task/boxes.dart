import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasker/layers/app/models/task/task_model.dart';

class Boxes {
  static Box<TaskModel> getTasks() => Hive.box<TaskModel>('taskmodel');
}
