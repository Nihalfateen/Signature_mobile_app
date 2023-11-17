import 'app_flavors.dart';

class AppUrl{
  static const stagingUrl = 'https://tawqeea.com/api/v1/';
  static const productionUrl = 'https://tawqeea.com/api/v1/';
  static getServerUrl(String appFlavor) {
    switch (appFlavor) {
      case AppFlavors.production:
        return AppUrl.productionUrl;
      case AppFlavors.staging:
        return AppUrl.stagingUrl;
      default:
        return AppUrl.stagingUrl;
    }
  }

  static const getMeetingsHome ="home";
  static const getMeetings ="meetings";
  static String Function(String) get getMeetingsDetails =>
          (id) => 'meetings/$id';
  static const getProfile ="profile";
  static const getNotifications ="notifications";
  static String Function(String) get getMeetingsAttendances =>
          (id) => 'meetings/$id/attendances';
  static String Function(String) get getMeetingsRecommendations =>
          (id) => 'meetings/$id/recommendations';



}
 
