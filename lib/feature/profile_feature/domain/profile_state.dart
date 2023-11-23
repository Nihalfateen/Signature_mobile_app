part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class ProfileError extends ProfileState {
  final String?errorMessage;

  ProfileError({this.errorMessage});
}
class ProfileDone extends ProfileState {}
class UpdateProfileLoading extends ProfileState {}
class UpdateProfileDone extends ProfileState {}
class UpdateProfileError extends ProfileState {
  final String?errorMessage;

  UpdateProfileError({this.errorMessage});
}
