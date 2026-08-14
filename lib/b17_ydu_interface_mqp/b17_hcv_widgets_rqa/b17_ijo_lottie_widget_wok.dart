import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class B17IjoLottieWidgetWok extends StatelessWidget {
  String name;
  double? width;
  double? height;
  BoxFit? boxFit;
  bool? repeat;
  B17IjoLottieWidgetWok({
    required this.name,
    this.width,
    this.height,
    this.repeat,
  });

  @override
  Widget build(BuildContext context) => Lottie.asset(
    "assets/b17_fji_pdf_animation_bundle_wji/$name.json",
    width: width,
    height: height,
    fit: boxFit,
    repeat: repeat ?? false,
  );
}
