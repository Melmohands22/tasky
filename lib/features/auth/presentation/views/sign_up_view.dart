import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/constans.dart';
import 'package:tasky/core/utilis/custom_button.dart';
import 'package:tasky/core/utilis/styles.dart';
import 'package:tasky/features/auth/presentation/manager/cubits/register_cubit/register_cubit.dart';
import 'package:tasky/features/auth/presentation/manager/cubits/register_cubit/register_state.dart';
import 'package:tasky/features/auth/presentation/views/widgets/already_have_account.dart';
import 'package:tasky/features/auth/presentation/views/widgets/sign_up_form.dart';
import 'package:tasky/features/home/presentation/views/home_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static String id = "SignUpView";

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<SignUpFormState> _signUpFormKey =
      GlobalKey<SignUpFormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisteSuccess) {
            Navigator.pushReplacementNamed(context, HomeView.id);
          } else if (state is RegisteError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          setState(() {
            isLoading = false;
          });
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign Up",
                          style:
                              Styles.textStyle24.copyWith(color: kTitleColor),
                        ),
                        SizedBox(height: 18.h),
                        SignUpForm(key: _signUpFormKey),
                        SizedBox(height: 24.h),
                        CustomButton(
                          title: 'Sign Up',
                          isLoading: isLoading,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              final formData =
                                  _signUpFormKey.currentState!.getFormData();
                              Navigator.pushNamed(context, HomeView.id);
                            }
                          },
                        ),
                        SizedBox(height: 28.h),
                        const AlreadyHaveAccount(),
                        SizedBox(height: 18.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
