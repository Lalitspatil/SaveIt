import 'package:flutter/widgets.dart';
import 'package:saveit/resources/assets.dart';
import 'package:saveit/resources/sizes.dart';

class ImageView extends StatelessWidget {
  String? image;
  double? height;
  double? width;
  bool? isNetwork;
  String? defaultImage;
  BoxFit? boxFit;
  Color? color;
  ImageView(
      {super.key,
      this.image,
      this.height,
      this.width,
      this.color,
      this.isNetwork = false,
      this.defaultImage,
      this.boxFit});

  @override
  Widget build(BuildContext context) {
    return isNetwork == true
        ? Image.network(image ?? '',
            width: width ?? Sizes.s120,
            height: height ?? Sizes.s120,
            fit: boxFit,
            errorBuilder: (context, error, stackTrace) => ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.s120/2),
              child: Image.asset(
                    defaultImage ?? Assets.noImage,
                    width: width ?? Sizes.s120,
                    height: height ?? Sizes.s120,
                    fit: BoxFit.cover,
                  ),
            ))
        : Image.asset(image ?? '',
            width: width ?? Sizes.s120,
            height: height ?? Sizes.s120,
            fit: boxFit,
            color: color,
            errorBuilder: (context, error, stackTrace) => ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.s120/2),
              child: Image.asset(
                  defaultImage ?? Assets.noImage,
                  width: width ?? Sizes.s120,
                  height: height ?? Sizes.s120,
                  fit: BoxFit.cover),
            ));
  }
}
