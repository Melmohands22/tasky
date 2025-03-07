
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/utilis/styles.dart';

class OnboardingText extends StatelessWidget {
  const OnboardingText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Task Management &",
          style: Styles.textStyle24,
        ),
        Text(
          "To-Do List",
          style: Styles.textStyle24,
        ),
        SizedBox(
          height: 28.h,
        ),
        Text(
          "This productive tool is designed to help \n you better manage your task\n project-wise conveniently! ",
          style: Styles.textStyle14.copyWith(
            color: const Color(0xff6E6A7C),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
