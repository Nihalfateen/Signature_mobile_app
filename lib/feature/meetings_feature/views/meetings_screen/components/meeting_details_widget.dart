import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/data/model/meetings_model/meetings_body_model.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/data/model/sheet_model.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/domain/services/meetings_cubit.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../DashBoard_feature/views/dashboard_screen/components/meetings_info_widget.dart';

class MeetingsDetailsWidget extends StatefulWidget {
  final MeetingsBodyModel? meetingsBodyModel;
final String?meetingId;
  const MeetingsDetailsWidget({Key? key, this.meetingsBodyModel,this.meetingId}): super(key: key);

  @override
  State<MeetingsDetailsWidget> createState() => _MeetingsDetailsWidgetState();
}

class _MeetingsDetailsWidgetState extends State<MeetingsDetailsWidget> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<MeetingsCubit>().getMeetingsDetails(widget.meetingId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final meetingsCubit = context.watch<MeetingsCubit>();
    return Padding(
      padding:
          EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.meetingsBodyModel!.name}",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.black1),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: 8.w, right: 8.w, top: 5.h, bottom: 8.h),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent.withOpacity(.23),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  "${widget.meetingsBodyModel!.status}",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.purple, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              MeetingsInfoWidget(
                imageIcon: Icons.date_range,
                itemText: "${widget.meetingsBodyModel!.date}",
              ),
              SizedBox(
                width: 10.w,
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.only(
                    left: 8.w, right: 8.w, top: 5.h, bottom: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.green1,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "${widget.meetingsBodyModel!.status}",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.black1, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 25.w,
                child: DropdownButtonFormField<SheetModel>(
                    hint: Text(
                      "",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColors.orange0, fontSize: 10.sp),
                    ),
                    value: meetingsCubit.selectedChoice,
                    iconSize: 20.sp,
                    iconEnabledColor: AppColors.black1,
                    iconDisabledColor: AppColors.black1,
                    icon: Padding(
                        padding: EdgeInsets.only(left: 0.h),
                        child: Icon(Icons.more_vert)),
                    isDense: true,
                    isExpanded: true,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        )),
                    onChanged: (value) {},
                    items: meetingsCubit.sheetList.map((SheetModel val) {
                      return DropdownMenuItem(
                          value: val,
                          child: Text(
                            val.nameAr!,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  color: AppColors.black1,
                                  fontSize: 10.sp,
                                ),
                          ));
                    }).toList()),
              )
            ],
          ),
          SizedBox(
            width: 10.w,
          ),
          Row(
            children: [
              MeetingsInfoWidget(
                imageIcon: Icons.people,
                itemText: "${widget.meetingsBodyModel!.groupsNames}",
              ),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: AppColors.gray2,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "${widget.meetingsBodyModel!.leaderName}",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: AppColors.gray2),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "Description",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.black1),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "${widget.meetingsBodyModel!.description}",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.gray2),
          ),
          Divider(
            color: AppColors.gray7,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "meeting Body",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.black1),
          ),
          SizedBox(
            height: 8.h,
          ),
          Html(
            data: "${widget.meetingsBodyModel!.meetingBody}",
          ),
          Divider(
            color: AppColors.gray7,
          ),
          Text(
            "Meeting Items",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.black1),
          ),
          SizedBox(
            height: 10.h,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.meetingsBodyModel!.items!.length,
              itemBuilder: (context, int index) {
                return Container(
                  margin: EdgeInsets.only(left: 16.w, right: 16.w),
                  padding: EdgeInsets.only(
                      left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                  decoration: BoxDecoration(
                    color: AppColors.white1,
                    border: Border.all(color: AppColors.black1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width:ScreenUtil().screenWidth/2.5,
                            child: Text(
                              widget.meetingsBodyModel!.items![index]
                                          .description ==
                                      null
                                  ? ""
                                  : "${widget.meetingsBodyModel!.items![index].description}",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            widget.meetingsBodyModel!.items![index].number ==
                                    null
                                ? ""
                                : "${widget.meetingsBodyModel!.items![index].number}",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
