
import 'package:flutter/material.dart';
import 'package:saveit/resources/colors.dart';
import 'package:saveit/resources/sizes.dart';
import 'package:saveit/widgets/text_view.dart';


class ColorLessButton extends StatelessWidget {

  String? text;
  double? height;
  double? width;
  Color? textColor;
  double? textSize;
  FontWeight? textWeight;
  Color? backgroundColor;
  Color? borderColor;

 ColorLessButton({super.key,this.text,this.height,this.width,this.textColor,this.textSize,
 this.textWeight,this.borderColor,this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
                     height: height ?? DeviceHeight.s38,width: width ?? DeviceWidth.s350,
                     decoration: BoxDecoration(
                      color: backgroundColor ?? Colors.transparent,
                      borderRadius: BorderRadius.circular(DeviceRadius.s20),
                      border: Border.all(color:  borderColor ?? CColors.borderGrey)
                     ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Center(child: TextView(text: text, size: textSize ,
                        color: textColor ?? CColors.white,fontWeight: textWeight ,)),
                      ),
                );
  }
}