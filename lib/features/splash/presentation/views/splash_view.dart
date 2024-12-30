import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/features/onboarding/presentation/views/onboarding_view.dart';
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingView()),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xff5F33E1),
      body: Center(
        child: SizedBox(
          height: 45.h,
          width: 124.w,
          child: Image.asset('assets/images/Group 9.png')),
      ),
    );
  }
}
