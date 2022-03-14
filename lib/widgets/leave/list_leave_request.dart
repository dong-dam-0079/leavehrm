import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:leavehrm/utils/date_picked.dart';
import 'package:leavehrm/utils/util.dart';

import '../../models/leave_request_response.dart';
import '../../utils/constant.dart';

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
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  ),
                                ),
                                Expanded(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                      Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 5),
                                          child: Text(
                                            item.isApproved
                                                ? 'Approved'
                                                : 'Waiting to Approve',
                                            style: kTextSmallStyle,
                                          ),
                                          decoration: BoxDecoration(
                                              color: item.isApproved
                                                  ? kBgApprovedColor
                                                  : kBgWaitingColor,
                                              border: Border.all(
                                                  width: 1,
                                                  color: item.isApproved
                                                      ? kBorderApprovedColor
                                                      : kBorderWaitingColor),
                                              borderRadius:
                                                  BorderRadius.circular(12)))
                                    ]))
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Start',
                                        style: kTextTitleSmallGreyStyle),
                                    Text(Utils.dateFormat(item.startDay),
                                        style: kTextContentStyleBlack),
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                    ),
                                    const Text('Absent Day(s)',
                                        style: kTextTitleSmallGreyStyle),
                                    Text(item.absentDay,
                                        style: kTextContentStyleBlack)
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('End',
                                        style: TextStyle(color: Colors.grey)),
                                    Text(Utils.dateFormat(item.endDay),
                                        style: kTextContentStyleBlack),
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                    ),
                                    const Text('Status',
                                        style: kTextTitleSmallGreyStyle),
                                    Text(item.status,
                                        style: kTextContentStyleBlack)
                                  ],
                                ),
                                Container(
                                    width: 60,
                                    height: 110,
                                    alignment: Alignment.bottomCenter,
                                    child: Visibility(
                                      visible: item.isExpanded ? false : true,
                                      child: TextButton.icon(
                                          icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black),
                                          label: const Text(''),
                                          onPressed: () {
                                            setState(() {
                                              item.isExpanded = true;
                                            });
                                          }),
                                    ))
                              ],
                            )),
                        Visibility(
                            visible: item.isExpanded ? true : false,
                            child:
                                const Divider(height: 15, color: Colors.grey)),
                        Visibility(
                            visible: item.isExpanded ? true : false,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Leave Reason Type',
                                    style: kTextTitleSmallGreyStyle,
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 5, top: 5),
                                      child: Text(
                                        item.leaveReason,
                                        style: kTextContent,
                                      )),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              child:
                                                  const Icon(Icons.article))),
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
                                                  icon: const Icon(
                                                      Icons.arrow_drop_up,
                                                      color: Colors.black),
                                                  label: const Text(''),
                                                  onPressed: () {
                                                    setState(() {
                                                      item.isExpanded = false;
                                                    });
                                                  })))
                                    ],
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ));
        });
  }
}
