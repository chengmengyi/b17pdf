import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_kmw_controller_lease_tza.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_fje_base_controller_sak.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class B17QazBasePageMtr<T extends B17FjeBaseControllerSak>
    extends StatefulWidget {
  const B17QazBasePageMtr({super.key});

  String? get b17HjrControllerTagXwa => null;

  bool get b17ZctPermanentControllerYgu => false;

  bool get b17NwsResizeToAvoidBottomInsetKde => true;

  bool get b17VqeUseSafeBottomHcn => true;

  Future<bool> b17YmeAllowRoutePopJcu(T b17TbnControllerYui) async {
    B17FjeNavigationFuncIfj.b17PqnBackWithExitAdVze<void>();
    return false;
  }

  Color get b17LxqBackgroundColorVbi => Colors.white;

  Color get b17LxqNavigationBarColorVbi => Colors.white;

  SystemUiOverlayStyle get b17GfrSystemUiOverlayStyleTpo =>
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
      );

  T b17AhdCreateControllerWks();

  Widget b17RuzBuildContentNxe(
    BuildContext b17CmvContextQer,
    T b17TbnControllerYui,
  );

  @override
  State<B17QazBasePageMtr<T>> createState() => _B17VknBasePageStatePse<T>();
}

class _B17VknBasePageStatePse<T extends B17FjeBaseControllerSak>
    extends State<B17QazBasePageMtr<T>> {
  late final B17KmwControllerLeaseTza<T> b17KjfControllerLeasePso;

  @override
  void initState() {
    super.initState();
    b17KjfControllerLeasePso = B17KmwControllerLeaseTza.b17GtzAcquireMvu<T>(
      b17RhpCreateControllerXae: widget.b17AhdCreateControllerWks,
      b17YqnTagFds: widget.b17HjrControllerTagXwa,
      b17LkePermanentZoc: widget.b17ZctPermanentControllerYgu,
    );
  }

  @override
  void dispose() {
    b17KjfControllerLeasePso.b17BqyReleaseSni();
    super.dispose();
  }

  @override
  Widget build(BuildContext b17QewContextRty) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: widget.b17GfrSystemUiOverlayStyleTpo,
      child: WillPopScope(
        onWillPop: () async {
          return widget.b17YmeAllowRoutePopJcu(
            b17KjfControllerLeasePso.b17NqxControllerRfe,
          );
        },
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: widget.b17LxqBackgroundColorVbi,
            resizeToAvoidBottomInset: widget.b17NwsResizeToAvoidBottomInsetKde,
            body: SafeArea(
              top: false,
              bottom: widget.b17VqeUseSafeBottomHcn,
              child: widget.b17RuzBuildContentNxe(
                b17QewContextRty,
                b17KjfControllerLeasePso.b17NqxControllerRfe,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
