import 'package:flutter/material.dart';

class B17VnyMediaPaddingViewQsl extends StatelessWidget {
  const B17VnyMediaPaddingViewQsl({
    super.key,
    required this.b17QzpChildMwa,
    this.b17HkvRemoveTopXre = true,
    this.b17CjnRemoveBottomYqu = true,
    this.b17MfwRemoveLeftZpa = true,
    this.b17RtdRemoveRightQle = true,
  });

  final Widget b17QzpChildMwa;
  final bool b17HkvRemoveTopXre;
  final bool b17CjnRemoveBottomYqu;
  final bool b17MfwRemoveLeftZpa;
  final bool b17RtdRemoveRightQle;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: b17HkvRemoveTopXre,
      removeBottom: b17CjnRemoveBottomYqu,
      removeLeft: b17MfwRemoveLeftZpa,
      removeRight: b17RtdRemoveRightQle,
      child: b17QzpChildMwa,
    );
  }
}
