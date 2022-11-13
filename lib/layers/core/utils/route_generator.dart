import 'package:flutter/material.dart';
import 'package:tasker/layers/core/utils/constants.dart';

class RouteGenerator {
  // static Route<dynamic> generateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case kHomeRoute:
  //       return MaterialPageRoute(builder: (_) => const HomePage());
  //     case kManageTaskRoute:
  //       if (settings.arguments != null) {
  //         final args = settings.arguments as TaskModel;
  //         return MaterialPageRoute(
  //             builder: (context) => ManageTaskPage(task: args));
  //       }
  //       return MaterialPageRoute(builder: (context) => const ManageTaskPage());
  //     case kSearchTaskRoute:
  //       return MaterialPageRoute(builder: (_) => const SearchPage());
  //     default:
  //       return errorRoute();
  //   }
  // }
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
