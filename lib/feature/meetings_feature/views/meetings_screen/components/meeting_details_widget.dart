import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/data/model/sheet_model.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/domain/services/meetings_cubit.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../DashBoard_feature/views/dashboard_screen/components/meetings_info_widget.dart';

class MeetingsDetailsWidget extends StatelessWidget {
  const MeetingsDetailsWidget(
      {Key? key,
        required this.meetingTitle,
        required this.meetingDescription,
        required this.dateText,
        required this.peopleText,
        required this.personText,
        required this.meetingBody,
        required this.statusTitle,
        required this.flagTitle})
      : super(key: key);
  final String? meetingTitle;
  final String? meetingDescription;
  final String? dateText;
  final String? personText;
  final String? peopleText;
  final String? flagTitle;
  final String? statusTitle;
  final String? meetingBody;

  @override
  Widget build(BuildContext context) {
    final meetingsCubit = context.watch<MeetingsCubit>();
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$meetingTitle",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.black1),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Container(
                padding:EdgeInsets.only(left:8.w,right:8.w,top:5.h,bottom:8.h),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent.withOpacity(.23),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  "$flagTitle",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.purple, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              MeetingsInfoWidget(
                imageIcon: Icons.date_range,
                itemText: "$dateText",
              ),
              SizedBox(
                width: 10.w,
              ),
              MeetingsInfoWidget(
                imageIcon: Icons.person,
                itemText: "$personText",
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                padding:EdgeInsets.only(left:8.w,right:8.w,top:5.h,bottom:8.h),
                decoration: BoxDecoration(
                  color: AppColors.green1,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "$statusTitle",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.black1, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 25.w,
                child: DropdownButtonFormField<
                    SheetModel>(
                    hint: Text(
                      "",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(
                          color: AppColors.orange0,
                          fontSize: 10.sp),
                    ),
                    value: meetingsCubit.selectedChoice,
                    iconSize: 20.sp,
                    iconEnabledColor:  AppColors.black1,
                    iconDisabledColor:  AppColors.black1,
                    icon: Padding(padding: EdgeInsets.only(left: 0.h),child: Icon(Icons.more_vert)),
                    isDense: true,
                    isExpanded: true,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        )
                    ),
                    onChanged: (value) {

                    },
                    items: meetingsCubit.sheetList
                        .map((SheetModel val) {
                      return DropdownMenuItem(
                          value: val,
                          child: Text(
                            val.nameAr!,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                              color: AppColors.black1,
                              fontSize: 10.sp,
                            ),
                          )
                      );
                    }).toList()),
              )
            ],
          ),
          SizedBox(
            width: 10.w,
          ),
          MeetingsInfoWidget(
            imageIcon: Icons.people,
            itemText: "$peopleText",
          ),

          SizedBox(
            height: 15.h,
          ),
          Text(
            "Description",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color:AppColors.black1),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "$meetingDescription",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.gray2),
          ),
          Divider(color:AppColors.gray7,),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "meeting Body",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color:AppColors.black1),
          ),
          SizedBox(height:8.h,),
          Text(
            "$meetingBody",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.gray2),
          ),
          Divider(color:AppColors.gray7,),
        ],
      ),
    );
  }
}
