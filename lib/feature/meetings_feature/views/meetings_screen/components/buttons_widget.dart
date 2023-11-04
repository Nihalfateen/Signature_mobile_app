
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/app_button.dart';
import '../../../../../core/constants/app_colors.dart';
class MeetingsButtons extends StatelessWidget {
  const MeetingsButtons({Key? key,required this.onTap1,required this.onTap2}) : super(key: key);
  final Function onTap1;
  final Function onTap2;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BigButton(
          height: 52.h,
          width: ScreenUtil().screenWidth / 5,
          name: "Attend",
          onTap: () {
            onTap1();
          },
          containerColor: AppColors.white1,
          borderColor: AppColors.green1,
          radius: 8,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: AppColors.green1),
        ),
        BigButton(
          height: 52.h,
          width: ScreenUtil().screenWidth / 5,
          name: "Dismiss",
          onTap: () {
            onTap2();
          },
          containerColor: AppColors.white1,
          borderColor: AppColors.red1,
          radius: 8,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: AppColors.red1),
        ),
      ],
    );
  }
}
