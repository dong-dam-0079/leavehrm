import 'package:flutter/material.dart';
import 'package:leavehrm/utils/date_picked.dart';

import '../../models/leave_request_response.dart';
import '../../utils/constant.dart';
import '../content_listview.dart';
import '../tick_approved.dart';

class ListLeaveRequest extends StatefulWidget {
  final List<Main> listRequestLeave;

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
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          child: buildRow(item)),
                      buildExpandedItem(item)
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Visibility buildExpandedItem(Main item) {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
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
                          onPressed: () {
                            setState(() {
                              item.isExpanded = false;
                            });
                          }),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Row buildRow(Main item) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ContentListview(
          columnTitle1: 'Start',
          columnTitle2: 'Absent Day(s)',
          columnContent1: item.startDay,
          columnContent2: item.absentDay,
        ),
        ContentListview(
          columnTitle1: 'End',
          columnTitle2: 'Status',
          columnContent1: item.endDay,
          columnContent2: item.status,
        ),
        Container(
          width: 60,
          height: 110,
          alignment: Alignment.bottomCenter,
          child: Visibility(
            visible: item.isExpanded ? false : true,
            child: TextButton.icon(
                icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                label: const Text(''),
                onPressed: () {
                  setState(() {
                    item.isExpanded = true;
                  });
                }),
          ),
        ),
      ],
    );
  }
}

class LeaveType extends StatelessWidget {
  const LeaveType({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Main item;

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
