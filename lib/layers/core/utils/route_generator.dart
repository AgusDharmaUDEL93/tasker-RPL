import 'package:flutter/material.dart';
import 'package:tasker/layers/core/utils/constants.dart';
import 'package:tasker/layers/presentation/ui/pages/manage_task/manage_task_page.dart';
import '../../presentation/ui/pages/home/home_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kHomeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case kManageTaskRoute:
        return MaterialPageRoute(builder: (_) => const ManageTaskPage());
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
