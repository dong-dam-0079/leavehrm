import 'dart:async';

import 'package:dio/dio.dart';
import 'package:leavehrm/models/approve_leave_response.dart';

import '../models/leave_request_response.dart';

class ApiServices {
  final String _url = "https://mocki.io/v1/";
  static const String _apiLeaveRequest = "dc9de76b-6c5b-45b3-92a1-41e02866fb90";
  static const String _apiLeaveHistory= "69504f59-d19e-495c-a6bf-601e944050b4";
  static const String _apiPendingLeaveRequestForLeader= "b626ac4f-12c7-42ce-afe2-6d87c5d44e01";
  static const String _apiApprovedLeaveRequestForLeader= "b626ac4f-12c7-42ce-afe2-6d87c5d44e01";
  final Dio _dio = Dio();

  Future<List<Main>> fetchLeaveRequest() async {
      Response response = await _dio.get(_url + _apiLeaveRequest);
      LeaveRequestResponse leaveResponse =
      LeaveRequestResponse.fromJson(response.data);
      return leaveResponse.main;
  }

  Future<List<Main>> fetchLeaveHistory() async {
      Response response = await _dio.get(_url + _apiLeaveHistory);
      LeaveRequestResponse leaveResponse =
      LeaveRequestResponse.fromJson(response.data);
      return leaveResponse.main;
  }

  Future<List<LeaveRequestForLeader>> fetchPendingApproveForLeader() async {
      Response response = await _dio.get(_url + _apiPendingLeaveRequestForLeader);
      ApproveLeaveResponse approveLeaveResponse =
      ApproveLeaveResponse.fromJson(response.data);
      return approveLeaveResponse.main;
  }

  Future<List<LeaveRequestForLeader>> fetchApprovedForLeader() async {
      Response response = await _dio.get(_url + _apiApprovedLeaveRequestForLeader);
      ApproveLeaveResponse approveLeaveResponse =
      ApproveLeaveResponse.fromJson(response.data);
      return approveLeaveResponse.main;
  }
}
