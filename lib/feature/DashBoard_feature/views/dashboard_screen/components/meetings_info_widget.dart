
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawqee3_mobile_app/core/constants/app_colors.dart';

class MeetingsInfoWidget extends StatelessWidget {
  const MeetingsInfoWidget(
      {Key? key,
        required this.imageIcon,
        required this.itemText,})
      : super(key: key);
  final IconData imageIcon;
  final String itemText;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          Icon(imageIcon,color:AppColors.gray2,),
          SizedBox(
            width: 5.w,
          ),
          Text(
            tr(itemText),
            style: Theme.of(context)
                .textTheme
                .displaySmall!.copyWith(color: AppColors.gray2),
          ),
        ],
      ),
    );
  }
}