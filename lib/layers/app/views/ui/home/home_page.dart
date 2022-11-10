import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasker/layers/app/views/ui/widgets/home/home_add_first_task_widget.dart';
import 'package:tasker/layers/app/views/ui/widgets/home/home_appbar_widget.dart';
import 'package:tasker/layers/app/views/ui/widgets/home/home_task_card_widget.dart';
import '../../../../core/utils/constants.dart';
import '../../../models/task/boxes.dart';
import '../../../models/task/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    Hive.box('taskmodel').close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            kManageTaskRoute,
          );
        },
        elevation: 0,
        backgroundColor: kDarkBlue,
        child: SvgPicture.asset('assets/icons/add-icon.svg'),
      ),
      backgroundColor: Colors.white,
      appBar: HomeAppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'In Progress',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: kDarkBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15),
                ValueListenableBuilder<Box<TaskModel>>(
                  valueListenable: Boxes.getTasks().listenable(),
                  builder:
                      (BuildContext context, dynamic value, Widget? child) {
                    final tasks = value.values.toList().cast<TaskModel>();
                    if (tasks != null && tasks.isNotEmpty) {
                      return ListView.separated(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: tasks.length,
                        itemBuilder: (BuildContext context, int index) {
                          final task = tasks[index];
                          return HomeTaskCardWidget(task: task);
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 12);
                        },
                      );
                    } else {
                      return const AddFirstTaskWidget();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
