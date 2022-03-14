
import 'dart:convert';

ApproveLeaveResponse welcomeFromJson(String str) => ApproveLeaveResponse.fromJson(json.decode(str));

class ApproveLeaveResponse {
  ApproveLeaveResponse({
    required this.main,
  });

  List<LeaveRequestForLeader> main;

  factory ApproveLeaveResponse.fromJson(Map<String, dynamic> json) => ApproveLeaveResponse(
    main: List<LeaveRequestForLeader>.from(json["main"].map((x) => LeaveRequestForLeader.fromJson(x))),
  );
}

class LeaveRequestForLeader {
  LeaveRequestForLeader({
    required this.id,
    required this.employeeName,
    required this.department,
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
  String employeeName;
  String department;
  String leaveType;
  String startDay;
  String endDay;
  String absentDay;
  String status;
  String leaveReason;
  String notes;
  bool isApproved;

  bool isExpanded = false;

  factory LeaveRequestForLeader.fromJson(Map<String, dynamic> json) => LeaveRequestForLeader(
    id: json["id"],
    employeeName: json["employeeName"],
    department: json["department"],
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
