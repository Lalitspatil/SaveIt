import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saveit/pages/home/home_controller.dart';
import 'package:saveit/resources/colors.dart';
import 'package:saveit/resources/sizes.dart';
import 'package:saveit/widgets/text_view.dart';

class HowUseCard extends StatelessWidget {
  const HowUseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (_, viewModel, __) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: Sizes.s7),
          padding: EdgeInsets.all(Sizes.s15),
          decoration: BoxDecoration(
            color: CColors.white,
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
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                text: viewModel.getValue('use'),
                size: FontSizes.s15,
                fontWeight: FontWeight.bold,
                ),
              SizedBox(height: DeviceHeight.s5,),
              Row(
                children: [
                  TextView(
                    text: '1.',size: FontSizes.s12,
                    color: CColors.gradientViolet,
                    fontWeight: FontWeight.bold,),
                  SizedBox(width: DeviceWidth.s5,),
                  TextView(
                    text: viewModel.getValue('use1'),
                    size: FontSizes.s12
                    )
                ],
              ),

              Row(
                children: [
                  TextView(
                    text: '2.',size: FontSizes.s12,
                    color: CColors.gradientViolet,
                    fontWeight: FontWeight.bold,),
                    SizedBox(width: DeviceWidth.s5,),
                    TextView(
                      text: viewModel.getValue('use2'),
                      size: FontSizes.s12
                   )
                ],
              ),

               Row(
                children: [
                  TextView(
                    text: '3.',size: FontSizes.s12,
                    color: CColors.gradientViolet,
                    fontWeight: FontWeight.bold,),
                    SizedBox(width: DeviceWidth.s5,),
                    TextView(
                      text: viewModel.getValue('use3'),
                      size: FontSizes.s12
                  )
                ],
              )
            ],
          ),
        );
      }
    ); 
  }
}