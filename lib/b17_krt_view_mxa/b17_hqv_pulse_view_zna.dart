import 'package:flutter/material.dart';

class B17HqvPulseViewZna extends StatefulWidget {
  const B17HqvPulseViewZna({
    super.key,
    required this.b17PxnChildVta,
    this.b17GqmLowerScaleWre = 0.96,
    this.b17ZkfUpperScaleYdu = 1,
    this.b17VctCycleDurationJpo = const Duration(milliseconds: 400),
    this.b17LqhCurveEbx = Curves.easeInOut,
  }) : assert(b17GqmLowerScaleWre > 0),
       assert(b17GqmLowerScaleWre <= b17ZkfUpperScaleYdu),
       assert(b17VctCycleDurationJpo > Duration.zero);

  final Widget b17PxnChildVta;
  final double b17GqmLowerScaleWre;
  final double b17ZkfUpperScaleYdu;
  final Duration b17VctCycleDurationJpo;
  final Curve b17LqhCurveEbx;

  @override
  State<B17HqvPulseViewZna> createState() => _B17RmwPulseViewStateQcs();
}

class _B17RmwPulseViewStateQcs extends State<B17HqvPulseViewZna>
    with SingleTickerProviderStateMixin {
  late final AnimationController b17DpxMotionControllerQva;
  late Animation<double> b17FjwScaleMotionNke;
  bool b17TyqAnimationsDisabledLzr = false;

  @override
  void initState() {
    super.initState();
    b17DpxMotionControllerQva = AnimationController(
      vsync: this,
      duration: widget.b17VctCycleDurationJpo,
    );
    b17SnvConfigureMotionXku();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final bool b17KwmDisableMotionXpa = MediaQuery.disableAnimationsOf(context);
    if (b17KwmDisableMotionXpa == b17TyqAnimationsDisabledLzr) {
      return;
    }
    b17TyqAnimationsDisabledLzr = b17KwmDisableMotionXpa;
    b17HqcSyncPlaybackZve();
  }

  @override
  void didUpdateWidget(covariant B17HqvPulseViewZna oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.b17VctCycleDurationJpo != widget.b17VctCycleDurationJpo) {
      b17DpxMotionControllerQva.duration = widget.b17VctCycleDurationJpo;
    }
    if (oldWidget.b17GqmLowerScaleWre != widget.b17GqmLowerScaleWre ||
        oldWidget.b17ZkfUpperScaleYdu != widget.b17ZkfUpperScaleYdu ||
        oldWidget.b17LqhCurveEbx != widget.b17LqhCurveEbx) {
      b17SnvConfigureMotionXku();
    }
  }

  void b17SnvConfigureMotionXku() {
    b17FjwScaleMotionNke =
        Tween<double>(
          begin: widget.b17GqmLowerScaleWre,
          end: widget.b17ZkfUpperScaleYdu,
        ).animate(
          CurvedAnimation(
            parent: b17DpxMotionControllerQva,
            curve: widget.b17LqhCurveEbx,
          ),
        );
    b17HqcSyncPlaybackZve();
  }

  void b17HqcSyncPlaybackZve() {
    if (b17TyqAnimationsDisabledLzr) {
      b17DpxMotionControllerQva.stop();
      b17DpxMotionControllerQva.value = 1;
    } else if (!b17DpxMotionControllerQva.isAnimating) {
      b17DpxMotionControllerQva.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    b17DpxMotionControllerQva.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: b17FjwScaleMotionNke,
      child: widget.b17PxnChildVta,
    );
  }
}
