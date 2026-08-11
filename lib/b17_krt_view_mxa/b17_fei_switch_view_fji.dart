import 'dart:async';

import 'package:flutter/material.dart';

class B17FeiSwitchViewFji extends StatefulWidget {
  const B17FeiSwitchViewFji({super.key});

  @override
  State<B17FeiSwitchViewFji> createState() => _B17KqmSwitchStateVza();
}

class _B17KqmSwitchStateVza extends State<B17FeiSwitchViewFji> {
  static const Duration b17VqmToggleIntervalXze = Duration(milliseconds: 600);

  Timer? b17HqmToggleTimerWza;
  bool b17PqnSwitchEnabledVxe = false;

  @override
  void initState() {
    super.initState();
    b17HqmToggleTimerWza = Timer.periodic(b17VqmToggleIntervalXze, (
      Timer b17KqmTimerVza,
    ) {
      if (mounted) {
        setState(() {
          b17PqnSwitchEnabledVxe = !b17PqnSwitchEnabledVxe;
        });
      }
    });
  }

  @override
  void dispose() {
    b17HqmToggleTimerWza?.cancel();
    b17HqmToggleTimerWza = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: b17PqnSwitchEnabledVxe,
      onChanged: null,
      thumbColor: WidgetStatePropertyAll(
        b17PqnSwitchEnabledVxe ? Colors.white : const Color(0xfff5f5f5),
      ),
      trackColor: WidgetStatePropertyAll(
        b17PqnSwitchEnabledVxe
            ? const Color(0xffD12629)
            : const Color(0xffc8cdd2),
      ),
    );
  }
}
