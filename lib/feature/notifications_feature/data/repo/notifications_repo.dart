
import 'package:tawqee3_mobile_app/feature/notifications_feature/data/model/notifications_model.dart';

import '../../../../common/model/failure_model.dart';
import '../../../../core/constants/app_urls.dart';
import '../../../../core/services/dio_services.dart';
import '../../../../core/services/locator_service.dart';

class NotificationsRepo{
  final DioServices _dioServices = locator<DioServices>();

  Future getNotifications() async {
    try {
      var response = await _dioServices.getRequest(AppUrl.getNotifications);
      var meetings=NotificationsModel.fromJson(response);
      return meetings;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString(), data: e.toString());
    }
  }

}