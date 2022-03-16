import 'dart:convert';

LeaveRequestResponse welcomeFromJson(String str) => LeaveRequestResponse.fromJson(json.decode(str));

class LeaveRequestResponse {
  LeaveRequestResponse({
    required this.main,
  });

  List<LeaveRequest> main;

  factory LeaveRequestResponse.fromJson(Map<String, dynamic> json) => LeaveRequestResponse(
    main: List<LeaveRequest>.from(json["main"].map((x) => LeaveRequest.fromJson(x))),
  );
}

class LeaveRequest {
  LeaveRequest({
    required this.id,
    this.employeeName,
    this.department,
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
  String? employeeName;
  String? department;
  String leaveType;
  String startDay;
  String endDay;
  String absentDay;
  String status;
  String leaveReason;
  String notes;
  bool isApproved;

  bool isExpanded = false;

  factory LeaveRequest.fromJson(Map<String, dynamic> json) => LeaveRequest(
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
