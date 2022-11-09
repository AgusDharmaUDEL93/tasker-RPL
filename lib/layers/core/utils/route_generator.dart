import 'package:flutter/material.dart';
import 'package:tasker/layers/app/views/ui/create_task/create_task_page.dart';
import 'package:tasker/layers/core/utils/constants.dart';
import '../../app/views/ui/home/home_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kHomeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case kCreateTaskRoute:
        return MaterialPageRoute(builder: (_) => const CreateTaskPage());

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
