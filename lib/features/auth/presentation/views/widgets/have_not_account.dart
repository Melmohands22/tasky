import 'package:flutter/material.dart';
import 'package:tasky/constans.dart';
import 'package:tasky/core/utilis/styles.dart';
import 'package:tasky/features/auth/presentation/views/sign_up_view.dart';

class HaveNotAccount extends StatelessWidget {
  const HaveNotAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
