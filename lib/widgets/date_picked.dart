import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constant.dart';

class DatePicked extends StatefulWidget {
  const DatePicked({Key? key}) : super(key: key);

  @override
  _DatePickedState createState() => _DatePickedState();
}

class _DatePickedState extends State<DatePicked> {
  DateTime currentDate = DateTime.now();
  int indexMonth = 0, indexYear = 0;
  String? monthPicked, yearPicked;
  bool isClickPickedDate = true;
  var listMonth = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12"
  ];
  var listYear = [
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
    "2025"
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: 120,
          height: 40,
          decoration: BoxDecoration(
              color: const Color(-1261515058),
              borderRadius: BorderRadius.circular(15)),
          child: TextButton(
            onPressed: () {
              setState(() {
                isClickPickedDate = false;
              });
              showDialogDatePicker();
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                monthPicked == null
                    ? '${currentDate.month}/${currentDate.year}'
                    : '$monthPicked/$yearPicked',
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ),
              Icon(
                  isClickPickedDate ? Icons.arrow_right : Icons.arrow_drop_down,
                  color: Colors.black),
            ]),
          ),
        ),
      ],
    );
  }

  showDialogDatePicker() => showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 210,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isClickPickedDate = true;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel',
                                      style: kTransparentText)),
                              TextButton(
                                  onPressed: () => {
                                    setState(() {
                                      isClickPickedDate = true;
                                      monthPicked = listMonth[indexMonth];
                                      yearPicked = listYear[indexYear];
                                    }),
                                    Navigator.pop(context)
                                  },
                                  child: const Text('Select',
                                      style: kTransparentText)),
                            ],
                          )),
                      const Divider(color: Colors.grey, height: 10)
                    ],
                  )),
              Expanded(
                flex: 2,
                child: Center(
                  child: SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                            child: CupertinoPicker(
                                itemExtent: 40,
                                onSelectedItemChanged: (index) {
                                  indexMonth = index;
                                },
                                children: listMonth
                                    .map((month) => Center(child: Text(month)))
                                    .toList())),
                        Expanded(
                            child: CupertinoPicker(
                                itemExtent: 40,
                                onSelectedItemChanged: (index) {
                                  indexYear = index;
                                },
                                children: listYear
                                    .map((year) => Center(child: Text(year)))
                                    .toList()))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      });
}
