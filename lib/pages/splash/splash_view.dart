import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saveit/pages/splash/splash_controller.dart';
import 'package:saveit/resources/assets.dart';
import 'package:saveit/resources/sizes.dart';
import 'package:saveit/resources/colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late SplashController splashController;

  @override
  void initState() {
    super.initState();
    splashController = SplashController(tickerProvider: this);
  }

  @override
  void dispose() {
    splashController.disposeAnimations();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: splashController,
      child: Consumer<SplashController>(
        builder: (_, controller, __) {
          controller.context = context;

          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [CColors.gradientLightViolet, CColors.gradientDarkViolet],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Floating icons
                  AnimatedBuilder(
                    animation: controller.iconsAnimation,
                    builder: (_, child) {
                      return Stack(
                        children: [
                          Positioned(
                            top: DeviceHeight.s100 + controller.iconsAnimation.value,
                            left: DeviceWidth.s50,
                            child: Icon(Icons.camera_alt,
                                color: CColors.white, size: DeviceHeight.s30),
                          ),
                          Positioned(
                            bottom: DeviceHeight.s150 + controller.iconsAnimation.value,
                            right: DeviceWidth.s60,
                            child: Icon(Icons.video_call,
                                color: CColors.white, size: DeviceHeight.s30),
                          ),
                          Positioned(
                            top: DeviceHeight.s200 - controller.iconsAnimation.value,
                            right: DeviceWidth.s100,
                            child: Icon(Icons.image,
                                color: CColors.white, size: DeviceHeight.s30),
                          ),
                        ],
                      );
                    },
                  ),

                  // Logo + App Name
                  FadeTransition(
                    opacity: controller.logoAnimation,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(Sizes.s80),
                          child: Image.asset(
                            Assets.logo,
                            width: DeviceWidth.s120,
                            height: DeviceHeight.s120,
                          ),
                        ),
                        SizedBox(height: DeviceHeight.s20),
                        Text(
                          "SaveIt",
                          style: TextStyle(
                            color: CColors.white,
                            fontSize: FontSizes.s28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: DeviceHeight.s8),
                        Text(
                          "All-in-One Media Downloader",
                          style: TextStyle(
                            color: CColors.white,
                            fontSize: FontSizes.s16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}