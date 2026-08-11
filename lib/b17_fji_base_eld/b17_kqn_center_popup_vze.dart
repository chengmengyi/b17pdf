import 'package:b17pdf/b17_fji_base_eld/b17_kmw_controller_lease_tza.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_fje_base_controller_sak.dart';
import 'package:flutter/material.dart';

abstract class B17KqnCenterPopupVze<T extends B17FjeBaseControllerSak>
    extends StatefulWidget {
  const B17KqnCenterPopupVze({super.key});

  String? get b17VqmControllerTagXra => null;

  bool get b17PqmPermanentControllerWza => false;

  bool get b17HqnAllowBackDismissVxe => false;

  bool get b17KqmDismissKeyboardWza => true;

  EdgeInsets get b17RqmContentPaddingVza => const EdgeInsets.all(16);

  T b17TqnCreateControllerXre();

  Widget b17VqmBuildDialogWza(
    BuildContext b17HqnContextVxe,
    T b17KqmControllerWza,
  );

  @override
  State<B17KqnCenterPopupVze<T>> createState() =>
      _B17PqmCenterPopupStateVza<T>();
}

class _B17PqmCenterPopupStateVza<T extends B17FjeBaseControllerSak>
    extends State<B17KqnCenterPopupVze<T>> {
  static const Duration b17VqmKeyboardMotionXra = Duration(milliseconds: 180);

  late final B17KmwControllerLeaseTza<T> b17HqmControllerLeaseWze;

  @override
  void initState() {
    super.initState();
    b17HqmControllerLeaseWze = B17KmwControllerLeaseTza.b17GtzAcquireMvu<T>(
      b17RhpCreateControllerXae: widget.b17TqnCreateControllerXre,
      b17YqnTagFds: widget.b17VqmControllerTagXra,
      b17LkePermanentZoc: widget.b17PqmPermanentControllerWza,
    );
  }

  @override
  void dispose() {
    b17HqmControllerLeaseWze.b17BqyReleaseSni();
    super.dispose();
  }

  @override
  Widget build(BuildContext b17KqmContextWza) {
    final EdgeInsets b17VqnKeyboardInsetsXre = MediaQuery.viewInsetsOf(
      b17KqmContextWza,
    );
    return PopScope(
      canPop: widget.b17HqnAllowBackDismissVxe,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.b17KqmDismissKeyboardWza
            ? () => FocusManager.instance.primaryFocus?.unfocus()
            : null,
        child: Material(
          type: MaterialType.transparency,
          child: SafeArea(
            child: Center(
              child: widget.b17VqmBuildDialogWza(
                b17KqmContextWza,
                b17HqmControllerLeaseWze.b17NqxControllerRfe,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
