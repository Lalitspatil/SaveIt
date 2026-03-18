import 'package:flutter/material.dart';
import 'package:saveit/navigation/routes.dart';
import 'package:saveit/resources/base_model.dart';

class SplashController extends BaseModel {
  final TickerProvider tickerProvider;

  late AnimationController logoController;
  late Animation<double> logoAnimation;

  late AnimationController iconsController;
  late Animation<double> iconsAnimation;

  BuildContext? context;

  SplashController({required this.tickerProvider}) {
    initAnimations();
    startSplashTimer();
  }

  void initAnimations() {
    // Logo fade-in animation
    logoController = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(seconds: 2),
    );
    logoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: logoController, curve: Curves.easeInOut),
    );
    logoController.forward();

    // Floating icons animation
    iconsController = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    iconsAnimation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(parent: iconsController, curve: Curves.easeInOut),
    );
  }

  void startSplashTimer() {
    Future.delayed(const Duration(seconds: 5), () {
      if (context != null) {
        Navigator.of(context!).pushReplacementNamed(Routes.home);
      }
    });
  }

  void disposeAnimations() {
    logoController.dispose();
    iconsController.dispose();
  }

  @override
  void dispose() {
    disposeAnimations();
    super.dispose();
  }
}