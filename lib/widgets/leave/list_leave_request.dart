import 'package:flutter/material.dart';
import 'package:leavehrm/widgets/date_picked.dart';
import 'package:leavehrm/widgets/expand_leave_reason.dart';

import '../../models/leave_request_response.dart';
import '../../utils/constant.dart';
import '../content_listview.dart';
import '../tick_approved.dart';

class ListLeaveRequest extends StatefulWidget {
  final List<LeaveRequest> listRequestLeave;

  const ListLeaveRequest({Key? key, required this.listRequestLeave})
      : super(key: key);

  @override
  State<ListLeaveRequest> createState() => _ListLeaveRequestState();
}

class _ListLeaveRequestState extends State<ListLeaveRequest> {
  @override
  Widget build(BuildContext context) {
    var listData = widget.listRequestLeave;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: listData.length,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        var item = listData[index];

        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DatePicked(),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: LeaveType(item: item)),
                          Expanded(child: TickApproved(item: item))
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: ContentListview(
                        item: item,
                        voidCallback: () {
                          setState(() {
                            item.isExpanded = true;
                          });
                        },
                      ),
                    ),
                    ExpandedLeaveReason(item: item, voidCallback: () {
                      setState(() {
                        item.isExpanded = false;
                      });
                    },)
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class LeaveType extends StatelessWidget {
  const LeaveType({
    Key? key,
    required this.item,
  }) : super(key: key);

  final LeaveRequest item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Leave Type',
          style: kTextTitleSmallGreyStyle,
        ),
        Text(
          item.leaveType,
          style: kTextContentStyleBlack,
        ),
      ],
    );
  }
}
