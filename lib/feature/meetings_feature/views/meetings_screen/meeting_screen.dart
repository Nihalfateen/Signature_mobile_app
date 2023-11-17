
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawqee3_mobile_app/common/widgets/loading_widget.dart';

import '../../../../common/widgets/empty_state_widget.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/services/meetings_cubit.dart';
import 'components/meetings_card_widget.dart';
class MeetingsScreen extends StatefulWidget {
  const MeetingsScreen({Key? key}) : super(key: key);
  static const route = "/MeetingsScreen";
  @override
  State<MeetingsScreen> createState() => _MeetingsScreenState();
}

class _MeetingsScreenState extends State<MeetingsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<MeetingsCubit>().getMeetings();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final meetingsCubit = context.watch<MeetingsCubit>();
    return Scaffold(
      appBar: AppBar(
        elevation: 1.2,
        title: Text(
          "Meetings",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.button),
        ),
      ),
      body: BlocBuilder<MeetingsCubit, MeetingsState>(
  builder: (context, state) {
    if(state is MeetingsLoading){
      return const LoadingWidget();
    }
    else if(state is MeetingsEmpty){
      return Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: EmptyStateWidget(
            title: Text(
              "No Meetings Found",
              textAlign: TextAlign.center,
            )),
      );
    }
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            MeetingsCardWidget(
                    meetingsModel:meetingsCubit.meetingsModel,
                  ),
          ],
        ),
      );
  },
),
    );
  }
}
