import 'package:flutter/material.dart';

class B17MfwTapGuardViewQke extends StatefulWidget {
  const B17MfwTapGuardViewQke({
    super.key,
    required this.b17HnqChildVsa,
    this.b17JkcOnPressedXwu,
    this.b17GzpCooldownMre = const Duration(milliseconds: 800),
    this.b17TvqBorderRadiusLna,
    this.b17XrpEnableFeedbackWdo = true,
  });

  final Widget b17HnqChildVsa;
  final VoidCallback? b17JkcOnPressedXwu;
  final Duration b17GzpCooldownMre;
  final BorderRadius? b17TvqBorderRadiusLna;
  final bool b17XrpEnableFeedbackWdo;

  @override
  State<B17MfwTapGuardViewQke> createState() => _B17QzfTapGuardStateNby();
}

class _B17QzfTapGuardStateNby extends State<B17MfwTapGuardViewQke> {
  final Stopwatch b17WvkCooldownClockMta = Stopwatch();

  void b17CpqHandlePressedZye() {
    if (b17WvkCooldownClockMta.isRunning &&
        b17WvkCooldownClockMta.elapsed < widget.b17GzpCooldownMre) {
      return;
    }
    b17WvkCooldownClockMta
      ..reset()
      ..start();
    widget.b17JkcOnPressedXwu?.call();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.b17JkcOnPressedXwu == null ? null : b17CpqHandlePressedZye,
      borderRadius: widget.b17TvqBorderRadiusLna,
      enableFeedback: widget.b17XrpEnableFeedbackWdo,
      child: widget.b17HnqChildVsa,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
