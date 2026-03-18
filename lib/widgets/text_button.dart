
import 'package:flutter/material.dart';
import 'package:saveit/resources/colors.dart';
import 'package:saveit/resources/sizes.dart';
import 'package:saveit/widgets/text_view.dart';

class AppButton extends StatelessWidget {
   
   void Function()? onPressed;
   ButtonStyle? style;
   Color? backgroundColor;
   Color? foregroundColor;
   String? text;
   Color?  textColor;
   double? fontSize;

   AppButton({
    super.key,
    this.onPressed,
    this.style,
    this.backgroundColor,
    this.foregroundColor,
    this.text,
    this.textColor,
    this.fontSize});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () => onPressed!=null? onPressed!():{},
          style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? CColors.black,
            foregroundColor: CColors.white ,
          ),
          child: TextView(text: text ?? 'Login',size: fontSize ?? FontSizes.s18,color: textColor ?? CColors.white,)
      );
  }
}