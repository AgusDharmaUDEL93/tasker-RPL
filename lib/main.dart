import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasker/layers/core/injector/injector.dart';
import 'package:tasker/layers/core/utils/route_generator.dart';

import 'layers/data/datasources/local/tables/table_task.dart';
import 'layers/domain/entities/task_entity.dart';

late Box<TaskEntity> taskBox;

Future<void> main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TaskTableAdapter());
  taskBox = await Hive.openBox<TaskEntity>('taskmodel');

  runApp(const TaskerApp());
}

class TaskerApp extends StatelessWidget {
  const TaskerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasker',
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/',
    );
  }
}

