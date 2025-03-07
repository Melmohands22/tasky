
import 'package:flutter/material.dart';
import 'package:tasky/constans.dart';
import 'package:tasky/core/utilis/styles.dart';
import 'package:tasky/features/auth/presentation/views/login_view.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
