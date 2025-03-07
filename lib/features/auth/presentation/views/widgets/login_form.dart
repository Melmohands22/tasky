import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/constans.dart';
import 'package:tasky/core/utilis/phone_field.dart';
import 'package:tasky/core/utilis/styles.dart';
import 'package:tasky/features/auth/presentation/views/widgets/custom_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PhoneNumberField(controller: phoneController),
        SizedBox(
          height: 28.h,
        ),
        CustomTextFormField(
          hintText: "Password...",
          hintColor: kGrayColor,
          obscureText: !isPasswordVisible,
          controller: passwordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Password is required";
            }
            if (value.length < 6) {
              return "Password must be at least 6 characters";
            }
            return null;
          },
          suffixWidget: IconButton(
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
            icon: Icon(
              isPasswordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: const Color(0xffBABABA),
            ),
          ),
        ),
      ],
    );
  }
}
