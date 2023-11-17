
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';
import 'buttons_widget.dart';

class MeetingsRecommendationsWidget extends StatefulWidget {
  const MeetingsRecommendationsWidget({Key? key}) : super(key: key);

  @override
  State<MeetingsRecommendationsWidget> createState() => _MeetingsRecommendationsWidgetState();
}

class _MeetingsRecommendationsWidgetState extends State<MeetingsRecommendationsWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15.h),
              padding: EdgeInsets.only(
                  left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
              decoration: BoxDecoration(
                  color: AppColors.white1,
                  border: Border.all(color: AppColors.black1),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Text(
                    "",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
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
    );;
  }
}
