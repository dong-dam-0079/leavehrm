import 'package:flutter/material.dart';
import 'package:leavehrm/models/leave_request_response.dart';

import '../utils/constant.dart';
import '../utils/util.dart';

class ContentListview extends StatelessWidget {
  final VoidCallback voidCallback;
final LeaveRequest item;

const ContentListview(
    {Key? key, required this.item, required this.voidCallback})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var item = main;

    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Content(
          columnTitle1: 'Start',
          columnTitle2: 'Absent Day(s)',
          columnContent1: item.startDay,
          columnContent2: item.absentDay,
        ),
        Content(
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
                onPressed: voidCallback),
          ),
        ),
      ],
    );
  }
}


class Content extends StatelessWidget {
  final String columnTitle1, columnTitle2, columnContent1, columnContent2;

  const Content({
    Key? key,
    required this.columnTitle1,
    required this.columnTitle2,
    required this.columnContent1,
    required this.columnContent2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(columnTitle1, style: kTextTitleSmallGreyStyle),
        Text(Utils.dateFormatFromString(columnContent1),
            style: kTextContentStyleBlack),
        Container(
          margin: const EdgeInsets.only(top: 20),
        ),
        Text(columnTitle2, style: kTextTitleSmallGreyStyle),
        Text(columnContent2, style: kTextContentStyleBlack)
      ],
    );
  }
}
