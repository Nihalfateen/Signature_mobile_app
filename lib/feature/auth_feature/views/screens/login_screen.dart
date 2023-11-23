import 'package:tawqee3_mobile_app/common/widgets/app_button.dart';
import 'package:tawqee3_mobile_app/common/widgets/regular_text_field.dart';
import 'package:tawqee3_mobile_app/core/constants/app_colors.dart';
import 'package:tawqee3_mobile_app/feature/DashBoard_feature/views/dashboard_screen/home_screen.dart';
import 'package:tawqee3_mobile_app/fileExport.dart';

import '../../domain/services/auth_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const route = "/";
  @override
  Widget build(BuildContext context) {
    final authCubit = context.watch<AuthCubit>();
    return Scaffold(
        body: SingleChildScrollView(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          //
          if (state is AuthDone) {
            context.go(HomeScreen.route);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(top: 50.h, left: 16.w, right: 16.w),
            child: Form(
              key: authCubit.formKey,
              child: Column(
                children: [
                  Text('Login',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.black)),
                  SizedBox(
                    height: 15.h,
                  ),
                  RegularTextField(
                    keyboardType: TextInputType.emailAddress,
                    label: "E-mail",
                    controller: authCubit.emailController,
                    hintText: "Enter your email",
                    validator: (value) {
                      if (value != null && value.trim().isNotEmpty) {
                        String pattern =
                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
                        RegExp regex = RegExp(pattern);
                        if (!regex.hasMatch(value.trim())) {
                          return "Enter a valid email";
                        }
                      }
                      return null;
                    },
                    errorMessage: authCubit.errorMessage,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  RegularTextField(
                    hintText: 'Enter your password',
                    label: "Password",
                    controller: authCubit.passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter a password";
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                    suffix: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          context.read<AuthCubit>().passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.gray,
                        ),
                        onPressed: () {
                          context.read<AuthCubit>().togglepasswordVisible();
                        }),
                    protectedText: !context.read<AuthCubit>().passwordVisible,
                    errorMessage: authCubit.errorMessage,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  if (state is AuthError) ...[
                    Text(
                      "${state.error}",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.red1),
                    ),
                    SizedBox(
                      height: 15.h,
                    )
                  ],
                  BigButton(
                    height: 52.h,
                    width: ScreenUtil().screenWidth / 1.2,
                    name: "Login",
                    onTap: () {
                      if (authCubit.formKey.currentState!.validate()) {
                        authCubit.loginCall();
                      }
                    },
                    containerColor: AppColors.button,
                    borderColor: AppColors.button,
                    radius: 8,
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}
