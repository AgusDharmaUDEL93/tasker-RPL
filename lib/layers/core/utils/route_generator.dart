import 'package:flutter/material.dart';
import 'package:tasker/layers/app/models/task/task_model.dart';
import 'package:tasker/layers/app/views/ui/manage_task/manage_task_page.dart';
import 'package:tasker/layers/core/utils/constants.dart';
import '../../app/views/ui/home/home_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kHomeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case kManageTaskRoute:
        if (settings.arguments != null) {
          final args = settings.arguments as TaskModel;
          return MaterialPageRoute(
              builder: (context) => CreateTaskPage(task: args));
        }
        return MaterialPageRoute(builder: (context) => const CreateTaskPage());
      default:
        return errorRoute();
    }
  }
}

MaterialPageRoute errorRoute() {
  return MaterialPageRoute(
    builder: (_) => const Scaffold(
      body: Center(
        child: Text('No route defined'),
      ),
    ),
  );
}
