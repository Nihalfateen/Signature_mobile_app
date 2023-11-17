part of 'notifications_cubit.dart';

@immutable
abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}
class NotificationsLoading extends NotificationsState {}
class NotificationsDetailsDone extends NotificationsState {}
class NotificationsError extends NotificationsState {
  final String?errorMessage;

  NotificationsError({this.errorMessage});
}

