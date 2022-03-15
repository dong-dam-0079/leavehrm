import 'package:flutter/material.dart';

import '../utils/constant.dart';
import '../utils/util.dart';

class ContentListview extends StatelessWidget {
  final String columnTitle1, columnTitle2, columnContent1, columnContent2;

  const ContentListview({
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