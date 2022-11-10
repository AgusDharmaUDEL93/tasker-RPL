import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasker/layers/app/views/ui/widgets/manage_task/manage_task_appbar_widget.dart';
import 'package:tasker/layers/core/utils/constants.dart';

import '../../../models/task/boxes.dart';
import '../../../models/task/task_model.dart';
import '../widgets/home/home_add_first_task_widget.dart';
import '../widgets/home/home_task_card_widget.dart';
import '../widgets/search_task/search_not_found_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String arguments = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPlainWhite,
      appBar: ManageTaskAppBar(title: 'Search Task'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextField(
                onChanged: (string) {
                  setState(() {
                    arguments = string;
                  });
                },
                cursorColor: kDarkBlue,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: kDarkBlue,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: kLightBlue,
                    ),
                  ),
                  hintText: 'Search for a title',
                  hintStyle: GoogleFonts.poppins(
                    color: kDarkGrey,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: kLightBlue,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  isDense: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(
                      'assets/icons/search-icon.svg',
                      color: kDarkGrey,
                    ),
                  ),
                  filled: true,
                  fillColor: kPlainWhite,
                ),
              ),
              const SizedBox(height: 15),
              ValueListenableBuilder<Box<TaskModel>>(
                valueListenable: Boxes.getTasks().listenable(),
                builder: (BuildContext context, dynamic value, Widget? child) {
                  var tasks = value.values
                      .where((item) =>
                          item.title.contains(arguments) ? true : false)
                      .toList();

                  if (tasks != null && tasks.isNotEmpty) {
                    return ListView.separated(
                      physics: const BouncingScrollPhysics(),
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
                  } else if (Boxes.getTasks().isEmpty) {
                    return const AddFirstTaskWidget();
                  } else {
                    return const SearchNotFoundWidget();
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
}
