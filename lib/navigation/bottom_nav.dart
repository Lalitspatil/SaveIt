import 'package:flutter/material.dart';
import 'package:saveit/navigation/navigation_controller.dart';
import 'package:saveit/resources/colors.dart';
import 'package:saveit/resources/sizes.dart';
import 'package:saveit/widgets/image_view.dart';
import 'package:saveit/widgets/styles.dart';
import 'package:saveit/widgets/text_view.dart';

class BottomNav extends StatelessWidget {
  NavigationController viewModel;
  int? currentIndex;
  BottomNav({super.key, required this.viewModel,required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: CColors.white,
      boxShadow: [BoxShadows.upperShadow]
      ),
      child: SafeArea(
        child: Row(children: viewModel.bottomMenus.entries.toList().asMap().entries.map((entry) => Expanded(
          child: GestureDetector(
            onTap: () => viewModel.handleBottomNavigation(context,entry.value.value[1]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Sizes.s1),
                ImageView(image: entry.value.value[0],height: Sizes.s35,width: Sizes.s35,
                color: entry.key == currentIndex 
                ? CColors.themeBg 
                : CColors.black,),
                TextView(text: entry.value.key,
                color: entry.key == currentIndex 
                ? CColors.themeBg 
                : CColors.black,),
                SizedBox(height: Sizes.s2),
                Visibility(
                  visible: entry.key == currentIndex,
                  child: Container(width: Sizes.s20,height: Sizes.s2, color: CColors.themeBg))
            ]),
          ),
        )).toList()),
      ),
    );
  }
}