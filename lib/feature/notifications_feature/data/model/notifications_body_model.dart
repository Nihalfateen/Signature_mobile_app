import 'meetings_notification_model.dart';

class NotificationsBodyModel {
  int? id;
  bool? unread;
  String? createdAt;
  MeetingNotificationsModel? meeting;

  NotificationsBodyModel({this.id, this.unread, this.createdAt, this.meeting});

  NotificationsBodyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unread = json['unread'];
    createdAt = json['created_at'];
    meeting =
    json['meeting'] != null ? MeetingNotificationsModel.fromJson(json['meeting']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['unread'] = unread;
    data['created_at'] = createdAt;
    if (meeting != null) {
      data['meeting'] = meeting!.toJson();
    }
    return data;
  }
}