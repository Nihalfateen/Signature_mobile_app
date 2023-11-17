class AttendanceBodyModel {
  String? avatar;
  String? fullName;
  String? email;
  String? attendanceStatus;
  String? attendanceComment;

  AttendanceBodyModel(
      {this.avatar,
        this.fullName,
        this.email,
        this.attendanceStatus,
        this.attendanceComment});

  AttendanceBodyModel.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    fullName = json['full_name'];
    email = json['email'];
    attendanceStatus = json['attendance_status'];
    attendanceComment = json['attendance_comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['attendance_status'] = this.attendanceStatus;
    data['attendance_comment'] = this.attendanceComment;
    return data;
  }
}