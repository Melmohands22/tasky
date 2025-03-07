import 'package:flutter/material.dart';
import 'package:tasky/constans.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Color hintColor;
  final TextInputType? type;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixWidget;
  final Widget? prefixWidget;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.hintColor,
    this.type,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.suffixWidget,
    this.prefixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: kGrayColor),
        suffixIcon: suffixWidget,
        prefixIcon: prefixWidget,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      ),
      validator: validator,
    );
  }
}
