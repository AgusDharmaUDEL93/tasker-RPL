import 'package:flutter/material.dart';

import '../../../../../core/injector/injector.dart';
import '../../../../controllers/task_controller.dart';
import '../../../widgets/add_first_task_widget.dart';
import '../../../widgets/task_card_widget.dart';

class SearchTaskListBuilder extends StatelessWidget {
  SearchTaskListBuilder({
    super.key,
    this.startDate,
    this.endDate,
    required this.arguments,
  });

  DateTime? startDate;
  DateTime? endDate;
  final String arguments;

  final TaskController taskController = serviceLocator.get<TaskController>();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: taskController,
      builder: (BuildContext context, Widget? child) {
        var tasks;
        if (startDate != null && endDate != null) {
          startDate = startDate!.subtract(const Duration(milliseconds: 1));
          endDate = endDate!.add(const Duration(days: 1));
          if (arguments == '') {
            tasks = taskController.filterTasksByDate(
              startDate!,
              endDate!,
            );
          } else if (arguments != '') {
            tasks = taskController.filterTasksByTitleAndDate(
              arguments,
              startDate!,
              endDate!,
            );
          }
        } else if (startDate == null && endDate == null && arguments != '') {
          tasks = taskController.filterTasksByTitle(
            arguments,
          );
        } else {
          tasks = taskController.tasksList;
        }

        if (tasks.isNotEmpty) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              final task = tasks[index];
              return TaskCardWidget(task: task);
            },
          );
        } else if (taskController.tasksList.isEmpty) {
          return const AddFirstTaskWidget();
        } else {
          // return const SearchNotFoundWidget();
          return Container();
        }
      },
    );
  }
}
