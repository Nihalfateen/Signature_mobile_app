
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tawqee3_mobile_app/common/widgets/loading_widget.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/data/model/meetings_model/meetings_body_model.dart';

import '../../../core/constants/app_colors.dart';
import '../../meetings_feature/domain/services/meetings_cubit.dart';
import '../../meetings_feature/views/meetings_screen/meetings_details_screen.dart';
import '../domain/notifications_cubit.dart';
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);
  static const route = "/NotificationsScreen";
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NotificationsCubit>().getNotifications();

  }

  @override
  Widget build(BuildContext context) {
    final notificationCubit = context.watch<NotificationsCubit>();
    return Scaffold(
      backgroundColor: AppColors.white2,
      appBar: AppBar(
        elevation: 1.2,
        title: Text(
          "Notifications",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.button),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async{
        await  notificationCubit.getNotifications();
        },
        child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                BlocConsumer<NotificationsCubit, NotificationsState>(
                  listener: (context, state) {

                  },
                  builder: (context, state) {
                    if (state is NotificationsLoading) {
                      return const LoadingWidget();
                    }else if(state is NotificationsError){
                      return Padding(
                        padding: EdgeInsets.only(left:35.w,right:35.w,top:15.h),
                        child: Text(state.errorMessage.toString()),
                      );
                    }
                   return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: notificationCubit.notificationsModel!.notifications!.length,
                        itemBuilder: (context, int index) {
                          return InkWell(
                            onTap:()async{
                              context.read<MeetingsCubit>().meetingsBodyModel = MeetingsBodyModel(id: notificationCubit.notificationsModel!.notifications![index].meeting!.id,name: notificationCubit.notificationsModel!.notifications![index].meeting!.name
                                  ,description: notificationCubit.notificationsModel!.notifications![index].meeting!.description,date: notificationCubit.notificationsModel!.notifications![index].meeting!.date);

                             await context.read<MeetingsCubit>().getMeetingsDetails();
                              Future.delayed(const Duration(milliseconds: 400),() {
                                context.goNamed(MeetingsDetailsScreen.routeName,
                                    pathParameters: {
                                      "meetingId": notificationCubit.notificationsModel!.notifications![index].meeting!.id.toString()
                                    });
                              },);

                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 16.w, right: 16.w,top:10.h),
                              padding: EdgeInsets.only(
                                  left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                              decoration: BoxDecoration(
                                color: AppColors.white1,
                                border: Border.all(color: AppColors.black1),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                   notificationCubit.notificationsModel!.notifications![index].meeting!.name==
                                        null
                                        ? ""
                                        : "${notificationCubit.notificationsModel!.notifications![index].meeting!.name}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(color: Colors.purpleAccent),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height:10.h,),
                                  Text(
                                    notificationCubit.notificationsModel!.notifications![index].meeting!.description ==
                                        null
                                        ? ""
                                        : "${notificationCubit.notificationsModel!.notifications![index].meeting!.description}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height:10.h,),
                                  Text(
                                    notificationCubit.notificationsModel!.notifications![index].meeting!.date ==
                                        null
                                        ? ""
                                        : "${notificationCubit.notificationsModel!.notifications![index].meeting!.date}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height:10.h,),
                                  Text(
                                    notificationCubit.notificationsModel!.notifications![index].createdAt ==
                                        null
                                        ? ""
                                        : "${notificationCubit.notificationsModel!.notifications![index].createdAt}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(color:AppColors.gray),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
              ],
            ),
          ),
      ),
    );
  }
}
