import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasker/layers/presentation/controllers/task_controller.dart';
import 'package:tasker/layers/presentation/ui/pages/home/components/home_task_list_builder.dart';
import 'package:tasker/layers/presentation/ui/widgets/task_card_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/injector/injector.dart';
import '../../../../../core/utils/constants.dart';
import '../../../widgets/add_first_task_widget.dart';
import '../components/home_appbar.dart';

List<String> contents = [
  'All tasks',
  'Completed',
  'Incomplete',
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final TaskController taskController = serviceLocator.get<TaskController>();

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        onPressed: () {
          Navigator.pushNamed(context, kManageTaskRoute)
              .then((value) => setState(() {}));
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tasks',
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _handleFABPressed();
                      },
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kPrimaryColor,
                        ),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                contents[currentIndex],
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: kMainBackground,
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                                child: Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: kMainBackground,
                                ),
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                TaskListBuilder(currentIndex: currentIndex),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleFABPressed() {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return CustomBottomSheetWidget(
          child: Column(
            children: [
              _buildListItem(
                context,
                title: contents[0],
                leading: SvgPicture.asset(
                  'assets/icons/list-icon.svg',
                  height: 26,
                  width: 26,
                ),
              ),
              _buildListItem(
                context,
                title: contents[1],
                leading: SvgPicture.asset(
                  'assets/icons/checked-icon.svg',
                  height: 26,
                  width: 26,
                ),
              ),
              _buildListItem(
                context,
                title: contents[2],
                leading: SvgPicture.asset(
                  'assets/icons/unchecked-icon.svg',
                  height: 26,
                  width: 26,
                  color: kSecondaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListItem(
    BuildContext context, {
    String? title,
    Widget? leading,
  }) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = contents.indexOf(title.toString());
        });
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: theme.dividerColor,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (leading != null) leading,
            if (title != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: DefaultTextStyle(
                  child: Text(title),
                  style: GoogleFonts.poppins(
                    color: kSecondaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomSheetWidget extends StatelessWidget {
  const CustomBottomSheetWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: kCardBackground,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHandle(context),
          child,
        ],
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    final theme = Theme.of(context);

    return FractionallySizedBox(
      widthFactor: 0.25,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: theme.dividerColor,
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }
}
