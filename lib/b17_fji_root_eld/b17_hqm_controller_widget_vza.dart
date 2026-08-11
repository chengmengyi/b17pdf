import 'package:b17pdf/b17_fji_root_eld/b17_kmw_controller_lease_tza.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_fje_root_controller_sak.dart';
import 'package:flutter/widgets.dart';

abstract class B17HqmControllerWidgetVza<T extends B17FjeRootControllerSak>
    extends StatefulWidget {
  const B17HqmControllerWidgetVza({super.key});

  String? get b17KqnControllerTagVze => null;

  bool get b17VqmPermanentControllerXra => false;

  T b17PqmCreateControllerWza();

  Widget b17HqnBuildContentVxe(
    BuildContext b17KqmContextWza,
    T b17VqnControllerXre,
  );

  @override
  State<B17HqmControllerWidgetVza<T>> createState() =>
      _B17RqmControllerWidgetStateVza<T>();
}

class _B17RqmControllerWidgetStateVza<T extends B17FjeRootControllerSak>
    extends State<B17HqmControllerWidgetVza<T>> {
  late final B17KmwControllerLeaseTza<T> b17HqmControllerLeaseWze;

  @override
  void initState() {
    super.initState();
    b17HqmControllerLeaseWze = B17KmwControllerLeaseTza.b17GtzAcquireMvu<T>(
      b17RhpCreateControllerXae: widget.b17PqmCreateControllerWza,
      b17YqnTagFds: widget.b17KqnControllerTagVze,
      b17LkePermanentZoc: widget.b17VqmPermanentControllerXra,
    );
  }

  @override
  void dispose() {
    b17HqmControllerLeaseWze.b17BqyReleaseSni();
    super.dispose();
  }

  @override
  Widget build(BuildContext b17VqmContextXza) {
    return widget.b17HqnBuildContentVxe(
      b17VqmContextXza,
      b17HqmControllerLeaseWze.b17NqxControllerRfe,
    );
  }
}
