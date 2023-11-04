
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawqee3_mobile_app/core/constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const route = "/HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation:1.2,
        title: Text("Dash board",style:Theme.of(context).textTheme.titleMedium!.copyWith(color:Colors.black),),
    ),
            body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top:50.h,left: 16.w,right: 16.w),
          child: Column(
            children: [
              Text("Upcoming Meetings",style: Theme.of(context).textTheme.displaySmall,)

            ],

          ),
        ),
    ),
    );
  }
}
