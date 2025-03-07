import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/constans.dart';
import 'package:tasky/core/utilis/styles.dart';
import 'package:tasky/features/auth/presentation/views/widgets/have_not_account.dart';
import 'package:tasky/features/auth/presentation/views/widgets/login_form.dart';
import 'package:tasky/core/utilis/custom_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const id = "LoginView";
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
              Padding(
                padding: const EdgeInsets.only(top: 400, left: 18, right: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: Styles.textStyle24.copyWith(color: kTitleColor),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    const LoginForm(),
                    SizedBox(
                      height: 28.h,
                    ),
                    CustomButton(
                      title: 'Sign In',
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    const HaveNotAccount(),
                    SizedBox(
                      height: 18.h,
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
