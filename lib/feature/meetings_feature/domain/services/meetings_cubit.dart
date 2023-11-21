import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tawqee3_mobile_app/core/extensions/task_excuter.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/data/model/meetings_attendance_model/meetings_attendance_model.dart';

import '../../../../core/services/locator_service.dart';
import '../../data/model/meetings_model/meetings_body_model.dart';
import '../../data/model/meetings_model/meetings_model.dart';
import '../../data/model/sheet_model.dart';
import '../../data/repos/meetings_repo.dart';

part 'meetings_state.dart';

class MeetingsCubit extends Cubit<MeetingsState> {
  MeetingsCubit() : super(MeetingsInitial());
  final MeetingRepo meetingsRepo = locator<MeetingRepo>();
  MeetingsBodyModel? meetingsBodyModel;
  String? errorMessage;
  SheetModel? selectedChoice;
  int selectedTap=0;
  List<SheetModel> sheetList = [
    SheetModel(
      nameEn: "Edit",
      nameAr: "Edit",
    ),
    SheetModel(
      nameEn: "Delete",
      nameAr: "Delete",
    ),
  ];
  MeetingsModel? meetingsModel;
  MeetingsAttendanceModel? meetingsAttendanceModel;


  Future<void> getMeetingsDetails() async {
    emit(MeetingsDetailsLoading());
    var response = meetingsRepo.getMeetingsDetails(meetingsBodyModel!.id.toString());
    await response.excute(
      onFailed: (failed) {
        errorMessage = failed.message;
        emit(MeetingsError(error: failed.message));
      },
      onSuccess: (value) async {
        meetingsBodyModel = value;
        emit(MeetingsDetailsDone());
      },
    );
  }

  Future<void> getMeetings() async {
    emit(MeetingsLoading());
    var response = meetingsRepo.getMeetings();
    await response.excute(
      onFailed: (failed) {
        errorMessage = failed.message;
        emit(MeetingsError(error: failed.message));
      },
      onSuccess: (value) async {
        meetingsModel = value;
        if (meetingsModel!.meetingsBodyModel!.isEmpty) {
          emit(MeetingsEmpty());
        } else {
          emit(MeetingsDone());
        }
      },
    );
  }

  Future<void> getMeetingsAttendance() async {
    emit(MeetingsAttendanceLoading());
    var response = meetingsRepo.getMeetingsAttendance(meetingsBodyModel!.id.toString());
    await response.excute(
      onFailed: (failed) {
        errorMessage = failed.message;
        emit(MeetingsError(error: failed.message));
      },
      onSuccess: (value) async {
        meetingsAttendanceModel = value;
        if (meetingsAttendanceModel!.attendanceBodyModel!.isEmpty) {
          emit(MeetingsAttendanceEmpty());
        } else {
          emit(MeetingsAttendanceDone());
        }
      },
    );
  }
  setSelectedTapWidget(int index) {
    selectedTap=index;
    emit(SelectedMeetingsTabBar());
  }
}
