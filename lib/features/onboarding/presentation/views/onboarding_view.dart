import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:tasky/constans.dart';
import 'package:tasky/core/utilis/styles.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 482.h,
              width: 408.w,
              child: Image.asset(
                kBackGroundImage,
              ),
            ),
            Center(
              child: Column(
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
                  SizedBox(
                    height: 28.h,
                  ),
                  Container(
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
                          "Let's Start",
                          style:
                              Styles.textStyle19.copyWith(color: kPrimaryColor),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        const Icon(
                          IconlyBold.arrow_right,
                          color: kPrimaryColor,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 36.h,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
