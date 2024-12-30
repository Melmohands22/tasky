import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/constans.dart';
import 'package:tasky/core/utilis/styles.dart';
import 'package:tasky/features/auth/presentation/views/login_view.dart';
import 'package:tasky/features/auth/presentation/views/widgets/custom_form_field.dart';
import 'package:tasky/features/onboarding/presentation/views/widgets/custom_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static String id = "SignUpView";

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? selectedExperience;

  final List<String> experienceLevels = [
    'Fresh',
    'Junior',
    'MidLevel',
    'Senior',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: 482.h,
              width: double.infinity,
              child: Image.asset(
                "assets/images/Frame 4.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 300.h),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign Up",
                      style: Styles.textStyle24.copyWith(color: kTitleColor),
                    ),
                    SizedBox(height: 18.h),
                    const CustomTextFormField(
                      hintText: "Name...",
                      hintColor: kGrayColor,
                    ),
                    SizedBox(height: 18.h),
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
                            style:
                                Styles.textStyle14.copyWith(color: kGrayColor),
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
                    SizedBox(height: 18.h),
                    const CustomTextFormField(
                      hintText: "Years of experience...",
                      hintColor: kGrayColor,
                    ),
                    SizedBox(height: 18.h),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12.h,
                          horizontal: 12.w,
                        ),
                        hintText: "Choose Experience Level",
                        hintStyle: Styles.textStyle14.copyWith(
                          color: const Color(0xff2F2F2F),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide:
                              const BorderSide(color: kGrayColor, width: 1),
                        ),
                      ),
                      value: selectedExperience,
                      items: experienceLevels
                          .map((level) => DropdownMenuItem<String>(
                                value: level,
                                child: Text(
                                  level,
                                  style: Styles.textStyle14.copyWith(
                                    color: kGrayColor,
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedExperience = value;
                        });
                      },
                      icon: const Icon(
                        CupertinoIcons.chevron_down,
                        color: kGrayColor,
                        size: 20,
                      ),
                    ),
                    SizedBox(height: 18.h),
                    const CustomTextFormField(
                      hintText: "Address...",
                      hintColor: kGrayColor,
                    ),
                    SizedBox(height: 18.h),
                    CustomTextFormField(
                      hintText: "Password...",
                      suffixWidget: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Color(0xffBABABA),
                        ),
                      ),
                      hintColor: kGrayColor,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CutomButton(
                      title: 'Sign Up',
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have any account? ",
                          style: Styles.textStyle14.copyWith(color: kGrayColor),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, LoginView.id);
                          },
                          child: Text(
                            "Sign in",
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
            ),
          ],
        ),
      ),
    );
  }
}
