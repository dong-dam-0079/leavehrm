import 'package:flutter/material.dart';
import 'package:leavehrm/utils/constant.dart';

class ConfirmDialog extends StatefulWidget {
  const ConfirmDialog({Key? key}) : super(key: key);

  @override
  _ConfirmDialogState createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      //this right here
      child: FractionallySizedBox(
        alignment: Alignment.center,
        widthFactor: 0.9,
        heightFactor: 0.7,
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 10),
                  color: Colors.black,
                ),
                const Text('Are you sure?', style: kTextContentStyleBlack),
                const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text('(4,5 Days left)',
                        style: kTextTitleSmallGreyStyle)),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: double.infinity,
                      // margin: const EdgeInsets.only(top: 20, bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kBlueColor),
                      child: TextButton(
                        child: const Text("Let's do it",
                            style: TextStyle(
                                color: Colors.white, fontSize: kTextSize)),
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          color: const Color(-1528108310),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        child: const Text("Do it later",
                            style: TextStyle(
                                color: Colors.grey, fontSize: kTextSize)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ))
              ],
            )),
      ),
    );
  }
}
