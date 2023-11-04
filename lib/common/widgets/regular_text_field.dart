import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';

class RegularTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final hintText;
  final prefix;
  final suffix;
  final TextInputType? keyboardType;
  final bool protectedText;
  final bool? mandatory;
  final bool noBorder;
  final Color? fillColor;
  // final Color inputColor;
  final Color? cursorColor;
  // final Color hintColor;
  final Color? labelColor;
  final TextStyle?style;
  final TextStyle?styleController;
  final TextStyle?labelStyle;
  final String? Function(String?)? validator;
  final bool description;
  final inputFormatters;
  final bool email;
  final bool password;
  final bool readOnly;
  final Function? onTap;
  final FocusNode? focusNode;
  final String Function(String?)? onSaved;
  final TextInputAction?textInputAction;
  final String Function(String?)? onChange;
  String ?errorMessage;
  Color? enableBorderColor;
  RegularTextField(
      {this.keyboardType,
        this.labelStyle,
        this.label,
        this.styleController,
        this.style,
        this.controller,
        this.textInputAction,
        this.noBorder = false,
        this.fillColor,
        this.cursorColor,
        this.labelColor,
        this.hintText = "Enter data here",
        this.prefix,
        this.suffix,
        this.protectedText = false,
        this.mandatory = false,
        this.description = false,
        this.inputFormatters,
        this.email = false,
        this.password = false,
        this.readOnly = false,
        this.validator,
        this.onTap,
        this.onSaved,
        this.onChange,
        this.errorMessage,
        this.enableBorderColor,
        this.focusNode
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (label != null)
              Text(
                  label!,
                  style: labelStyle??Theme.of(context).textTheme.displayMedium
              ),
            if (mandatory!)
              Padding(
                padding: EdgeInsets.only(left: 5.w,right: 5.w),
                child: Text(
                  '*',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.red1),
                ),
              ),
          ],
        ),
        Padding(
          padding:  EdgeInsets.only(top: 13.h),
          child: TextFormField(
            readOnly: readOnly,
            validator: validator,
            controller: controller,
            cursorColor: cursorColor,
            keyboardType: keyboardType,
            onTap: onTap as void Function()?,
            obscureText: protectedText,
            maxLines: description ? 5 : 1,
            focusNode:focusNode,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            style:styleController?? Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
                isDense: true,

                filled: fillColor != null,
                // contentPadding: EdgeInsets.all(17),
                prefix: prefix ?? null,
                suffixIcon: suffix,
                suffixIconConstraints: BoxConstraints(maxHeight: 55.h,minHeight: 30,maxWidth: 100,minWidth: 50),

                fillColor: fillColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                      color: noBorder ? Colors.transparent : Colors.black,
                      width: noBorder ? 0.0 : 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                      color: noBorder ? Colors.transparent :enableBorderColor?? const Color(0xFFC5CACD),
                      width: noBorder ? 0.0 : 1.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                      color: noBorder ? Colors.transparent : Colors.red,
                      width: noBorder ? 4.0 : 1.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                      color: noBorder ? Colors.transparent : AppColors.red1,
                      width: noBorder ? 4.0 : 1.0),
                ),
                hintText: hintText,
                hintStyle:style??Theme.of(context).textTheme.labelSmall,
                errorText: errorMessage,
                errorMaxLines: 3
            ),
            onSaved: onSaved,
            onChanged:onChange ,
            obscuringCharacter: '*',
          ),
        ),
      ],
    );
  }
}