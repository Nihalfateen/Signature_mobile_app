
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/data/model/meetings_attendance_model/meetings_attendance_model.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../data/model/meetings_model/meetings_body_model.dart';
import '../../../domain/services/meetings_cubit.dart';

class MeetingsAttendanceWidget extends StatefulWidget {
  const MeetingsAttendanceWidget({Key? key,this.meetingsAttendanceModel,this.meetingId}) : super(key: key);
  final MeetingsAttendanceModel?meetingsAttendanceModel;
  final String?meetingId;
  @override
  State<MeetingsAttendanceWidget> createState() => _MeetingsAttendanceWidgetState();
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
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.meetingsAttendanceModel!.attendanceBodyModel!.length,
                itemBuilder: (context, int index) {
                  return Container(
                    margin: EdgeInsets.only(
                        top: 15.h, left: 16.w, right: 16.w),
                    padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                        top: 10.h,
                        bottom: 10.h),
                    decoration: BoxDecoration(
                        color: AppColors.white1,
                        border: Border.all(color: AppColors.black1),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                           widget
                                .meetingsAttendanceModel!
                                .attendanceBodyModel![index]
                                .avatar !=
                                null
                                ? Image.network(
                                "https://tawqeea.com/"
                                    "${widget.meetingsAttendanceModel!.attendanceBodyModel![index].avatar}",
                                width: 45.w,
                                height: 45.h)
                                : Container(),
                            Text(
                              "${widget.meetingsAttendanceModel!.attendanceBodyModel![index].fullName}",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 8.w,
                                  right: 8.w,
                                  top: 5.h,
                                  bottom: 8.h),
                              decoration: BoxDecoration(
                                color: AppColors.green1,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "${widget.meetingsAttendanceModel!.attendanceBodyModel![index].attendanceStatus}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                    color: AppColors.black1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "${widget.meetingsAttendanceModel!.attendanceBodyModel![index].email}",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  );
                }),
          ]),
    );
  }
}
