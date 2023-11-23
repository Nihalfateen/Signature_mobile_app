import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tawqee3_mobile_app/core/extensions/task_excuter.dart';
import 'package:tawqee3_mobile_app/feature/notifications_feature/data/model/notifications_model.dart';
import 'package:tawqee3_mobile_app/feature/notifications_feature/data/repo/notifications_repo.dart';

import '../../../core/services/locator_service.dart';
import '../../../fileExport.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());
  final NotificationsRepo notificationsRepo = locator<NotificationsRepo>();
  NotificationsModel?notificationsModel;





  Future<void>getNotifications()async{
    emit(NotificationsLoading());
    var response = notificationsRepo.getNotifications();
    await response.excute(
      onFailed: (failed) => emit(NotificationsError(errorMessage: failed.message)),
      onSuccess: (value){
        notificationsModel = value;
        emit(NotificationsDetailsDone());
      },
    );
  }
}
