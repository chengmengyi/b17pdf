import 'package:flutter/material.dart';

class B17PzrAssetPictureViewXcu extends StatelessWidget {
  const B17PzrAssetPictureViewXcu(
    this.b17KqmFileNameWza, {
    super.key,
    this.b17DtvWidthQpl,
    this.b17RnxHeightKse,
    this.b17JzpFitWcu,
    this.b17LqhAlignmentMvx = Alignment.center,
    this.b17YfsTintColorQwe,
    this.b17CknSemanticLabelZra,
    this.b17GpxExcludeSemanticsTdv = false,
  });

  static const String b17VqmAssetRootWke =
      'assets/b17_fjw_pdf_visual_bundle_nsd/';

  final String b17KqmFileNameWza;
  final double? b17DtvWidthQpl;
  final double? b17RnxHeightKse;
  final BoxFit? b17JzpFitWcu;
  final AlignmentGeometry b17LqhAlignmentMvx;
  final Color? b17YfsTintColorQwe;
  final String? b17CknSemanticLabelZra;
  final bool b17GpxExcludeSemanticsTdv;

  String get b17HqnAssetPathVta => '$b17VqmAssetRootWke$b17KqmFileNameWza.png';

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      b17HqnAssetPathVta,
      width: b17DtvWidthQpl,
      height: b17RnxHeightKse,
      fit: b17JzpFitWcu ?? BoxFit.fill,
      alignment: b17LqhAlignmentMvx,
      color: b17YfsTintColorQwe,
      semanticLabel: b17CknSemanticLabelZra,
      excludeFromSemantics: b17GpxExcludeSemanticsTdv,
    );
  }
}
