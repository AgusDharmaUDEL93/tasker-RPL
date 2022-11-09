import 'package:flutter/material.dart';
import 'package:tasker/layers/core/utils/constants.dart';
import 'package:tasker/layers/core/utils/route_generator.dart';

void main() {
  runApp(const TaskerApp());
}

class TaskerApp extends StatelessWidget {
  const TaskerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasker',
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: kHomeRoute,
    );
  }
}

// * Task variables: title, description, expirationDate
// ? create entity/model

// * Tasks can NOT have the same title
// ? maybe using shared_preferences, check if the user's device data already
// ? contains a key with title used

// * Each task will have a subtitle telling the user how many days are left
// * until the card is expired.
// * The subtitle has to have colors for:
// *    if difference(DateTime.now, expirationDate) >= 7 days => Colors.green
// *    if difference(DateTime.now, expirationDate) <= 4 days and > 2 days => Colors.yellow
// *    if difference(DateTime.now, expirationDate) <= 2 days => Colors.red
// ? maybe use DateTime
// ? https://stackoverflow.com/questions/52713115/flutter-find-the-number-of-days-between-two-dates

// * User can filter the tasks using 'title'
// ? for title, look in shared_preferences user data if title contains the input string,
// ? if there is one or more, then return a list.
// * User can filter the tasks using 'date range'
// ? for the date, use DateTimeRange
// ? https://stackoverflow.com/questions/70894726/how-to-filter-items-consisting-within-a-date-range-from-datea-to-dateb-in-flut

// * User can edit existing tasks

// * User can delete tasks

// * The task data must be saved on cache (using shared_preferences, hive, etc)

// * Implement Dark Mode