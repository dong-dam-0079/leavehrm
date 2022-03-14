import 'package:flutter/material.dart';

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
                  color: Colors.black)
            ]),
          ),
        ),
      ],
    );
  }
}
