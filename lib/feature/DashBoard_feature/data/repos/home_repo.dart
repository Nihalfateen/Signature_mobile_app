

import 'package:tawqee3_mobile_app/feature/meetings_feature/data/model/meetings_model/meetings_model.dart';

import '../../../../common/model/failure_model.dart';
import '../../../../core/constants/app_urls.dart';
import '../../../../core/services/dio_services.dart';
import '../../../../core/services/locator_service.dart';

class HomeRepo {
  final DioServices _dioServices = locator<DioServices>();

  Future getUpcomingMeetings() async {
    try {
      var response =
      await _dioServices.getRequest(AppUrl.getMeetingsHome);
      var meetings = MeetingsModel.fromJson(response);
      return meetings;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString(), data: e.toString());
    }
  }
}