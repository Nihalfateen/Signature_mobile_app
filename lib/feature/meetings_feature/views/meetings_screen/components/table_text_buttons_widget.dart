import 'package:tawqee3_mobile_app/feature/meetings_feature/domain/services/meetings_cubit.dart';
import 'package:tawqee3_mobile_app/fileExport.dart';

import '../../../../../core/constants/app_colors.dart';

class ButtonsTableWidget extends StatelessWidget {
  const ButtonsTableWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final meetingsCubit = context.watch<MeetingsCubit>();
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {
              meetingsCubit.setSelectedTapWidget(0);
            },
            child: Text(
              'Details',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: meetingsCubit.selectedTap == 0
                        ? Colors.indigo
                        : AppColors.white1,
                  ),
            ),
          ),
          VerticalDivider(
            color: AppColors.black1,
            thickness: 1,
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              meetingsCubit.setSelectedTapWidget(1);
            },
            child: Text(
              'Attendance',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: meetingsCubit.selectedTap == 1
                        ? Colors.indigo
                        : AppColors.white1,
                  ),
            ),
          ),
          Spacer(),
          VerticalDivider(
            color: AppColors.black1,
            width: 25.w,
            thickness: 1,
          ),
          TextButton(
            onPressed: () {
              meetingsCubit.setSelectedTapWidget(2);
            },
            child: Text(
              'Recommendations',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: meetingsCubit.selectedTap == 2
                        ? Colors.indigo
                        : AppColors.white1,
                  ),
            ),
          ),
        ]);
  }
}
