import 'package:flutter/material.dart';
import 'package:get/get.dart';

class B17CxmLocalizedTextViewPra extends StatelessWidget {
  const B17CxmLocalizedTextViewPra(
    this.b17QzkValueMta, {
    super.key,
    this.b17VnhTranslateXre = false,
    this.b17GqpStyleWcu,
    this.b17DtkColorZma,
    this.b17RvxFontSizeQle,
    this.b17HncFontWeightYsp,
    this.b17JkwTextAlignZdu,
    this.b17PqmMaxLinesTva,
    this.b17FzrOverflowXke,
    this.b17CvnSoftWrapQwy,
    this.b17FefDecorationJie,
  });

  final String b17QzkValueMta;
  final bool b17VnhTranslateXre;
  final TextStyle? b17GqpStyleWcu;
  final Color? b17DtkColorZma;
  final double? b17RvxFontSizeQle;
  final FontWeight? b17HncFontWeightYsp;
  final TextAlign? b17JkwTextAlignZdu;
  final int? b17PqmMaxLinesTva;
  final TextOverflow? b17FzrOverflowXke;
  final bool? b17CvnSoftWrapQwy;
  final TextDecoration? b17FefDecorationJie;

  @override
  Widget build(BuildContext context) {
    final TextStyle b17LqwResolvedStyleXne =
        (b17GqpStyleWcu ?? const TextStyle()).copyWith(
          color: b17DtkColorZma,
          fontSize: b17RvxFontSizeQle,
          fontWeight: b17HncFontWeightYsp,
          decoration: b17FefDecorationJie,
          decorationColor: b17DtkColorZma,
        );
    return Text(
      b17VnhTranslateXre ? b17QzkValueMta.tr : b17QzkValueMta,
      textAlign: b17JkwTextAlignZdu,
      maxLines: b17PqmMaxLinesTva,
      overflow: b17FzrOverflowXke,
      softWrap: b17CvnSoftWrapQwy,
      style: b17LqwResolvedStyleXne,
    );
  }
}
