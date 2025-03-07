import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:tasky/constans.dart';
import 'package:tasky/features/auth/presentation/views/login_view.dart';
import 'package:tasky/core/utilis/custom_button.dart';
import 'package:tasky/features/onboarding/presentation/views/widgets/onboarding_text.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            SizedBox(
              height: 482.h,
              width: 408.w,
              child: Image.asset(
                kBackGroundImage,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 480,
                ),
                child: Column(
                  children: [
                    const OnboardingText(),
                    SizedBox(
                      height: 28.h,
                    ),
                    CustomButton(
                      title: "Let's Start",
                      icon: IconlyBold.arrow_right,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const LoginView(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
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
                      height: 58.h,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
