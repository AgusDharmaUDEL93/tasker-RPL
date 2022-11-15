import 'package:flutter/material.dart';
import 'package:tasker/layers/core/injector/injector.dart';
import 'package:tasker/layers/presentation/controllers/task_controller.dart';

import '../../../widgets/add_first_task_widget.dart';
import '../../../widgets/task_card_widget.dart';

class TaskListBuilder extends StatefulWidget {
  const TaskListBuilder({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  State<TaskListBuilder> createState() => _TaskListBuilderState();
}

class _TaskListBuilderState extends State<TaskListBuilder> {
  final TaskController taskController = serviceLocator.get<TaskController>();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: taskController,
      builder: (context, child) {
        var tasks;
        switch (widget.currentIndex) {
          case 0:
            taskController.tasksList
                .sort((a, b) => a.expirationDate.compareTo(b.expirationDate));
            tasks = taskController.tasksList;
            break;
          case 1:
            tasks = taskController.tasksList.where((e) => e.isDone).toList();
            break;
          case 2:
            tasks = taskController.tasksList.where((e) => !e.isDone).toList();
            break;
        }
        if (tasks.isNotEmpty) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return TaskCardWidget(
                task: tasks[index],
              );
            },
          );
        }
        if (widget.currentIndex == 0) {
          return const AddFirstTaskWidget();
        }
        return Container();
      },
    );
  }
}
