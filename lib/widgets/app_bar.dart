import 'package:flutter/material.dart';
import 'package:saveit/resources/colors.dart';
import 'package:saveit/resources/sizes.dart';
import 'package:saveit/widgets/text_view.dart';


class CommanAppBar extends StatelessWidget {

   String? text;
   final bool isBackButon;

   CommanAppBar({super.key,this.text,this.isBackButon=false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leadingWidth: Sizes.s35,
        leading: GestureDetector(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.s10),
            child: Icon(isBackButon ? Icons.arrow_back : Icons.download_for_offline_outlined, color: CColors.black,size: Sizes.s30),
          ),
        ),
        title: TextView(text: text, size: FontSizes.s17,  fontWeight: FontWeight.w500,color: CColors.black),
        elevation: 1,
        centerTitle: false,
      );
  }
}