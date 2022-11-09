import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasker/layers/app/views/ui/widgets/create_task/create_task_appbar_widget.dart';
import 'package:tasker/layers/app/views/ui/widgets/create_task/create_task_task_textfield.dart';
import 'package:tasker/layers/core/utils/constants.dart';
import '../widgets/create_task/create_task_datepicker_field.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  var dateTime = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreateTaskAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 30,
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CreateTaskDateWidget(dateTime: dateTime),
                const SizedBox(height: 50),
                CreateTaskTextFieldWidget(
                  labelText: 'Task Title',
                  controller: titleController,
                ),
                const SizedBox(height: 50),
                CreateTaskTextFieldWidget(
                  labelText: 'Description',
                  controller: descController,
                ),
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
                  onPressed: () {},
                  child: Text(
                    'Create Task',
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
    );
  }
}
