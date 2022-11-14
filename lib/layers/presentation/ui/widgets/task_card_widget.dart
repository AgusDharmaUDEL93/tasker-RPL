import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasker/layers/core/injector/injector.dart';
import 'package:tasker/layers/domain/entities/task_entity.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';
import '../../controllers/task_controller.dart';

class TaskCardWidget extends StatefulWidget {
  final TaskEntity task;

  const TaskCardWidget({
    super.key,
    required this.task,
  });

  @override
  State<TaskCardWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  final TaskController taskController = serviceLocator.get<TaskController>();
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    final difference = daysBetween(DateTime.now(), widget.task.expirationDate);
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.4,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => Navigator.pushNamed(
                context,
                kManageTaskRoute,
                arguments: widget.task,
              ),
              foregroundColor: Colors.blue,
              icon: Icons.edit,
              backgroundColor: kMainBackground,
            ),
            SlidableAction(
              onPressed: (context) =>
                  taskController.deleteTask(widget.task.title),
              foregroundColor: Colors.red,
              icon: Icons.delete,
              backgroundColor: kMainBackground,
            ),
          ],
        ),
        child: Theme(
          data: ThemeData(
            dividerColor: Colors.transparent,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: ListTileTheme(
              contentPadding: const EdgeInsets.symmetric(vertical: 6),
              dense: true,
              horizontalTitleGap: 0.0,
              minLeadingWidth: 0,
              child: ExpansionTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: InkWell(
                        radius: 30,
                        onTap: () => taskController
                            .changeTaskCompletionStatus(widget.task),
                        child: widget.task.isDone
                            ? const Icon(
                                Icons.check_circle_rounded,
                                color: kPrimaryColor,
                                size: 30,
                              )
                            : const Icon(
                                Icons.check_rounded,
                                color: kLightGrey,
                                size: 30,
                              ),
                      ),
                    ),
                  ],
                ),
                collapsedBackgroundColor: kCardBackground,
                backgroundColor: kCardCollapsedBackground,
                collapsedTextColor: Colors.black,
                textColor: Colors.black,
                title: Text(
                  widget.task.title,
                  style: GoogleFonts.poppins(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    decoration: widget.task.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.black,
                    decorationThickness: 2,
                  ),
                ),
                childrenPadding: const EdgeInsets.symmetric(vertical: 10),
                subtitle: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 18,
                        height: 18,
                        color: widget.task.isDone
                            ? Colors.black.withOpacity(0.3)
                            : difference > 4
                                ? Colors.green.withOpacity(0.3)
                                : difference > 2
                                    ? Colors.yellow.withOpacity(0.3)
                                    : Colors.red.withOpacity(0.3),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              width: 10,
                              height: 10,
                              color: widget.task.isDone
                                  ? Colors.black
                                  : difference > 4
                                      ? Colors.green
                                      : difference > 2
                                          ? Colors.yellow
                                          : Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      widget.task.isDone ? 'Done' : '${difference} days left',
                      style: GoogleFonts.poppins(color: kDarkGrey),
                    ),
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: isCollapsed
                      ? const Icon(
                          Icons.keyboard_arrow_up_outlined,
                          color: kPrimaryColor,
                        )
                      : const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: kLightGrey,
                        ),
                ),
                children: <Widget>[
                  Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            widget.task.description,
                            style: GoogleFonts.poppins(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
                onExpansionChanged: (bool expanded) {
                  setState(() {
                    isCollapsed = !isCollapsed;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}
