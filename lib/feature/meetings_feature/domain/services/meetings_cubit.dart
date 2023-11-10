import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/sheet_model.dart';

part 'meetings_state.dart';

class MeetingsCubit extends Cubit<MeetingsState> {
  MeetingsCubit() : super(MeetingsInitial());
  SheetModel? selectedChoice;
  List<SheetModel> sheetList = [
    SheetModel(nameEn: "Edit",nameAr: "Edit",),
    SheetModel(nameEn: "Delete",nameAr: "Delete",),
  ];
  void attendanceMeetings(){
      emit(MeetingsAttendance());
  }
  void recommendationsMeetings()async{
    emit(MeetingsRecommendations());
  }
  void detailsMeetings()async{
    emit(MeetingsInitial());
  }
}
