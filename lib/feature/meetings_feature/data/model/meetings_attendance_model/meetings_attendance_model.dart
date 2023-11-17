
import 'meetings_attendance_body_model.dart';

class MeetingsAttendanceModel {
  List<AttendanceBodyModel>? attendanceBodyModel;

  MeetingsAttendanceModel({this.attendanceBodyModel});

  MeetingsAttendanceModel.fromJson(Map<String, dynamic> json) {
    if (json['attendants'] != null) {
      attendanceBodyModel = <AttendanceBodyModel>[];
      json['attendants'].forEach((v) {
        attendanceBodyModel!.add(AttendanceBodyModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (attendanceBodyModel != null) {
      data['attendants'] = attendanceBodyModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}