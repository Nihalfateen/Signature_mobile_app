part of 'meetings_cubit.dart';

@immutable
abstract class MeetingsState {}

class MeetingsInitial extends MeetingsState {}
class MeetingsAttendance extends MeetingsState {}
class MeetingsRecommendations extends MeetingsState {}
