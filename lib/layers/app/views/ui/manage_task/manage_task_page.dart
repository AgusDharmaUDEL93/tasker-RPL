import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasker/layers/app/models/task/task_model.dart';
import 'package:tasker/layers/app/views/ui/widgets/manage_task/manage_task_appbar_widget.dart';
import 'package:tasker/layers/app/views/ui/widgets/manage_task/manage_task_textfield.dart';
import 'package:tasker/layers/core/utils/constants.dart';
import '../../../models/task/boxes.dart';
import '../widgets/manage_task/manage_task_datepicker_field.dart';

class ManageTaskPage extends StatefulWidget {
  const ManageTaskPage({super.key, this.task});

  final TaskModel? task;

  @override
  State<ManageTaskPage> createState() => _ManageTaskPageState();
}

class _ManageTaskPageState extends State<ManageTaskPage> {
  final _formKey = GlobalKey<FormState>();
  var dateTime = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

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
      appBar: ManageTaskAppBar(title: isEditing ? 'Edit Task' : 'Add Task'),
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
                      backgroundColor: kDarkBlue,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 90),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (isEditing) {
                          editTask(
                            widget.task!,
                            titleController.text,
                            descController.text,
                            dateTime,
                          );
                        } else {
                          addTask(
                            titleController.text,
                            descController.text,
                            dateTime,
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

  addTask(String title, String desc, DateTime expirationDate) {
    final task = TaskModel()
      ..title = title
      ..description = desc
      ..expirationDate = expirationDate
      ..isDone = false;

    final box = Boxes.getTasks();

    box.add(task);
  }

  editTask(TaskModel task, String title, String desc, DateTime expirationDate) {
    task.title = title;
    task.description = desc;
    task.expirationDate = expirationDate;
    task.isDone = task.isDone;

    task.save();
  }
}
