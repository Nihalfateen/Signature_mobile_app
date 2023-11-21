
import 'package:flutter/material.dart';

import '../../../../common/model/failure_model.dart';
import '../../../../core/constants/app_urls.dart';
import '../../../../core/services/dio_services.dart';
import '../../../../core/services/locator_service.dart';

class AuthRepo{
  final DioServices _dioServices = locator<DioServices>();

  /// login
  Future loginCall(String token) async {
    try {
      var response = await _dioServices.postRequestWithHeaders(token);
      return response;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString(), data: e.toString());
    }
  }
}