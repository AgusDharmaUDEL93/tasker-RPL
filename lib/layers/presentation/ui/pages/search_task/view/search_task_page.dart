import 'package:flutter/material.dart';
import 'package:tasker/layers/core/injector/injector.dart';
import 'package:tasker/layers/core/utils/constants.dart';
import 'package:tasker/layers/presentation/controllers/task_controller.dart';
import 'package:tasker/layers/presentation/ui/pages/search_task/components/search_custom_searchbar.dart';
import 'package:tasker/layers/presentation/ui/pages/search_task/components/search_datarange_reset_button.dart';
import 'package:tasker/layers/presentation/ui/pages/search_task/components/search_task_list_builder.dart';

import '../../../widgets/custom_appbar_widget.dart';

class SearchTaskPage extends StatefulWidget {
  const SearchTaskPage({super.key});

  @override
  State<SearchTaskPage> createState() => _SearchTaskPageState();
}

class _SearchTaskPageState extends State<SearchTaskPage> {
  final TaskController taskController = serviceLocator.get<TaskController>();
  DateTime? startDate;
  DateTime? endDate;
  String arguments = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackground,
      appBar: CustomAppBarWidget(
        title: 'Search Task',
        trailing: DataRangeResetButton(
          refresh: refresh,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomSearchBar(
                refresh: refresh,
                startDate: startDate,
                endDate: endDate,
              ),
              const SizedBox(height: 15),
              SearchTaskListBuilder(
                arguments: arguments,
                startDate: startDate,
                endDate: endDate,
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  refresh(String string, {DateTime? firstDate, DateTime? secondDate}) {
    setState(() {
      arguments = string;

      startDate = firstDate;
      endDate = secondDate;
    });
  }
}
