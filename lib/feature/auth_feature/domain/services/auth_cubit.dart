import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../fileExport.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool get passwordVisible => _passwordVisible;

  togglepasswordVisible() {
    _passwordVisible = !_passwordVisible;
    emit(PasswordToggle());
  }
}

