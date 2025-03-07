import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:tasky/constans.dart';
import 'package:tasky/core/utilis/phone_field.dart';
import 'package:tasky/core/utilis/styles.dart';
import 'package:tasky/features/auth/presentation/views/widgets/custom_drop_button.dart';
import 'package:tasky/features/auth/presentation/views/widgets/custom_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController experienceYearsController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();

  String? selectedExperience;
  bool isPasswordVisible = false;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    experienceYearsController.dispose();
    addressController.dispose();
    passwordController.dispose();
    displayNameController.dispose();
    super.dispose();
  }

  Map<String, String> getFormData() {
    return {
      'name': nameController.text.trim(),
      'phone': phoneController.text.trim(),
      'experienceYears': experienceYearsController.text.trim(),
      'experienceLevel': selectedExperience ?? '',
      'address': addressController.text.trim(),
      'password': passwordController.text,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTextFormField(
          controller: nameController,
          hintText: "Name...",
          validator: (value) => value!.isEmpty ? "Name is required" : null,
        ),
        SizedBox(height: 18.h),
        PhoneNumberField(
        controller: phoneController,
        validator: (phoneNumber) {
          if (phoneNumber == null || phoneNumber.completeNumber.isEmpty) {
            return 'Phone number is required';
          }
          return null;
        },
      ),
        SizedBox(height: 18.h),
        _buildTextFormField(
          controller: experienceYearsController,
          hintText: "Years of experience...",
          keyboardType: TextInputType.number,
          validator: (value) =>
              value!.isEmpty ? "Years of experience is required" : null,
        ),
        SizedBox(height: 18.h),
        SizedBox(
          height: 50.h,
          child: CustomDropDownButton(
            option1: 'fresh',
            option2: 'junior',
            option3: 'midLevel',
            option4: 'senior',
            value: selectedExperience,
            onChanged: (String? newValue) {
              setState(() {
                selectedExperience = newValue;
              });
            },
          ),
        ),
        SizedBox(height: 18.h),
        _buildTextFormField(
          controller: addressController,
          hintText: "Address...",
          validator: (value) => value!.isEmpty ? "Address is required" : null,
        ),
        SizedBox(height: 18.h),
        _buildPasswordField(),
      ],
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    return CustomTextFormField(
      controller: controller,
      hintText: hintText,
      hintColor: kGrayColor,
      type: keyboardType,
      validator: validator,
    );
  }

  Widget _buildPasswordField() {
    return CustomTextFormField(
      controller: passwordController,
      hintText: "Password...",
      hintColor: kGrayColor,
      obscureText: !isPasswordVisible,
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
    );
  }
}
