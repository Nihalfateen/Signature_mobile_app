import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tawqee3_mobile_app/core/extensions/task_excuter.dart';
import 'package:tawqee3_mobile_app/feature/DashBoard_feature/data/repos/home_repo.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/data/model/meetings_model/meetings_model.dart';

import '../../../../core/services/locator_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final HomeRepo homeRepo= locator<HomeRepo>();
  MeetingsModel?meetingsModel;
  String? errorMessage;

  Future<void> getUpcomingMeetings() async {
    emit(UpcomingMeetingsLoading());
    var response = homeRepo.getUpcomingMeetings();
    await response.excute(
      onFailed: (failed) {
        errorMessage = failed.message;

        emit(UpcomingMeetingsError(error: failed.message));
      },
      onSuccess: (value) async {
        meetingsModel= value;
        if(meetingsModel!.meetingsBodyModel!.isEmpty){
          emit(UpcomingMeetingsEmpty());
        }else{
          emit(UpcomingMeetingsDone());
        }
      },
    );
  }
}
