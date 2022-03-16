import 'package:flutter/material.dart';
import 'package:leavehrm/widgets/dialog/add_leave_request_dialog.dart';

import '../widgets/approve/approve_tab.dart';
import '../widgets/leave/leave_tab.dart';
import '../widgets/tab_view.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({Key? key}) : super(key: key);

  @override
  _LeaveScreenState createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
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
                      children: [
                        Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: BackButton(
                                        onPressed: () =>
                                            Navigator.pop(context))),
                                 const Expanded(
                                  flex: 3,
                                  child: TabView(
                                    tabName1: 'Leave',
                                    tabName2: 'Approve',
                                    marginHorizontal: 20,
                                  ),
                                ),
                                Expanded(
                                    child: IconButton(
                                        onPressed: () => showModalBottomSheet(
                                            context: context,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            isScrollControlled: true,
                                            builder: (context) {
                                              return const AddLeaveRequestDialog();
                                            }),
                                        icon:
                                            const Icon(Icons.add_box_outlined)))
                              ],
                            )),
                        const Expanded(
                            flex: 1,
                            child: Divider(color: Colors.grey, height: 10))
                      ],
                    )),
                const Expanded(
                    flex: 20,
                    child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[LeaveTab(), ApproveTab()]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
