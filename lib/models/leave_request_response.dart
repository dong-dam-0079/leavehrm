import 'dart:convert';

LeaveRequestResponse welcomeFromJson(String str) => LeaveRequestResponse.fromJson(json.decode(str));

class LeaveRequestResponse {
  LeaveRequestResponse({
    required this.main,
  });

  List<Main> main;

  factory LeaveRequestResponse.fromJson(Map<String, dynamic> json) => LeaveRequestResponse(
    main: List<Main>.from(json["main"].map((x) => Main.fromJson(x))),
  );
}

class Main {
  Main({
    required this.id,
    required this.leaveType,
    required this.startDay,
    required this.endDay,
    required this.absentDay,
    required this.status,
    required this.leaveReason,
    required this.notes,
    required this.isApproved,
    required this.isExpanded,
  });

  int id;
  String leaveType;
  String startDay;
  String endDay;
  String absentDay;
  String status;
  String leaveReason;
  String notes;
  bool isApproved;

  bool isExpanded = false;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    id: json["id"],
    leaveType: json["leaveType"],
    startDay: json["startDay"],
    endDay: json["endDay"],
    absentDay: json["absentDay"],
    status: json["status"],
    leaveReason: json["leaveReason"],
    notes: json["notes"],
    isApproved: json["isApproved"],
    isExpanded: false,
  );
}
