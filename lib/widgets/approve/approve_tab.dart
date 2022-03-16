import 'package:flutter/material.dart';
import 'package:leavehrm/models/leave_request_response.dart';
import 'package:leavehrm/utils/constant.dart';
import 'package:leavehrm/widgets/empty_data_widget.dart';
import 'package:leavehrm/widgets/approve/list_approve_pending.dart';

import '../../services/api_services.dart';
import '../bottom_line.dart';

class ApproveTab extends StatefulWidget {
  const ApproveTab({Key? key}) : super(key: key);

  @override
  _ApproveTabState createState() => _ApproveTabState();
}

class _ApproveTabState extends State<ApproveTab> {
  bool isPending = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    TextButton(
                        child: Text('Pending',
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
                        visible: isPending ? true : false, child: const BottomLine())
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                ),
                Column(
                  children: [
                    TextButton(
                        child: Text('Approved',
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
                        visible: isPending ? false : true, child: const BottomLine())
                  ],
                )
              ],
            ),
            FutureBuilder<List<LeaveRequest>>(
                future: isPending
                    ? ApiServices().fetchLeaveRequest(
                        ApiServices.apiPendingLeaveRequestForLeader)
                    : ApiServices().fetchLeaveRequest(
                        ApiServices.apiApprovedLeaveRequestForLeader),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const EmptyData();
                  } else {
                    return ListApprovePending(
                        listRequestForLeader: snapshot.requireData);
                  }
                })
          ],
        )));
  }
}
