import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/data/model/sheet_model.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/domain/services/meetings_cubit.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../DashBoard_feature/views/dashboard_screen/components/meetings_info_widget.dart';

class MeetingsCardWidget extends StatelessWidget {
  const MeetingsCardWidget(
      {Key? key,
      required this.meetingTitle,
      required this.meetingDescription,
      required this.dateText,
      required this.peopleText,
      required this.personText,
      required this.flagTitle})
      : super(key: key);
  final String? meetingTitle;
  final String? meetingDescription;
  final String? dateText;
  final String? personText;
  final String? peopleText;
  final String? flagTitle;

  @override
  Widget build(BuildContext context) {
    final meetingsCubit = context.watch<MeetingsCubit>();
    return Container(
      padding:
          EdgeInsets.only(left: 5.w, right: 5.w, top: 10.h, bottom: 10.h),
      margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h),
      decoration: BoxDecoration(
          color: AppColors.white1,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black12)),
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
              SizedBox(width:ScreenUtil().screenWidth/8,),
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
                width: 30.w,
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
                    iconEnabledColor: Colors.black,
                    iconDisabledColor: Colors.black,
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
          SizedBox(height:10.h,),
          MeetingsInfoWidget(
            imageIcon: Icons.people,
            itemText: "$peopleText",
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
        ],
      ),
    );
  }
}
