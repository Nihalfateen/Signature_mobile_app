import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawqee3_mobile_app/common/widgets/loading_widget.dart';
import 'package:tawqee3_mobile_app/core/constants/app_colors.dart';
import 'package:tawqee3_mobile_app/feature/DashBoard_feature/domain/services/home_cubit.dart';

import '../../../../common/widgets/empty_state_widget.dart';
import '../../../meetings_feature/domain/services/meetings_cubit.dart';
import 'components/upcoming_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const route = "/HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    context.read<HomeCubit>().getUpcomingMeetings();
    super.initState();
  }
  Widget build(BuildContext context) {
    final homeCubit = context.watch<HomeCubit>();
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
          child: BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    if(state is UpcomingMeetingsLoading){
      return const LoadingWidget();
    }
    else if (state is UpcomingMeetingsEmpty) {
      return Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: EmptyStateWidget(
            title: Text(
              "No Upcoming Meetings Found",
              textAlign: TextAlign.center,
            )),
      );
    }
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upcoming Meetings",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(height:10.h,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, int index) {
                  return UpcomingMeetingsWidget(
                    meetingTitle: "${homeCubit.meetingsModel!.meetingsBodyModel![index].name}",
                    meetingDescription:"${homeCubit.meetingsModel!.meetingsBodyModel![index].description}", dateText: "${homeCubit.meetingsModel!.meetingsBodyModel![index].date}", peopleText: "${homeCubit.meetingsModel!.meetingsBodyModel![index].groupsNames}", personText: "${homeCubit.meetingsModel!.meetingsBodyModel![index].leaderName}",

                  );
                },
                itemCount: homeCubit.meetingsModel!.meetingsBodyModel!.length,
              )
            ],
          );
  },
),
        ),
      ),
    );
  }
}
