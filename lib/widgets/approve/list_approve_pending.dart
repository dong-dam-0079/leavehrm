import 'package:flutter/material.dart';
import 'package:leavehrm/models/leave_request_response.dart';
import 'package:leavehrm/widgets/date_picked.dart';
import 'package:leavehrm/widgets/content_listview.dart';
import 'package:leavehrm/widgets/expand_leave_reason.dart';

import '../../utils/constant.dart';

class ListApprovePending extends StatefulWidget {
  final List<LeaveRequest> listRequestForLeader;

  const ListApprovePending({Key? key, required this.listRequestForLeader})
      : super(key: key);

  @override
  _ListApprovePendingState createState() => _ListApprovePendingState();
}

class _ListApprovePendingState extends State<ListApprovePending> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.listRequestForLeader.length,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, index) {
        var item = widget.listRequestForLeader[index];

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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: Row(
                        children: [
                          const Expanded(
                              child: Icon(Icons.account_circle_rounded)),
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Text(
                                item.employeeName ??= '',
                                style: const TextStyle(
                                    fontSize: kTextBigSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  item.department ??= '',
                                  style: const TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      height: 2,
                      color: Color(0xffb1b0b0),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: ContentListview(
                        item: item,
                        voidCallback: () {
                          setState(() {
                            item.isExpanded = true;
                          });
                        },
                      ),
                    ),
                    ExpandedLeaveReason(
                      item: item,
                      voidCallback: () {
                        setState(() {
                          item.isExpanded = false;
                        });
                      },
                    )
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
