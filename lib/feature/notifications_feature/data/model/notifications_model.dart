import 'notifications_body_model.dart';

class NotificationsModel {
  List<NotificationsBodyModel>? notifications;

  NotificationsModel({this.notifications});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    if (json['notifications'] != null) {
      notifications = <NotificationsBodyModel>[];
      json['notifications'].forEach((v) {
        notifications!.add(NotificationsBodyModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (notifications != null) {
      data['notifications'] =
          notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}