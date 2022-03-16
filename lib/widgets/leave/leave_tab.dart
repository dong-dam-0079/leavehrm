import 'package:flutter/material.dart';
import 'package:leavehrm/models/leave_request_response.dart';
import 'package:leavehrm/services/api_services.dart';
import 'package:leavehrm/widgets/empty_data_widget.dart';
import 'package:leavehrm/widgets/leave/list_leave_request.dart';

import '../../utils/constant.dart';

class LeaveTab extends StatefulWidget {
  const LeaveTab({Key? key}) : super(key: key);

  @override
  _LeaveTabState createState() => _LeaveTabState();
}

class _LeaveTabState extends State<LeaveTab> {
  bool isPending = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    TextButton(
                        child: Text('Upcoming',
                            style: TextStyle(
                                fontSize: kTextSize,
                                color: isPending ? kBlueColor : Colors.grey,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          setState(() {
                            isPending = true;
                          });
                        }),
                    Visibility(
                        visible: isPending ? true : false,
                        child: Container(
                          width: 60,
                          height: 5,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              color: kBlueColor),
                        ))
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                        child: Text('History',
                            style: TextStyle(
                                fontSize: kTextSize,
                                color: !isPending ? kBlueColor : Colors.grey,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          setState(() {
                            isPending = false;
                          });
                        }),
                    Visibility(
                        visible: isPending ? false : true,
                        child: Container(
                          width: 60,
                          height: 5,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              color: kBlueColor),
                        ))
                  ],
                )
              ],
            ),
            FutureBuilder<List<LeaveRequest>>(
                future: isPending
                    ? ApiServices().fetchLeaveRequest(ApiServices.apiLeaveRequest)
                    : ApiServices().fetchLeaveRequest(ApiServices.apiLeaveHistory),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const EmptyData();
                  } else {
                    return ListLeaveRequest(
                        listRequestLeave: snapshot.requireData);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
