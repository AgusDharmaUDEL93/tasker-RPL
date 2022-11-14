import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasker/layers/core/injector/injector.dart';
import 'package:tasker/layers/core/utils/constants.dart';
import 'package:tasker/layers/presentation/controllers/task_controller.dart';
import 'package:tasker/layers/presentation/ui/pages/search_task/components/custom_searchbar.dart';

import '../../../widgets/add_first_task_widget.dart';
import '../../../widgets/custom_appbar_widget.dart';
import '../../../widgets/task_card_widget.dart';

class SearchTaskPage extends StatefulWidget {
  const SearchTaskPage({super.key});

  @override
  State<SearchTaskPage> createState() => _SearchTaskPageState();
}

class _SearchTaskPageState extends State<SearchTaskPage> {
  final TaskController taskController = serviceLocator.get<TaskController>();
  String arguments = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackground,
      appBar: const CustomAppBarWidget(title: 'Search Task'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomSearchBar(refresh: refresh),
              const SizedBox(height: 15),
              AnimatedBuilder(
                animation: taskController,
                builder: (BuildContext context, Widget? child) {
                  var tasks = taskController.filterTasksByTitle(arguments);

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
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  refresh(String string) {
    setState(() {
      arguments = string;
    });
  }
}
