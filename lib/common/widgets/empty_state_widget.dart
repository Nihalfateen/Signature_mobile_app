
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({Key ?key,required this.title,this.subtitle}) : super(key: key);
  final Widget title;
  final Widget ?subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child:Icon(Icons.search,size: 40,),
        ),
        SizedBox(height: 20.h,),
        title,
        SizedBox(height: 15.h,),
        if (subtitle != null)
          subtitle!
      ],
    );
  }
}