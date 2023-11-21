part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthDone extends AuthState {}
class AuthError extends AuthState {
  String ?error;
  AuthError({this.error});
}

