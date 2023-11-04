import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'meetings_state.dart';

class MeetingsCubit extends Cubit<MeetingsState> {
  MeetingsCubit() : super(MeetingsInitial());

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
