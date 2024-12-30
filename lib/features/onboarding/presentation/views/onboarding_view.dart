import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:tasky/constans.dart';
import 'package:tasky/core/utilis/styles.dart';
import 'package:tasky/features/auth/presentation/views/login_view.dart';
import 'package:tasky/features/onboarding/presentation/views/widgets/custom_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),

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
                  CutomButton(
                    title: "Let's Start",
                    icon: IconlyBold.arrow_right,
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const LoginView(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.easeInOut;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
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
