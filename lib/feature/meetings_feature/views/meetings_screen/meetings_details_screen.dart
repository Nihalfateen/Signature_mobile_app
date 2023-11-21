import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/views/meetings_screen/components/meetings_attendance_widget.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/views/meetings_screen/components/meetings_recommendations_widget.dart';

import '../../../../common/widgets/empty_state_widget.dart';
import '../../../../common/widgets/loading_widget.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/services/meetings_cubit.dart';
import 'components/meeting_details_widget.dart';
import 'components/table_text_buttons_widget.dart';

class MeetingsDetailsScreen extends StatefulWidget {
  const MeetingsDetailsScreen({Key? key, this.meetingId}) : super(key: key);
  static const routePath = "MeetingsDetailsScreen/:meetingId";
  static const routeName = "MeetingsDetailsScreen";
  final String? meetingId;
  @override
  State<MeetingsDetailsScreen> createState() => _MeetingsDetailsScreenState();
}

class _MeetingsDetailsScreenState extends State<MeetingsDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<MeetingsCubit>().setSelectedTapWidget(0);
    context.read<MeetingsCubit>().getMeetingsDetails();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final meetingsCubit = context.watch<MeetingsCubit>();
    return Scaffold(body: BlocBuilder<MeetingsCubit, MeetingsState>(
      builder: (context, state) {
        if (state is MeetingsAttendanceEmpty) {
          return Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: EmptyStateWidget(
                title: Text(
              "No Meetings Found",
              textAlign: TextAlign.center,
            )),
          );
        }else if(state is MeetingsDetailsLoading){
          return const LoadingWidget();
        }else if(state is MeetingsAttendanceLoading){
          return const LoadingWidget();
        }
        return SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.only(
              left: 10.w,
              right: 10.w,
            ),
            margin: EdgeInsets.only(top: 40.h),
            height: 52.h,
            decoration: BoxDecoration(color: AppColors.button),
            child: ButtonsTableWidget(),
          ),
          if (meetingsCubit.selectedTap == 0)
            MeetingsDetailsWidget(
              meetingsBodyModel: meetingsCubit.meetingsBodyModel,
              meetingId: widget.meetingId,
            ),
          if (meetingsCubit.selectedTap == 1)
            MeetingsAttendanceWidget(
              meetingsAttendanceModel: meetingsCubit.meetingsAttendanceModel,
              meetingId: widget.meetingId,
            ),
          if (meetingsCubit.selectedTap == 2) MeetingsRecommendationsWidget()
        ]));
      },
    ));
  }
}
