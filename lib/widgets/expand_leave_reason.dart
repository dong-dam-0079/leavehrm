import 'package:flutter/material.dart';

import '../models/leave_request_response.dart';
import '../utils/constant.dart';

class ExpandedLeaveReason extends StatelessWidget {
  final VoidCallback voidCallback;
  final LeaveRequest item;

  const ExpandedLeaveReason(
      {Key? key, required this.item, required this.voidCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: item.isExpanded ? true : false,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(height: 15, color: Colors.grey),
            const Text(
              'Leave Reason Type',
              style: kTextTitleSmallGreyStyle,
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 5, top: 5),
                child: Text(
                  item.leaveReason,
                  style: kTextContent,
                )),
            Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Icon(Icons.article))),
                Expanded(
                    flex: 4,
                    child: Text(
                      item.notes,
                      maxLines: 3,
                      style: kSmallTextContent,
                    )),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: TextButton.icon(
                        icon: const Icon(Icons.arrow_drop_up,
                            color: Colors.black),
                        label: const Text(''),
                        onPressed: voidCallback),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
