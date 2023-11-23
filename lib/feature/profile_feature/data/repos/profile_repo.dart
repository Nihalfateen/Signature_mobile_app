import 'package:tawqee3_mobile_app/feature/profile_feature/data/model/profile_model.dart';

import '../../../../common/model/failure_model.dart';
import '../../../../core/constants/app_urls.dart';
import '../../../../core/services/dio_services.dart';
import '../../../../core/services/locator_service.dart';

class ProfileRepo {
  final DioServices _dioServices = locator<DioServices>();

  Future getProfile() async {
    try {
      var response = await _dioServices.getRequest(AppUrl.getProfile);
      var profile = ProfileModel.fromJson(response);
      return profile;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString(), data: e.toString());
    }
  }

  Future updateProfile(Profile profile) async {
    try {
      var response = await _dioServices.putRequest(
          profile.toMap(), AppUrl.putProfile);
      return response;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString(), data: e.toString());
    }
  }
}
