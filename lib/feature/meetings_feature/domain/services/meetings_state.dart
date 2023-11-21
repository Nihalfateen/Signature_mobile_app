part of 'meetings_cubit.dart';

@immutable
abstract class MeetingsState {}

class MeetingsInitial extends MeetingsState {}
class MeetingsError extends MeetingsState {
  String ?error;

  MeetingsError({this.error});
}
class MeetingsLoading extends MeetingsState {}
class MeetingsDetailsLoading extends MeetingsState {}
class MeetingsAttendanceLoading extends MeetingsState {}
class MeetingsDone extends MeetingsState {}
class MeetingsEmpty extends MeetingsState {}
class MeetingsAttendanceDone extends MeetingsState {}
class MeetingsAttendanceEmpty extends MeetingsState {}
class MeetingsDetailsDone extends MeetingsState {}
class SelectedMeetingsTabBar extends MeetingsState{}
