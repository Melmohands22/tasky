import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:tasky/constans.dart';
class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({
    super.key,
    required this.controller,
    required this.validator,
  });
  final TextEditingController controller;
  final String? Function(PhoneNumber?) validator;

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    String initialCountryCode = 'EG';
    var country = countries.firstWhere((element) => element.code == initialCountryCode);

    return SizedBox(
      height: 50.h,
      width: 326.w,
      child: IntlPhoneField(
        onSaved: (phoneNumber) {
          widget.controller.text = phoneNumber?.completeNumber ?? '';
        },
        controller: widget.controller,
        disableLengthCheck: true,
        dropdownIcon: const Icon(Icons.keyboard_arrow_down_outlined),
        dropdownIconPosition: IconPosition.trailing,
        flagsButtonPadding: const EdgeInsets.only(left: 10),
        decoration: InputDecoration(
          errorText: errorText,
          hintText: '123 456-7890',
          hintStyle: const TextStyle(color: kGrayColor),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(),
          ),
        ),
        initialCountryCode: initialCountryCode,
        onChanged: (value) {
          setState(() {
            // Clear the error as the user starts typing
            errorText = null;
          });
        },
        onSubmitted: (phoneNumber) {
          setState(() {
            widget.controller.text = phoneNumber;
          });
        },
        validator: (phoneNumber) {
          // Apply the custom validation
          final validationResult = widget.validator(phoneNumber);
          setState(() {
            errorText = validationResult; // Update the errorText for UI feedback
          });
          return validationResult;
        },
      ),
    );
  }
}
