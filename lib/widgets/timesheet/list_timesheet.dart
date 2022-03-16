import 'package:flutter/material.dart';

import '../../utils/constant.dart';

class ListTimesheet extends StatefulWidget {
  const ListTimesheet({Key? key}) : super(key: key);

  @override
  _ListTimesheetState createState() => _ListTimesheetState();
}

class _ListTimesheetState extends State<ListTimesheet> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, index) => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Today, 05 March 2022',
                style: TextStyle(color: Colors.grey, fontSize: kTextSmallSize)),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Checkin', style: kTextTitleSmallGreyStyle),
                            const Text('08:30 AM',
                                style: kTextContentStyleBlack),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                            ),
                            const Text('Total hours worked',
                                style: TextStyle(color: Colors.grey)),
                            const Text('08:30', style: kTextContentStyleBlack)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Checkout', style: kTextTitleSmallGreyStyle),
                            Text('-', style: kTextContentStyleBlack)
                          ],
                        ),
                        const Icon(Icons.circle)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
