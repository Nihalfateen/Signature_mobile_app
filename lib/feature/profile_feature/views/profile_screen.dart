import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawqee3_mobile_app/common/widgets/app_button.dart';
import 'package:tawqee3_mobile_app/common/widgets/empty_state_widget.dart';
import 'package:tawqee3_mobile_app/common/widgets/loading_widget.dart';
import 'package:tawqee3_mobile_app/common/widgets/regular_text_field.dart';
import 'package:tawqee3_mobile_app/feature/profile_feature/domain/profile_cubit.dart';

import '../../../core/config/app_route.dart';
import '../../../core/constants/app_colors.dart';
import '../../../fileExport.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const route = "/ProfileScreen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.watch<ProfileCubit>();

    return Scaffold(
      backgroundColor: AppColors.white2,
      appBar: AppBar(
        elevation: 1.2,
        title: Text(
          "Profile",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.button),
        ),
        actions: [
          IconButton(
              onPressed: () {
                profileCubit.changeView();
              },
              icon: Icon(
                Icons.edit,
                size: 30.h,
                color: AppColors.button,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 45.h),
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context,state)async{
              if(state is UpdateProfileDone){
                profileCubit.changeView();
                final value = await showDialog<bool>(
                    context: navigatorKey.currentContext!,
                    builder: (BuildContext ctx) {
                      return   AlertDialog(
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0))),
                        titlePadding: EdgeInsets.zero,
                        title: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(onPressed: () {
                                  GoRouter.of(context).pop();
                                }, icon: const Icon(Icons.clear,)),
                                // Text("Delete Account",style: Theme.of(context).textTheme.bodyText1,),
                                const Spacer(),

                              ],
                            ),
                            SizedBox(height: 30.h,),
                            Text("Profile is Updated ",
                              // maxLines: 2,
                              style: Theme.of(context).textTheme.displaySmall!.copyWith(color: AppColors.black1,fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 30.h,),
                          ],
                        ),
                      );
                    });
              }
            },
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const LoadingWidget();
              }
              return Form(
                key:profileCubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(
                          "https://tawqeea.com/"
                          "${profileCubit.profileModel!.profile!.avatar}",
                          width: 50.w,
                          height: 50.h),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RegularTextField(
                      label: "Full Name",
                      readOnly: profileCubit.viewInfo,
                      controller: profileCubit.fullNameController,
                      styleController: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: AppColors.button),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter a valid Full Name";
                        }
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    RegularTextField(
                      label: "Phone Number",
                      readOnly: profileCubit.viewInfo,
                      controller: profileCubit.phoneNumberController,
                      hintText: "",
                      styleController: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: AppColors.button),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    RegularTextField(
                      label: "Email",
                      readOnly: profileCubit.viewInfo,
                      controller: profileCubit.emailController,
                      hintText: "",
                      styleController: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: AppColors.button),
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
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    RegularTextField(
                      label: "Job",
                      readOnly: profileCubit.viewInfo,
                      controller: profileCubit.jobTitleController,
                      hintText: "",
                      styleController: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: AppColors.button),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    RegularTextField(
                      label: "Job State",
                      readOnly: profileCubit.viewInfo,
                      controller: profileCubit.jobStatusController,
                      hintText: "",
                      styleController: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: AppColors.button),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    if (profileCubit.viewInfo == false) ...[
                      Center(
                          child: BigButton(
                              height: 45.h,
                              width: ScreenUtil().screenWidth / 3.5,
                              name: "Edit",
                              onTap: () {
                                if (profileCubit.formKey.currentState!.validate()) {
                                  profileCubit.updateProfile();
                                }
                              },
                              containerColor: AppColors.button,
                              borderColor: AppColors.button,
                              radius: 8)),
                      SizedBox(height:15.h,)
                    ]
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
