import 'package:flutter/material.dart';
import 'package:saveit/resources/sizes.dart';

class AdBannerCard extends StatelessWidget {
  const AdBannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: Sizes.s10),
        height: 50, 
        width: double.infinity,
        alignment: Alignment.center,
        color: Colors.grey.shade400,
        child: const Text("Ad"),
    );
  }
}