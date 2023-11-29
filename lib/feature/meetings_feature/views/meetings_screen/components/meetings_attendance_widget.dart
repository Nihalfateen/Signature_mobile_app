import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/data/model/meetings_attendance_model/meetings_attendance_model.dart';
import 'package:grouped_list/grouped_list.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../data/model/meetings_attendance_model/meetings_attendance_body_model.dart';

class MeetingsAttendanceWidget extends StatefulWidget {
  const MeetingsAttendanceWidget(
      {Key? key, this.meetingsAttendanceModel, this.meetingId})
      : super(key: key);
  final MeetingsAttendanceModel? meetingsAttendanceModel;
  final String? meetingId;
  @override
  State<MeetingsAttendanceWidget> createState() =>
      _MeetingsAttendanceWidgetState();
}

class _MeetingsAttendanceWidgetState extends State<MeetingsAttendanceWidget> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GroupedListView<AttendanceBodyModel, String>(
            elements: widget.meetingsAttendanceModel!.attendanceBodyModel!,
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            groupBy: (element) => element.attendanceStatus!,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            groupComparator: (value1, value2) => value2.compareTo(value1),
            itemComparator: (item1, item2) =>
                item1.attendanceStatus!.compareTo(item2.attendanceStatus!),
            order: GroupedListOrder.ASC,
            useStickyGroupSeparators: true,
            groupSeparatorBuilder: (String value) {
              return Padding(
                padding: EdgeInsets.only(
                    left: 16.w, right: 16.w, top: 16.h, bottom: 12.h),
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.black1, fontWeight: FontWeight.w700),
                ),
              );
            },
            stickyHeaderBackgroundColor: Colors.transparent,
            separator: SizedBox(
              height: 16.h,
            ),
            itemBuilder: (c, element) {
              return Container(
                margin: EdgeInsets.only(top: 15.h, left: 16.w, right: 16.w),
                padding: EdgeInsets.only(
                    left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                decoration: BoxDecoration(
                    color: AppColors.white1,
                    border: Border.all(color: AppColors.black1),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    element.avatar != null
                        ? Image.network(
                            "https://tawqeea.com/"
                            "${element.avatar}",
                            width: 45.w,
                            height: 45.h)
                        : Container(),
                    Text(
                      "${element.fullName}",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "${element.email}",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              );
            }

            // ListView.builder(
            //     shrinkWrap: true,
            //     physics: NeverScrollableScrollPhysics(),
            //     itemCount: widget.meetingsAttendanceModel!.attendanceBodyModel!.length,
            //     itemBuilder: (context, int index) {
            //       return Container(
            //         margin: EdgeInsets.only(
            //             top: 15.h, left: 16.w, right: 16.w),
            //         padding: EdgeInsets.only(
            //             left: 10.w,
            //             right: 10.w,
            //             top: 10.h,
            //             bottom: 10.h),
            //         decoration: BoxDecoration(
            //             color: AppColors.white1,
            //             border: Border.all(color: AppColors.black1),
            //             borderRadius: BorderRadius.circular(8)),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Row(
            //               children: [
            //                widget
            //                     .meetingsAttendanceModel!
            //                     .attendanceBodyModel![index]
            //                     .avatar !=
            //                     null
            //                     ? Image.network(
            //                     "https://tawqeea.com/"
            //                         "${widget.meetingsAttendanceModel!.attendanceBodyModel![index].avatar}",
            //                     width: 45.w,
            //                     height: 45.h)
            //                     : Container(),
            //                 Text(
            //                   "${widget.meetingsAttendanceModel!.attendanceBodyModel![index].fullName}",
            //                   style: Theme.of(context)
            //                       .textTheme
            //                       .displaySmall!
            //                       .copyWith(color: Colors.black),
            //                   textAlign: TextAlign.center,
            //                 ),
            //                 Spacer(),
            //                 Container(
            //                   padding: EdgeInsets.only(
            //                       left: 8.w,
            //                       right: 8.w,
            //                       top: 5.h,
            //                       bottom: 8.h),
            //                   decoration: BoxDecoration(
            //                     color: AppColors.green1,
            //                     borderRadius: BorderRadius.circular(8),
            //                   ),
            //                   child: Text(
            //                     "${widget.meetingsAttendanceModel!.attendanceBodyModel![index].attendanceStatus}",
            //                     style: Theme.of(context)
            //                         .textTheme
            //                         .titleSmall!
            //                         .copyWith(
            //                         color: AppColors.black1,
            //                         fontWeight: FontWeight.bold),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             SizedBox(height: 10.h),
            //             Text(
            //               "${widget.meetingsAttendanceModel!.attendanceBodyModel![index].email}",
            //               style: Theme.of(context)
            //                   .textTheme
            //                   .displaySmall!
            //                   .copyWith(color: Colors.black),
            //               textAlign: TextAlign.left,
            //             ),
            //           ],
            //         ),
            //       );
            //     }),
            )
      ]),
    );
  }
}
