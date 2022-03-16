import 'package:flutter/material.dart';
import 'package:leavehrm/utils/util.dart';
import 'package:leavehrm/widgets/dialog/leave_type_dialog.dart';

import '../../utils/constant.dart';
import 'confirm_dialog.dart';

class AddLeaveRequestDialog extends StatefulWidget {
  const AddLeaveRequestDialog({Key? key}) : super(key: key);

  @override
  _AddLeaveRequestDialogState createState() => _AddLeaveRequestDialogState();
}

class _AddLeaveRequestDialogState extends State<AddLeaveRequestDialog> {
  String leaveType = 'Pick your leave type';
  String leaveReason = 'Pick your leave reason';

  String startDate = 'Pick start date';
  String endDate = 'Pick end date';

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.92,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBarBottomSheet(context),
          const Divider(
            height: 10,
            color: Colors.grey,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Leave Type', style: kTextTitleSmallBlackStyle),
                  buttonSelectLeave(context, 1),
                  Visibility(
                    visible: false,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: FractionallySizedBox(
                        widthFactor: 0.5,
                        child: buttonSelectDate(context, 'Start', 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 2.5),
                            child: buttonSelectDate(context, 'Time Start', 1),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2.5),
                            child: buttonSelectDate(context, 'Time End', 2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text('Leave Reason',
                          style: kTextTitleSmallBlackStyle)),
                  buttonSelectLeave(context, 2),
                  const Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 10),
                      child: Text('Notes', style: kTextTitleSmallBlackStyle)),
                  const TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonSelectLeave(BuildContext context, int key) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        const Padding(
            padding: EdgeInsets.only(right: 10, top: 5),
            child: Icon(Icons.arrow_drop_down)),
        Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.only(top: 3, bottom: 3, left: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              child: Text(key == 1 ? leaveType : leaveReason,
                  style: kTextContentStyleBlack),
              style: const ButtonStyle(alignment: Alignment.centerLeft),
              onPressed: () {
                _onShowDiaLogLeaveType(context, key);
              },
            ))
      ],
    );
  }

  Widget buttonSelectDate(BuildContext context, String title, int key) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: kTextTitleSmallBlackStyle),
        Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(20)),
          child: TextButton.icon(
            icon: Text(key == 1 ? startDate : endDate,
                style: kTextContentStyleGrey),
            label: const Icon(Icons.calendar_today_outlined),
            onPressed: () => _onSelectStartDate(context, key),
          ),
        )
      ],
    );
  }

  Widget appBarBottomSheet(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel', style: kTextButtonDialogStyle)),
      const Text(
        'Create Leave Plan',
        style: kTextTitleStyleBlack,
      ),
      TextButton(
          onPressed: () {
            _onConfirmDialog(context);
          },
          child: const Text('Submit', style: kTextButtonDialogStyle))
    ]);
  }

  Future<dynamic> _onShowDiaLogLeaveType(BuildContext context, int key) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return const LeaveTypeDialog();
        }).then((value) {
      switch (key) {
        case 1:
          setState(() {
            leaveType = value;
          });
          break;
        case 2:
          setState(() {
            leaveReason = value;
          });
          break;
      }
    });
  }

  void _onConfirmDialog(BuildContext context) {
    showDialog(context: context, builder: (_) => const ConfirmDialog())
        .then((value) {
      if (value = true) {
        Navigator.pop(context);
      }
    });
  }

  Future _onSelectStartDate(BuildContext context, int key) async {
    await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2015),
            lastDate: DateTime(2030))
        .then(
      (value) {
        if (value != null) {
          switch (key) {
            case 1:
              setState(() {
                startDate = Utils.dateFormatFromDate(value);
              });
              break;
            case 2:
              setState(() {
                endDate = Utils.dateFormatFromDate(value);
              });
              break;
          }
        }
      },
    );
  }
}
