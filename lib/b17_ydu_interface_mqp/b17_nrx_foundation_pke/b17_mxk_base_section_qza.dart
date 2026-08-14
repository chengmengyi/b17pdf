import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_kmw_controller_lease_tza.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_fje_base_controller_sak.dart';
import 'package:flutter/material.dart';

abstract class B17MxkBaseSectionQza extends StatefulWidget {
  const B17MxkBaseSectionQza({super.key});
}

abstract class B17PrvBaseSectionStateWlt<
  T extends B17FjeBaseControllerSak,
  M extends B17MxkBaseSectionQza
>
    extends State<M>
    with AutomaticKeepAliveClientMixin<M> {
  late final B17KmwControllerLeaseTza<T> b17FshControllerLeaseQya;

  String? get b17VdsControllerTagYre => null;

  bool get b17JfxPermanentControllerWku => false;

  bool get b17CerKeepAliveLob => true;

  T b17NwzCreateControllerTpi();

  Widget b17YksBuildContentUvd(
    BuildContext b17AxrContextMqe,
    T b17LptControllerJfw,
  );

  @override
  void initState() {
    super.initState();
    b17FshControllerLeaseQya = B17KmwControllerLeaseTza.b17GtzAcquireMvu<T>(
      b17RhpCreateControllerXae: b17NwzCreateControllerTpi,
      b17YqnTagFds: b17VdsControllerTagYre,
      b17LkePermanentZoc: b17JfxPermanentControllerWku,
    );
  }

  @override
  void dispose() {
    b17FshControllerLeaseQya.b17BqyReleaseSni();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return b17YksBuildContentUvd(
      context,
      b17FshControllerLeaseQya.b17NqxControllerRfe,
    );
  }

  @override
  bool get wantKeepAlive => b17CerKeepAliveLob;
}
