import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/constans.dart';
import 'package:tasky/core/utilis/styles.dart';
import 'package:tasky/features/auth/presentation/views/sign_up_view.dart';
import 'package:tasky/features/auth/presentation/views/widgets/custom_form_field.dart';
import 'package:tasky/features/onboarding/presentation/views/widgets/custom_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const id = "LoginView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
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
                CustomTextFormField(
                  hintText: '123 456-7890',
                  prefixWidget: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Image.asset(
                          "assets/images/Iraq (IQ).png",
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                      Text(
                        "   +20  ",
                        style: Styles.textStyle14.copyWith(color: kGrayColor),
                      ),
                      const Icon(
                        CupertinoIcons.chevron_down,
                        size: 18,
                      ),
                    ],
                  ),
                  hintColor: const Color(0xffBABABA),
                  type: TextInputType.number,
                ),
                SizedBox(
                  height: 28.h,
                ),
                CustomTextFormField(
                  hintText: "Password...",
                  suffixWidget: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove_red_eye_outlined,
                        color: Color(0xffBABABA),
                      )),
                  hintColor: kGrayColor,
                ),
                SizedBox(
                  height: 28.h,
                ),
                CutomButton(
                  title: 'Sign In',
                  onTap: () {},
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn’t have any account? ",
                      style: Styles.textStyle14.copyWith(color: kGrayColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpView.id);
                      },
                      child: Text(
                        "Sign Up here",
                        style: Styles.textStyle14.copyWith(
                            color: kPurpleColor,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
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
