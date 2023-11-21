import 'package:get_it/get_it.dart';
import 'package:tawqee3_mobile_app/feature/DashBoard_feature/data/repos/home_repo.dart';
import 'package:tawqee3_mobile_app/feature/auth_feature/data/repos/auth_repo.dart';
import 'package:tawqee3_mobile_app/feature/notifications_feature/data/repo/notifications_repo.dart';

import '../../feature/meetings_feature/data/repos/meetings_repo.dart';
import 'dio_services.dart';


final locator = GetIt.instance;

///how to take object from class in service locator
/// Repo repo = locator<Repo>();
void setupLocator() {
  locator.registerLazySingleton(()=> DioServices());
  locator.registerLazySingleton(()=> MeetingRepo());
  locator.registerLazySingleton(()=> HomeRepo());
  locator.registerLazySingleton(()=> NotificationsRepo());
  locator.registerLazySingleton(()=> AuthRepo());




}