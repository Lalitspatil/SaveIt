import 'package:flutter/material.dart';
import 'package:saveit/resources/colors.dart';
import 'package:saveit/resources/sizes.dart';


class AppTextField extends StatelessWidget {
  TextEditingController? controller;
  String? hintText;
  TextStyle? hintStyle;
  String? Function(String?)? validators;
  bool obscureText;
  Widget? suffixIcon;
  TextAlign? textAlign;
  Widget? prefixIcon;


  AppTextField({
    super.key,
    this.controller,
    this.hintStyle,
    this.hintText,
    this.validators,
    this.obscureText = false,
    this.suffixIcon,
    this.textAlign,
    this.prefixIcon
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(controller: controller,
          decoration: InputDecoration(
            border:  OutlineInputBorder(),
            hintText: hintText,
            hintStyle: hintStyle ??  TextStyle(color: CColors.textGrey),
            suffixIcon:suffixIcon,
            prefixIcon: prefixIcon,
          ),
          textAlign: textAlign ?? TextAlign.start,
          obscureText: obscureText,
          validator: validators),
    );
  }
}
  