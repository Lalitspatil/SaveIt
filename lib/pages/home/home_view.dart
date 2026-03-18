import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saveit/pages/home/home_controller.dart';
import 'package:saveit/pages/home/how_use_card.dart';
import 'package:saveit/pages/home/platforrm_card.dart';
import 'package:saveit/resources/assets.dart';
import 'package:saveit/resources/colors.dart';
import 'package:saveit/widgets/text_view.dart';
import 'package:saveit/resources/sizes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (_, viewModel, __) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(Sizes.s20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: viewModel.getValue('title'),
                    size: FontSizes.s25,
                    fontWeight: FontWeight.bold,
                  ),

                  TextView(
                    text: viewModel.getValue('title_'),
                    size: FontSizes.s14,
                  ),

                  SizedBox(height: Sizes.s20,),
                  PlatforrmCard(
                    bgColor: CColors.lightPink,
                    image: Assets.insta,
                    text: viewModel.getValue('insta'),
                  ),

                  PlatforrmCard(
                    bgColor: CColors.lightBlue,
                    image: Assets.fb,
                    text: viewModel.getValue('fb'),
                  ),

                  PlatforrmCard(
                    bgColor: CColors.lightGreen,
                    image: Assets.whatsapp,
                    text: viewModel.getValue('whatsapp'),
                  ),
                  
                  HowUseCard()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}