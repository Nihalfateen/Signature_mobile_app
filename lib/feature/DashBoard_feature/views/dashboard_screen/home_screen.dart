import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawqee3_mobile_app/core/constants/app_colors.dart';

import 'components/upcoming_widget.dart';

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
        elevation: 1.2,
        title: Text(
          "DashBoard",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.button),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h, left: 10.w, right: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upcoming Meetings",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(height:10.h,),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, int index) {
                  return UpcomingMeetingsWidget(
                    meetingTitle: "AAAA",
                    meetingDescription:"AA", dateText: '28-8-2023', peopleText: 'Group1', personText: 'demo1',

                  );
                },
                itemCount: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
