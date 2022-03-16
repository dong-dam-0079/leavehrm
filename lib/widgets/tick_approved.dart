import 'package:flutter/material.dart';

import '../models/leave_request_response.dart';
import '../utils/constant.dart';

class TickApproved extends StatelessWidget {
  const TickApproved({
    Key? key,
    required this.item,
  }) : super(key: key);

  final LeaveRequest item;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Text(
          item.isApproved ? 'Approved' : 'Waiting to Approve',
          style: kTextSmallStyle,
        ),
        decoration: BoxDecoration(
            color: item.isApproved ? kBgApprovedColor : kBgWaitingColor,
            border: Border.all(
                width: 1,
                color: item.isApproved
                    ? kBorderApprovedColor
                    : kBorderWaitingColor),
            borderRadius: BorderRadius.circular(12)),
      )
    ]);
  }
}
