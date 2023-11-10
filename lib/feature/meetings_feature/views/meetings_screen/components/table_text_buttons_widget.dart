



import 'package:tawqee3_mobile_app/feature/meetings_feature/domain/services/meetings_cubit.dart';
import 'package:tawqee3_mobile_app/fileExport.dart';

import '../../../../../core/constants/app_colors.dart';


class ButtonsTableWidget extends StatelessWidget {
  const ButtonsTableWidget({Key? key,required this.itemText1,required this.itemText2,required this.itemText3,required this.style1,this.style2,this.style3}) : super(key: key);
  final String itemText1;
  final String itemText2;
  final String itemText3;
  final TextStyle style1;
  final TextStyle? style2;
  final TextStyle? style3;
  @override
  Widget build(BuildContext context) {
    final meetingsCubit = context.watch<MeetingsCubit>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
         onPressed: () {}, child: Text(itemText1,style:style1,),
        ),
        VerticalDivider(
          color: AppColors.black1,
          thickness: 1,
        ),
        Spacer(),
        TextButton(
          onPressed: () { meetingsCubit.attendanceMeetings();}, child: Text(itemText2,style:style2,),
        ),
        Spacer(),
        VerticalDivider(
          color: AppColors.black1,
          width: 25.w,
          thickness: 1,
        ),
        TextButton(
          onPressed: () { meetingsCubit.recommendationsMeetings();}, child: Text(itemText3,style:style3,),
        ),
    ]
    );
  }
}
