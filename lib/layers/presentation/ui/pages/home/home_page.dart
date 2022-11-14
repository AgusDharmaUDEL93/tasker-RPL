import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasker/layers/domain/entities/task_entity.dart';
import 'package:tasker/layers/presentation/controllers/task_controller.dart';
import 'package:tasker/layers/presentation/ui/widgets/task_card_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/injector/injector.dart';
import '../../../../core/utils/constants.dart';
import '../../widgets/home_add_first_task_widget.dart';
import '../../widgets/home_appbar_widget.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, kManageTaskRoute).then((value) => setState(() {}));
        },
        elevation: 0,
        backgroundColor: kPrimaryColor,
        child: SvgPicture.asset('assets/icons/add-icon.svg'),
      ),
      backgroundColor: kMainBackground,
      appBar: const HomeAppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'In Progress',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),
                AnimatedBuilder(
                  animation: taskController,
                  builder: (context, child) {
                    if (taskController.tasksList.isNotEmpty) {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: taskController.tasksList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return TaskCardWidget(
                              task: taskController.tasksList[index]);
                        },
                      );
                    }
                    return const AddFirstTaskWidget();
                  },
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
