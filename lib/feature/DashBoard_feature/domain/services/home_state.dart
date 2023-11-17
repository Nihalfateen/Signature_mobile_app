part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class UpcomingMeetingsLoading extends HomeState {}
class UpcomingMeetingsDone extends HomeState {}
class UpcomingMeetingsEmpty extends HomeState {}
class UpcomingMeetingsError extends HomeState {
  String ?error;

  UpcomingMeetingsError({this.error});
}
