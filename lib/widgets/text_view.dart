
import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
 
  final String? text;
  final Color? color;
  final bool? isbold;
  final double? size;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextDecoration? underLine;
  final TextOverflow? textOverflow;
  final Color? underlineColor;

  const TextView({super.key, this.text, this.color, this.isbold, this.size, this.textAlign, 
  this.textOverflow,this.fontWeight, this.underLine = TextDecoration.none,this.underlineColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: textAlign,overflow: textOverflow,
      style: TextStyle(color: color, fontSize: size, decoration: underLine ?? TextDecoration.none,
       fontWeight: isbold == true ? FontWeight.bold : fontWeight,decorationColor: underlineColor,),
    );
  }
}

