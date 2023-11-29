import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:signature/signature.dart';
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
      body: RefreshIndicator(
        onRefresh: () => context.read<ProfileCubit>().getProfile(),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 45.h),
            child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) async {
                if (state is UpdateProfileDone) {
                  profileCubit.changeView();
                  final value = await showDialog<bool>(
                      context: navigatorKey.currentContext!,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0))),
                          titlePadding: EdgeInsets.zero,
                          title: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        GoRouter.of(context).pop();
                                      },
                                      icon: const Icon(
                                        Icons.clear,
                                      )),
                                  // Text("Delete Account",style: Theme.of(context).textTheme.bodyText1,),
                                  const Spacer(),
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Text(
                                "Profile is Updated ",
                                // maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                        color: AppColors.black1,
                                        fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
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
                  key: profileCubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(children: [
                        Center(
                            child: profileCubit.image != null
                                ? SizedBox(
                                    width: 130.w,
                                    height: 88.h,
                                    child: Stack(
                                      children: [
                                        // if (profileCubit.canRemoveImage(profileCubit.image,profileCubit.profileModel!.profile!.avatar))
                                        Positioned(
                                            left: 15.w,
                                            top: 7.h,
                                            child: SizedBox(
                                              width: 100.w,
                                              height: 100.h,
                                              child: ClipOval(
                                                child: Image.file(
                                                  profileCubit.image!,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            )),

                                      ],
                                    ),
                                  )
                                : SizedBox(
                                    width: 170.w,
                                    height: 170.h,
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: "https://tawqeea.com/"
                                            "${profileCubit.profileModel!.profile!.avatar}",
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error_outline,
                                                color: AppColors.red1,
                                                size: 30.sp),
                                      ),
                                    ),
                                  )),
                        Positioned(
                            left: 170.w,
                            top: 130.h,
                            child: IconButton(
                                onPressed: () {
                                  profileCubit.getGalleryImage();
                                },
                                icon: Icon(
                                  Icons.image,
                                  color: AppColors.button,
                                  size: 30.sp,
                                ))),
// if(profileCubit.image!=null)

                      ]),
                      profileCubit.image!=null? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Update picture",style: Theme.of(context).textTheme.displaySmall!.copyWith(color:AppColors.button),),
                          SizedBox(width:10.w,),
                         IconButton(onPressed:(){
                            profileCubit.updateAvatar();
                          }, icon:Icon(Icons.edit_note,size:30.sp,))
                        ],
                      ):Container(),
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
                      Row(
                        children: [
                          Text("Signature",style:Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: AppColors.black1)),
                          Spacer(),
                          IconButton(onPressed:()async{
                            profileCubit.editSignature();

                          }, icon:Icon(Icons.edit_note,size:30.sp,))
                        ],
                      ),

                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:11.w,right:11.w,bottom:15.h),
                        child:DottedBorder(
                          color: AppColors.button,
                          strokeWidth: 2,
                          padding: EdgeInsets.zero,
                          dashPattern: [10, 5],
                          customPath: (size) {
                            return Path()
                              ..moveTo(15, 0)
                              ..lineTo(size.width - 3, 0)
                              ..arcToPoint(Offset(size.width, 2),
                                  radius:  Radius.zero)
                              ..lineTo(size.width, size.height - 2)
                              ..arcToPoint(Offset(size.width - 2, size.height),
                                  radius:  Radius.zero)
                              ..lineTo(15, size.height)
                              ..arcToPoint(Offset(0, size.height),
                                  radius: Radius.zero)
                              ..lineTo(0, 0)
                              ..arcToPoint(Offset(15, 0),
                                  radius:  Radius.zero);
                          }, child: profileCubit.profileModel?.profile?.signature!=null?CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: "https://tawqeea.com/"
                              "${profileCubit.profileModel!.profile!.signature}",
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error_outline,
                                  color: AppColors.red1,
                                  size: 30.sp),
                        ):Signature(
                          controller: profileCubit.controller,
                          height:ScreenUtil().screenHeight/2.92,
                          width: ScreenUtil().screenWidth /1.25,
                          backgroundColor: AppColors.white1,
                        ),
                        ),
                      ),
                      if (state is SignatureEdited) ...[
                        Center(
                            child:InkWell(
                              onTap:(){
                                profileCubit.updateSignature();
                              },
                                child: Text("update",style:Theme.of(context).textTheme.displayMedium!.copyWith(color:AppColors.button),)),),
                        SizedBox(
                          height: 15.h,
                        )
                      ],
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
                                  if (profileCubit.formKey.currentState!
                                      .validate()) {
                                    profileCubit.updateProfile();
                                  }
                                },
                                containerColor: AppColors.button,
                                borderColor: AppColors.button,
                                radius: 8)),
                        SizedBox(
                          height: 15.h,
                        )
                      ]
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
