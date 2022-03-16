import 'package:flutter/material.dart';
import 'package:leavehrm/widgets/approve/approve_tab.dart';
import 'package:leavehrm/widgets/tab_view.dart';
import 'package:leavehrm/widgets/timesheet/timesheet_tab.dart';

class TimeSheetScreen extends StatefulWidget {
  const TimeSheetScreen({Key? key}) : super(key: key);

  @override
  _TimeSheetScreenState createState() => _TimeSheetScreenState();
}

class _TimeSheetScreenState extends State<TimeSheetScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 0.0, top: 10.0, bottom: 5.0, right: 0.0),
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      children: const [
                        Expanded(
                          flex: 2,
                          child: TabView(
                              tabName1: 'Timesheet',
                              tabName2: 'Request',
                              marginHorizontal: 90.0),
                        ),
                        Expanded(
                            flex: 1,
                            child: Divider(color: Colors.grey, height: 10))
                      ],
                    )),
                const Expanded(
                  flex: 20,
                  child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[TimeSheetTab(), ApproveTab()]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
