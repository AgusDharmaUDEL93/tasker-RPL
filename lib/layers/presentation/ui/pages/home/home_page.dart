import 'package:tasker/layers/domain/entities/task_entity.dart';
import 'package:tasker/layers/presentation/controllers/task_controller.dart';
import 'package:tasker/layers/presentation/ui/widgets/task_card_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/injector/injector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TaskController taskController = serviceLocator.get<TaskController>();
  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    taskController.getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
            ),
            ElevatedButton(
              child: Text('teste'),
              onPressed: () {
                taskController.saveTask(
                  TaskEntity(
                    title: _titleController.text,
                    description: 'teste',
                    expirationDate: DateTime.now(),
                    isDone: false,
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: taskController,
              builder: (context, child) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: taskController.tasksList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TaskCardWidget(
                        task: taskController.tasksList[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
