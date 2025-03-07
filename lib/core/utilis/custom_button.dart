import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/constans.dart';
import 'package:tasky/core/utilis/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.icon,
    required this.onTap,
     this.isLoading,
  });
  final String title;
  final IconData? icon;
  final VoidCallback onTap;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 331.w,
        height: 49.h,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: Color(0xff5F33E1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Styles.textStyle19.copyWith(color: kPrimaryColor),
            ),
            SizedBox(
              width: 8.w,
            ),
            Icon(
              icon,
              color: kPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}
