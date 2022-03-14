import 'package:flutter/material.dart';
import 'package:leavehrm/utils/constant.dart';

import '../widgets/approve/approve_tab.dart';
import '../widgets/dialog/confirm_dialog.dart';
import '../widgets/leave/leave_tab.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({Key? key}) : super(key: key);

  @override
  _LeaveScreenState createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  String leaveType = 'Pick your leave type';
  String leaveReason = 'Pick your leave reason';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, top: 10.0, bottom: 5.0, right: 0.0),
                  child: Column(children: [
                    Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Expanded(
                                        child: BackButton(onPressed: null)),
                                    Expanded(
                                        flex: 3,
                                        child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            padding: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                                color: const Color(-1261515058),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: TabBar(
                                              indicator: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              labelColor: Colors.black,
                                              unselectedLabelColor: Colors.grey,
                                              tabs: const [
                                                Tab(text: 'Leave'),
                                                Tab(text: 'Approve')
                                              ],
                                            ))),
                                    Expanded(
                                        child: IconButton(
                                            onPressed: () =>
                                                showDialogDatePicker(),
                                            icon: const Icon(
                                                Icons.add_box_outlined)))
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
                  ]))),
        ));
  }

  void showDialogDatePicker() => showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.92,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel', style: kTextButtonDialogStyle)),
                const Text(
                  'Create Leave Plan',
                  style: kTextTitleStyleBlack,
                ),
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => const ConfirmDialog());
                    },
                    child: const Text('Submit', style: kTextButtonDialogStyle))
              ]),
              const Divider(
                height: 10,
                color: Colors.grey,
              ),
              Expanded(
                  child: SingleChildScrollView(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Leave Type', style: kTextTitleSmallBlackStyle),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(right: 10, top: 5),
                            child: Icon(Icons.arrow_drop_down)),
                        Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.only(
                                top: 3, bottom: 3, left: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            child: TextButton(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(leaveType,
                                      style: kTextContentStyleBlack)),
                              onPressed: () {},
                            ))
                      ],
                    ),
                    Visibility(
                        visible: false,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Start',
                                    style: kTextTitleSmallBlackStyle),
                                Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextButton.icon(
                                      icon: const Text('Pick start date',
                                          style: kTextContentStyleGrey),
                                      label: const Icon(
                                          Icons.calendar_today_outlined),
                                      onPressed: null),
                                )
                              ],
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(right: 2.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Time start',
                                    style: kTextTitleSmallBlackStyle),
                                Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextButton.icon(
                                      icon: const Text('Pick start date',
                                          style: kTextContentStyleGrey),
                                      label: const Icon(
                                          Icons.calendar_today_outlined),
                                      onPressed: null),
                                )
                              ],
                            ),
                          )),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 2.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Time End',
                                    style: kTextTitleSmallBlackStyle),
                                Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextButton.icon(
                                      icon: const Text('Pick start date',
                                          style: kTextContentStyleGrey),
                                      label: const Icon(
                                          Icons.calendar_today_outlined),
                                      onPressed: null),
                                )
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text('Leave Reason',
                            style: kTextTitleSmallBlackStyle)),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.arrow_drop_down)),
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.only(
                                top: 3, bottom: 3, left: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            child: TextButton(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(leaveReason,
                                      style: kTextContentStyleBlack)),
                              onPressed: () {},
                            ))
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 10),
                        child: Text('Notes', style: kTextTitleSmallBlackStyle)),
                    const TextField(
                      maxLines: 5,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    )
                  ],
                ),
              )),
            ],
          ),
        );
      });
}
