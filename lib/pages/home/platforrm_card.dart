import 'package:flutter/material.dart';
import 'package:saveit/resources/assets.dart';
import 'package:saveit/resources/colors.dart';
import 'package:saveit/resources/sizes.dart';
import 'package:saveit/widgets/text_view.dart';

class PlatforrmCard extends StatelessWidget {

  Color? bgColor;
  String? image;
  String? text;
  PlatforrmCard({super.key,this.bgColor,this.image,this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.s7),
      padding: EdgeInsets.all(Sizes.s15),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color:CColors.borderGrey),
        borderRadius: BorderRadius.all(Radius.circular(DeviceRadius.s15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0.3, 
            blurRadius: 9,   
            offset: Offset(0, 2), 
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
           height: DeviceHeight.s50,
           width: DeviceWidth.s50, 
          child: ClipRRect(
           borderRadius: BorderRadius.circular(DeviceRadius.s15),
          child: Image.asset( image ?? Assets.insta,))),
          SizedBox(width: DeviceWidth.s10,),
          TextView(
            text: text,
            size: FontSizes.s16,
            fontWeight: FontWeight.bold,
            )
        ],
      ),
    );
  }
}