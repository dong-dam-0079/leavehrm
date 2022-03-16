import 'package:flutter/material.dart';
import 'package:leavehrm/models/timesheet_response.dart';

import '../../utils/constant.dart';
import '../../utils/util.dart';

class ListTimesheet extends StatefulWidget {
  final List<Timesheet> listTimesheet;

  const ListTimesheet({Key? key, required this.listTimesheet})
      : super(key: key);

  @override
  _ListTimesheetState createState() => _ListTimesheetState();
}

class _ListTimesheetState extends State<ListTimesheet> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.listTimesheet.length,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, index) {
          var item = widget.listTimesheet[index];
          var itemDate = Utils.dateFormatFromString(item.date);

          return Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(checkDateToday(itemDate),
                    style: const TextStyle(
                        color: Colors.grey, fontSize: kTextSmallSize)),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Checkin',
                                    style: kTextTitleSmallGreyStyle),
                                Text(item.checkin,
                                    style: kTextContentStyleBlack),
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                ),
                                const Text('Total hours worked',
                                    style: TextStyle(color: Colors.grey)),
                                Text(item.totalHours,
                                    style: kTextContentStyleBlack)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Checkout',
                                    style: kTextTitleSmallGreyStyle),
                                Text(item.checkout,
                                    style: kTextContentStyleBlack)
                              ],
                            ),
                            const Icon(Icons.circle)
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  String checkDateToday(String date) {
    if (date == Utils.dateFormatFromDate(DateTime.now())) {
      return 'Today, $date';
    }
    return date;
  }
}
