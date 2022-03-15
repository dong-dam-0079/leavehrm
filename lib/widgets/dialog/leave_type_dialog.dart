import 'package:flutter/material.dart';

import '../../utils/constant.dart';

class LeaveTypeDialog extends StatelessWidget {
  const LeaveTypeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(
                  top: 10, right: 10, left: 10, bottom: 2),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text('Choose your leave type.',
                      style: kTextTitleSmallGreyStyle),
                  line(),
                  buildTextButton(context, 'Full Day Leave Work'),
                  line(),
                  buildTextButton(context, 'Haft Day Leave Work'),
                  line(),
                  buildTextButton(context, 'Time block'),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: double.infinity,
              child: buildTextButton(context, 'Cancel'),
            )
          ],
        ));
  }

  Container line() => Container(width: 250, height: 0.2, color: Colors.grey);

  TextButton buildTextButton(BuildContext context, String type) {
    return TextButton(
        onPressed: () {
          Navigator.pop(context, type);
        },
        child: Text(type, style: const TextStyle(color: Colors.blue)));
  }
}
