import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../main.dart';
import '../constants/app_urls.dart';
import '../services/preference_services.dart';
class DioConfigOptions {
  static Future<BaseOptions> getBaseOption() async {
    BaseOptions options = BaseOptions(
        baseUrl: AppUrl.getServerUrl(appFlavor),
        connectTimeout: const Duration(milliseconds: 30000),
        receiveTimeout: const Duration(milliseconds: 30000),
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
        // responseType: ResponseType.bytes,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          // "Accept": "text/plain",
          // "lang":"${navigatorKey.currentState?.context.locale.languageCode}",
          'authorization': "Bearer ${Preference.getString(PrefKeys.accessToken)}",
        });

    return options;
  }
}
