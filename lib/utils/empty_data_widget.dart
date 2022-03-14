import 'package:flutter/material.dart';

import 'constant.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("You don't have any leave's upcoming",
                  style: TextStyle(
                      color: Colors.grey, fontSize: kTextBigSize)),
              Container(
                  height: 150,
                  width: 150,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration:
                  const BoxDecoration(color: Colors.black)),
              OutlinedButton(
                  onPressed: null,
                  child: const Text('Request Leave',
                      style: kTextButtonStyle),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(30.0))),
                  ))
            ],
          ),
        ));
  }
}
