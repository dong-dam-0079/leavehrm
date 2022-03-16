import 'dart:async';

import 'package:dio/dio.dart';
import 'package:leavehrm/models/timesheet_response.dart';

import '../models/leave_request_response.dart';

class ApiServices {
  final String _url = "https://mocki.io/v1/";
  static const String apiLeaveRequest = "dc9de76b-6c5b-45b3-92a1-41e02866fb90";
  static const String apiLeaveHistory = "69504f59-d19e-495c-a6bf-601e944050b4";
  static const String apiPendingLeaveRequestForLeader =
      "b626ac4f-12c7-42ce-afe2-6d87c5d44e01";
  static const String apiApprovedLeaveRequestForLeader =
      "e52603d4-d5ea-4625-8ec8-d46fb3f5c3c7";
  static const String apiTimesheet = "1240d0a4-257b-4cb7-904f-8691d34c86df";
  final Dio _dio = Dio();

  Future<List<LeaveRequest>> fetchLeaveRequest(String keyAPI) async {
    Response response = await _dio.get(_url + keyAPI);
    LeaveRequestResponse leaveResponse =
        LeaveRequestResponse.fromJson(response.data);
    return leaveResponse.main;
  }

  Future<List<Timesheet>> fetchTimesheet(String keyAPI) async {
    Response response = await _dio.get(_url + keyAPI);
    TimesheetResponse timesheetResponse =
        TimesheetResponse.fromJson(response.data);
    return timesheetResponse.timesheet;
  }
}
