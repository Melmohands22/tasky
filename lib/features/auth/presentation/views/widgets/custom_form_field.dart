import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixWidget,
    this.suffixWidget,
    required this.hintColor,
    this.type,
  });

  final String hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Color hintColor;
  final TextInputType? type;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      decoration: InputDecoration(
        suffixIcon: suffixWidget,
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor),
        prefixIcon: prefixWidget != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  prefixWidget!,
                  SizedBox(width: 8.w),
                ],
              )
            : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(color: Color(0xffBABABA)),
        ),
      ),
    );
  }
}
