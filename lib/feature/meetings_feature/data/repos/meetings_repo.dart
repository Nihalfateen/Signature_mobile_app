import 'package:flutter/material.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/data/model/meetings_attendance_model/meetings_attendance_body_model.dart';


import '../../../../common/model/failure_model.dart';
import '../../../../core/constants/app_urls.dart';
import '../../../../core/services/dio_services.dart';
import '../../../../core/services/locator_service.dart';
import '../model/meetings_attendance_model/meetings_attendance_model.dart';
import '../model/meetings_model/meetings_body_model.dart';
import '../model/meetings_model/meetings_model.dart';


class MeetingRepo {
  final DioServices _dioServices = locator<DioServices>();

  Future getMeetingsDetails(String? meetingsId,) async {
    try {
      var response =
          await _dioServices.getRequest(AppUrl.getMeetingsDetails(meetingsId!));
      var meetings = MeetingsBodyModel.fromJson(response);
      return meetings;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString(), data: e.toString());
    }
  }

  Future getMeetings() async {
    try {
      var response = await _dioServices.getRequest(AppUrl.getMeetings);
      var meetings=MeetingsModel.fromJson(response);
      return meetings;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString(), data: e.toString());
    }
  }
  Future getMeetingsAttendance(String? meetingsId,) async {
    try {
      var response =
      await _dioServices.getRequest(AppUrl.getMeetingsAttendances(meetingsId!));
      var meetingsAttendance = MeetingsAttendanceModel.fromJson(response);
      return meetingsAttendance;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString(), data: e.toString());
    }
  }

  Future getMeetingsAttendanceDetails() async {
    try {
      var response = await _dioServices.getRequest(AppUrl.getMeetings);
      var meetings=AttendanceBodyModel.fromJson(response);
      return meetings;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString(), data: e.toString());
    }
  }
}
