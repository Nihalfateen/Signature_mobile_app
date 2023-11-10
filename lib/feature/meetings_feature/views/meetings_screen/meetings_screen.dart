import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawqee3_mobile_app/common/widgets/app_button.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/domain/services/meetings_cubit.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/views/meetings_screen/components/buttons_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../DashBoard_feature/views/dashboard_screen/components/upcoming_widget.dart';
import 'components/meetings_card_widget.dart';
import 'components/table_text_buttons_widget.dart';

class MeetingsScreen extends StatefulWidget {
  const MeetingsScreen({Key? key}) : super(key: key);
  static const route = "/MeetingsScreen";
  @override
  State<MeetingsScreen> createState() => _MeetingsScreenState();
}

class _MeetingsScreenState extends State<MeetingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.2,
        title: Text(
          "Meetings",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.button),
        ),
      ),
      body: BlocConsumer<MeetingsCubit, MeetingsState>(
        listener: (context, state) {},
        buildWhen: (previous, current) {
          if (current is MeetingsInitial) {
            return true;
          }
          if (current is MeetingsAttendance) {
            return true;
          } else if (current is MeetingsRecommendations) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is MeetingsAttendance) {
            return SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      height: 52.h,
                      decoration: BoxDecoration(color: AppColors.button),
                      child: ButtonsTableWidget(
                        itemText1: 'Details',
                        itemText2: 'Attendance',
                        itemText3: 'Recommendations',
                        style1: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: AppColors.white1),
                        style2: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.indigo),
                        style3: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: AppColors.white1),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15.h),
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                          decoration: BoxDecoration(
                              color: AppColors.white1,
                              border: Border.all(color: AppColors.black1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            "Ali",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15.h),
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                          decoration: BoxDecoration(
                              color: AppColors.white1,
                              border: Border.all(color: AppColors.black1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            "Will Attend",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().screenHeight / 2,
                      child: Padding(
                          padding: EdgeInsets.only(left: 16.w, right: 16.w),
                          child: MeetingsButtons(
                            onTap1: () {},
                            onTap2: () {},
                          )),
                    )
                  ]),
            );
          }
          if (state is MeetingsRecommendations) {
            return SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      height: 52.h,
                      decoration: BoxDecoration(color: AppColors.button),
                      child: ButtonsTableWidget(
                        itemText1: 'Details',
                        itemText2: 'Attendance',
                        itemText3: 'Recommendations',
                        style1: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: AppColors.white1),
                        style2: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: AppColors.white1),
                        style3: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.indigo),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 15.h, left: 16.w, right: 16.w),
                      padding: EdgeInsets.only(
                          left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                      decoration: BoxDecoration(
                          color: AppColors.white1,
                          border: Border.all(color: AppColors.black1),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        "Ali",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 15.h, left: 16.w, right: 16.w),
                      padding: EdgeInsets.only(
                          left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                      decoration: BoxDecoration(
                          color: AppColors.white1,
                          border: Border.all(color: AppColors.black1),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        "comment",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ]),
            );
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    height: 52.h,
                    decoration: BoxDecoration(color: AppColors.button),
                    child: ButtonsTableWidget(
                      itemText1: 'Details',
                      itemText2: 'Attendance',
                      itemText3: 'Recommendations',
                      style1: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: AppColors.white1),
                      style2: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: AppColors.white1),
                      style3: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: AppColors.white1),
                    )),
                SizedBox(
                  height: 10.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, int index) {
                    return InkWell(
                      onTap: () {},
                      child: MeetingsCardWidget(
                        meetingTitle: "AAAA",
                        meetingDescription: "AA",
                        dateText: '28-8-2023',
                        peopleText: 'Group1',
                        personText: 'demo1',
                        flagTitle: 'planned',
                      ),
                    );
                  },
                  itemCount: 3,
                ),
              ],
            ),
          );
        },
      ),
    );
    ;
  }
}
