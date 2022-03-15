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

  String startDate = 'Pick start date';
  String endDate = 'Pick end date';

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.92,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRow(context),
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
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(right: 10, top: 5),
                        child: Icon(Icons.arrow_drop_down)),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding:
                          const EdgeInsets.only(top: 3, bottom: 3, left: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child:
                                Text(leaveType, style: kTextContentStyleBlack),
                          ),
                          onPressed: () => showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) {
                                    return const LeaveTypeDialog();
                                  }).then((value) {
                                setState(() {
                                  leaveType = value;
                                });
                              })),
                    )
                  ],
                ),
                Visibility(
                  visible: true,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      child: buttonSelectDate(context, 'Start', startDate),
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
                          child: buttonSelectDate(
                              context, 'Time Start', startDate),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2.5),
                          child: buttonSelectDate(context, 'Time End', endDate),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child:
                        Text('Leave Reason', style: kTextTitleSmallBlackStyle)),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.arrow_drop_down)),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding:
                            const EdgeInsets.only(top: 3, bottom: 3, left: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("leaveReason",
                                  style: kTextContentStyleBlack)),
                          onPressed: () {},
                        ))
                  ],
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 10),
                    child: Text('Notes', style: kTextTitleSmallBlackStyle)),
                const TextField(
                  maxLines: 5,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  Column buttonSelectDate(BuildContext context, String title, String date) {
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
              icon: Text(date, style: kTextContentStyleGrey),
              label: const Icon(Icons.calendar_today_outlined),
              onPressed: () => _onSelectStartDate(context, date)),
        )
      ],
    );
  }

  Row buildRow(BuildContext context) {
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

  void _onConfirmDialog(BuildContext context) {
    showDialog(context: context, builder: (_) => const ConfirmDialog())
        .then((value) {
      if (value = true) {
        Navigator.pop(context);
      }
    });
  }

  void _onSelectStartDate(BuildContext context, String date) async {
    await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2015),
            lastDate: DateTime(2030))
        .then((value) {
      if (value != null) {
        setState(() {
          date = Utils.dateFormatFromDate(value);
        });
      }
    });
  }
}
