import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
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

class _TaskCardWidgetState extends State<TaskCardWidget>
    with TickerProviderStateMixin {
  final TaskController taskController = serviceLocator.get<TaskController>();
  bool isCollapsed = false;

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      duration: new Duration(milliseconds: 250),
      vsync: this,
    );

    final CurvedAnimation curve =
        new CurvedAnimation(parent: controller, curve: Curves.easeOut);

    animation = new Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() => setState(() {}));
    controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
              foregroundColor: kSecondaryColor,
              icon: Icons.edit,
              backgroundColor: kMainBackground,
            ),
            SlidableAction(
              onPressed: (context) =>
                  taskController.deleteTask(widget.task.title),
              foregroundColor: kPrimaryColor,
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
            borderRadius: BorderRadius.circular(16),
            child: ListTileTheme(
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              dense: true,
              horizontalTitleGap: 0.0,
              minLeadingWidth: 0,
              child: ExpansionTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: MSHCheckbox(
                        duration: const Duration(milliseconds: 250),
                        size: 30,
                        value: widget.task.isDone,
                        colorConfig:
                            MSHColorConfig.fromCheckedUncheckedDisabled(
                          checkedColor: kPrimaryColor,
                        ),
                        style: MSHCheckboxStyle.fillScaleColor,
                        onChanged: (selected) {
                          controller.forward(from: 0.0);
                          taskController
                              .changeTaskCompletionStatus(widget.task);
                        },
                      ),
                    ),
                  ],
                ),
                collapsedBackgroundColor: kCardBackground,
                backgroundColor: kCardCollapsedBackground,
                collapsedTextColor: kSecondaryColor,
                textColor: kSecondaryColor,
                title: Stack(
                  children: [
                    Text(
                      widget.task.title.trim(),
                      style: GoogleFonts.poppins(
                        color: kSecondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Container(
                        transform: Matrix4.identity()
                          ..scale(animation.value, 1.0),
                        child: Text(
                          widget.task.title.trim(),
                          style: GoogleFonts.poppins(
                            color: Colors.transparent,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            decoration: widget.task.isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            decorationColor: kSecondaryColor,
                            decorationThickness: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                            ? kSecondaryColor.withOpacity(0.3)
                            : difference > 4
                                ? kGreenCardFlag.withOpacity(0.3)
                                : difference > 2
                                    ? kYellowCardFlag.withOpacity(0.3)
                                    : difference >= 0
                                        ? kRedCardFlag.withOpacity(0.3)
                                        : kSecondaryColor.withOpacity(0.3),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              width: 10,
                              height: 10,
                              color: widget.task.isDone
                                  ? kSecondaryColor
                                  : difference > 4
                                      ? kGreenCardFlag
                                      : difference > 2
                                          ? kYellowCardFlag
                                          : difference >= 0
                                              ? kRedCardFlag
                                              : kSecondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      widget.task.isDone
                          ? 'Done'
                          : difference == 0
                              ? 'Today'
                              : (!widget.task.isDone &&
                                      difference >= 0 &&
                                      isCollapsed)
                                  ? '${DateFormat("MMMM").format(widget.task.expirationDate)}, ${widget.task.expirationDate.day}'
                                  : (!widget.task.isDone && difference >= 0)
                                      ? '${difference} days left'
                                      : 'Expired',
                      style: GoogleFonts.poppins(
                        color: kDarkGrey,
                        fontSize: 14,
                      ),
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
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                          child: Text(
                            widget.task.description.trim(),
                            style: GoogleFonts.poppins(
                              color: kSecondaryColor,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
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
