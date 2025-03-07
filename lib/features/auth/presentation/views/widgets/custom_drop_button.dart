import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:tasky/constans.dart';
import 'package:tasky/core/utilis/styles.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton(
      {super.key,
      required this.option1,
      required this.option2,
      required this.option3,
      this.prefixIcon = false,
      this.filled = false,
      this.onChanged,
      this.hintText,
      required this.value,
      required this.option4});
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String? value;
  final String? hintText;
  final bool filled;
  final bool prefixIcon;
  final Function(String?)? onChanged;
  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 326.w,
      height: 50.h,
      child: DropdownButtonFormField(
        validator: (value) {
          if (value == null) {
            return 'Please select your experience level';
          }
          return null;
        },
        icon: widget.filled
            ? Icon(IconlyBold.arrow_down_2, size: 20, color: kPrimaryColor)
            : const Icon(CupertinoIcons.chevron_down, size: 20),
        hint: widget.filled
            ? Text(
                "${widget.hintText}",
                style: Styles.textStyle16.copyWith(color: kPrimaryColor),
              )
            : Text(
                'Choose experience Level',
                style: Styles.textStyle14.copyWith(
                  color: Color(0xff2F2F2F),
                ),
              ),
        decoration: InputDecoration(
          prefix: widget.prefixIcon
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child:
                      Icon(CupertinoIcons.flag, size: 20, color: kPurpleColor))
              : null,
          filled: widget.filled,
          fillColor: widget.filled ? kPrimaryColor : null,
          border: widget.filled
              ? OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
        ),
        value: widget.value,
        onChanged: widget.onChanged,
        items: <String>[
          widget.option1,
          widget.option2,
          widget.option3,
          widget.option4
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,
                style: widget.filled
                    ? Styles.textStyle16.copyWith(color: kPrimaryColor)
                    : null),
          );
        }).toList(),
      ),
    );
  }
}
