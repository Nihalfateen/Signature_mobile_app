import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawqee3_mobile_app/core/constants/app_colors.dart';

import 'meetings_info_widget.dart';

class UpcomingMeetingsWidget extends StatelessWidget {
  const UpcomingMeetingsWidget({Key? key,required this.meetingTitle,required this.meetingDescription,required this.dateText,required this.peopleText,required this.personText}) : super(key: key);
final String?meetingTitle;
final String?meetingDescription;
final String?dateText;
final String?personText;
final String?peopleText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h,bottom:10.h),
      margin: EdgeInsets.only(left: 10.w, right: 10.w,top:15.h),
      decoration: BoxDecoration(
          color: AppColors.white1,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black12)),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$meetingTitle",style:Theme.of(context).textTheme.titleMedium!.copyWith(color:AppColors.black1),),
          SizedBox(height:10.h,),
          Row(
            children: [
              MeetingsInfoWidget(imageIcon:Icons.date_range, itemText:"$dateText",),
              SizedBox(width:10.w,),
              MeetingsInfoWidget(imageIcon:Icons.person, itemText:"$personText" ,),
              SizedBox(width:10.w,),
              MeetingsInfoWidget(imageIcon:Icons.people, itemText: "$peopleText",),
            ],
          ),
          SizedBox(height: 10.h,),
          Text("$meetingDescription",style:Theme.of(context).textTheme.titleMedium!.copyWith(color:AppColors.gray2),),
        ],
      ),
    );
  }
}
