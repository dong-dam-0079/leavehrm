import 'dart:convert';

TimesheetResponse welcomeFromJson(String str) => TimesheetResponse.fromJson(json.decode(str));

class TimesheetResponse {
  TimesheetResponse({
    required this.timesheet,
  });

  List<Timesheet> timesheet;

  factory TimesheetResponse.fromJson(Map<String, dynamic> json) => TimesheetResponse(
    timesheet: List<Timesheet>.from(json["timesheet"].map((x) => Timesheet.fromJson(x))),
  );
}

class Timesheet {
  Timesheet({
    required this.date,
    required this.checkin,
    required this.checkout,
    required this.totalHours,
  });

  String date;
  String checkin;
  String checkout;
  String totalHours;

  factory Timesheet.fromJson(Map<String, dynamic> json) => Timesheet(
    date: json["date"],
    checkin: json["checkin"],
    checkout: json["checkout"],
    totalHours: json["totalHours"],
  );
}
