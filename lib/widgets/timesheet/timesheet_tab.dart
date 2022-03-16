import 'package:flutter/material.dart';
import 'package:leavehrm/models/timesheet_response.dart';
import 'package:leavehrm/services/api_services.dart';

import '../../utils/constant.dart';
import '../circle_progress_bar.dart';
import '../date_picked.dart';
import '../empty_data_widget.dart';
import 'list_timesheet.dart';

class TimeSheetTab extends StatefulWidget {
  const TimeSheetTab({Key? key}) : super(key: key);

  @override
  _TimeSheetTabState createState() => _TimeSheetTabState();
}

class _TimeSheetTabState extends State<TimeSheetTab> {
  bool isSelectedWeekly = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const DatePicked(),
                const CircleProgress(),
                const RowInfo(
                    color1: Colors.red,
                    info2: 'Remote Work',
                    color2: Colors.blue,
                    info1: 'Missed Work'),
                const RowInfo(
                    color1: Color(-15798617),
                    info2: 'Unpaid Leave',
                    color2: Color(0xf2fcbd06),
                    info1: 'Paid Leave'),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 32,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: isSelectedWeekly
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: kBlueColor)
                                  : null,
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isSelectedWeekly = true;
                                    });
                                  },
                                  child: Text("Weekly",
                                      style: isSelectedWeekly
                                          ? const TextStyle(color: Colors.white)
                                          : const TextStyle(
                                              color: kBlueColor)))),
                          Container(
                              height: 32,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: !isSelectedWeekly
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: kBlueColor)
                                  : null,
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isSelectedWeekly = false;
                                    });
                                  },
                                  child: Text("Monthly",
                                      style: !isSelectedWeekly
                                          ? const TextStyle(color: Colors.white)
                                          : const TextStyle(
                                              color: kBlueColor)))),
                        ])),
                Visibility(
                    visible: isSelectedWeekly ? true : false,
                    child: Container(
                        margin:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.arrow_left),
                              Text(
                                '14/03/2022 ~ 18/03/2022',
                                textAlign: TextAlign.center,
                                style: kTextSmallTitleStyleBlue,
                              ),
                              Icon(Icons.arrow_right)
                            ]))),
                FutureBuilder<List<Timesheet>>(
                    future:
                        ApiServices().fetchTimesheet(ApiServices.apiTimesheet),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const EmptyData();
                      } else {
                        return ListTimesheet(
                            listTimesheet: snapshot.requireData);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RowInfo extends StatelessWidget {
  final Color color1;
  final String info1;
  final Color color2;
  final String info2;

  const RowInfo(
      {Key? key,
      required this.color1,
      required this.info1,
      required this.color2,
      required this.info2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: GeneralityInfo(info: info1, color: color1)),
        Expanded(child: GeneralityInfo(info: info2, color: color2))
      ],
    );
  }
}

class GeneralityInfo extends StatelessWidget {
  final Color color;
  final String info;

  const GeneralityInfo({Key? key, required this.color, required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('0 ', style: TextStyle(color: color, fontSize: kTextBigSize)),
            Text(info, style: kTextSmallStyle)
          ],
        ));
  }
}
