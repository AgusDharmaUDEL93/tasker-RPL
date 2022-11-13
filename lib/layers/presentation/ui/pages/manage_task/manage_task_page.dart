import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasker/layers/core/injector/injector.dart';
import 'package:tasker/layers/core/utils/constants.dart';
import 'package:tasker/layers/domain/entities/task_entity.dart';
import 'package:tasker/layers/presentation/controllers/task_controller.dart';

import '../../widgets/manage_task_datepicker.dart';
import '../../widgets/manage_task_textfield.dart';

class ManageTaskPage extends StatefulWidget {
  const ManageTaskPage({super.key, this.task});

  final TaskEntity? task;

  @override
  State<ManageTaskPage> createState() => _ManageTaskPageState();
}

class _ManageTaskPageState extends State<ManageTaskPage> {
  final _formKey = GlobalKey<FormState>();
  var dateTime = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final TaskController taskController = serviceLocator.get<TaskController>();

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      final task = widget.task!;

      titleController.text = task.title;
      descController.text = task.description;
      refresh(task.expirationDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    isEditing = widget.task != null;
    return Scaffold(
      // appBar: ManageTaskAppBar(title: isEditing ? 'Edit Task' : 'Add Task'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ManageTaskDateWidget(dateTime: dateTime, refresh: refresh),
                  const SizedBox(height: 50),
                  ManageTaskTextFieldWidget(
                      labelText: 'Task Title', controller: titleController),
                  const SizedBox(height: 50),
                  ManageTaskTextFieldWidget(
                      labelText: 'Description', controller: descController),
                  const SizedBox(height: 90),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 90),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      print(dateTime);
                      if (_formKey.currentState!.validate()) {
                        if (isEditing) {
                        } else {
                          taskController.saveTask(
                            TaskEntity(
                              title: titleController.text,
                              description: descController.text,
                              expirationDate: dateTime,
                              isDone: false,
                            ),
                          );
                        }
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      isEditing ? 'Save Task' : 'Create Task',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  refresh(DateTime newTime) {
    setState(() {
      dateTime = newTime;
    });
  }
}
