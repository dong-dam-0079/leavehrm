import 'package:flutter/material.dart';
import 'package:leavehrm/screens/leave_screen.dart';
import 'package:leavehrm/screens/timesheet_screen.dart';
import 'package:leavehrm/widgets/timesheet/timesheet_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(backgroundColor: Colors.white), home: const SafeArea(child: NavigateButton()));
  }
}

class NavigateButton extends StatelessWidget {
  const NavigateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Column(
        children: [
          navigationButton(context, const LeaveScreen(), 'Leave Screen'),
          navigationButton(context, const TimeSheetScreen(), 'Timesheet Screen'),
        ],
      ),
    )) ;
  }

  TextButton navigationButton(
      BuildContext context, Widget screen, String nameButton) {
    return TextButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen)),
        child: Text(nameButton));
  }
}
