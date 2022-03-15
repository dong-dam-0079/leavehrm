import 'package:flutter/material.dart';
import 'package:leavehrm/utils/date_picked.dart';

import '../../models/approve_leave_response.dart';
import '../../utils/constant.dart';
import '../../utils/util.dart';

class ListApprovePending extends StatefulWidget {
  final List<LeaveRequestForLeader> listRequestForLeader;

  const ListApprovePending({Key? key, required this.listRequestForLeader})
      : super(key: key);

  @override
  _ListApprovePendingState createState() => _ListApprovePendingState();
}

class _ListApprovePendingState extends State<ListApprovePending> {
  @override
  Widget build(BuildContext context) {
    var listData = widget.listRequestForLeader;

    return ListView.builder(
        shrinkWrap: true,
        itemCount: listData.length,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, index) {
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
                                      item.employeeName,
                                      style: const TextStyle(
                                          fontSize: kTextBigSize,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            item.department,
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          )
                                        ]))
                              ],
                            )),
                        const Divider(
                          height: 2,
                          color: Color(0xffb1b0b0),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 15),
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
                                    Text(Utils.dateFormatFromString(item.startDay),
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
                                    Text(Utils.dateFormatFromString(item.endDay),
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
                                          flex: 3,
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
