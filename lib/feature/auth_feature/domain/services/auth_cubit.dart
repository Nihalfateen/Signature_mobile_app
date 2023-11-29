import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tawqee3_mobile_app/core/extensions/task_excuter.dart';
import 'package:tawqee3_mobile_app/feature/auth_feature/data/model/user_model.dart';
import 'package:tawqee3_mobile_app/feature/auth_feature/data/repos/auth_repo.dart';

import '../../../../core/services/locator_service.dart';
import '../../../../fileExport.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? errorMessage;
  bool _passwordVisible = false;
  bool get passwordVisible => _passwordVisible;
  final AuthRepo authRepo = locator<AuthRepo>();
  UserModel? getUserModel;

  togglepasswordVisible() {
    _passwordVisible = !_passwordVisible;
    emit(AuthInitial());
  }

  Future<void> loginCall() async {
    emit(AuthLoading());
    var token = base64.encode(
        utf8.encode("${emailController.text}:${passwordController.text}"));
    var response = authRepo.loginCall(token);
    await response.excute(
      onFailed: (failed) {
        errorMessage = "";
        Logger().i(errorMessage);
        emit(AuthError(error: failed.message));
      },
      onSuccess: (value) async {
        getUserModel=UserModel.fromJson(value);
        Preference.setString(PrefKeys.accessToken, getUserModel!.token!);
        emit(AuthDone());
      },
    );
  }
}
