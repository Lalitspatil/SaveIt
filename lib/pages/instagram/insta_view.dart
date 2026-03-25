import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saveit/comman/ad_banner_card.dart';
import 'package:saveit/pages/instagram/insta_controller.dart';
import 'package:saveit/resources/colors.dart';
import 'package:saveit/resources/sizes.dart';
import 'package:saveit/widgets/app_bar.dart';
import 'package:saveit/widgets/text_button.dart';
import 'package:saveit/widgets/text_field.dart';
import 'package:saveit/widgets/text_view.dart';

class InstaView extends StatelessWidget {
  const InstaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InstaController>(
      builder: (_, viewModel, __) => Scaffold(
        appBar: PreferredSize(
                preferredSize: Size.fromHeight(Sizes.s60),
                child: CommanAppBar(
                 text: viewModel.getValue("tittle"),
                 isBackButon: true,
                ),
              ),
        body: Padding(
          padding: EdgeInsets.all(Sizes.s15),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(Sizes.s20),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: viewModel.getValue('media_link'),),
                      SizedBox(height: DeviceHeight.s10,),
                      AppTextField(hintText: viewModel.getValue('paste'),
                      prefixIcon: Icon(Icons.link),),
                      SizedBox(height: DeviceHeight.s10,),
                      SizedBox(
                        width: DeviceWidth.s500,
                        height: DeviceHeight.s50,
                        child: AppButton(text: viewModel.getValue('fetch_media'),)),
                
                  ],
                ),
              ),
               SizedBox(height: DeviceHeight.s40,),
               AdBannerCard()
            ],
          ),
        ),
        ),
    );
  }
}