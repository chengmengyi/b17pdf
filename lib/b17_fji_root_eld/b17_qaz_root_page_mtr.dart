import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_hep_ifj.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_kmw_controller_lease_tza.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_fje_root_controller_sak.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class B17QazRootPageMtr<T extends B17FjeRootControllerSak>
    extends StatefulWidget {
  const B17QazRootPageMtr({super.key});

  String? get b17HjrControllerTagXwa => null;

  bool get b17ZctPermanentControllerYgu => false;

  bool get b17NwsResizeToAvoidBottomInsetKde => true;

  bool get b17VqeUseSafeBottomHcn => true;

  Future<bool> b17YmeAllowRoutePopJcu(T b17TbnControllerYui) async {
    B17FjeRoutersHepIfj.b17PqnBackWithExitAdVze<void>();
    return false;
  }

  Color get b17LxqBackgroundColorVbi => Color(0xffF3F5F7);

  Color get b17LxqNavigationBarColorVbi => Color(0xffF3F5F7);

  SystemUiOverlayStyle get b17GfrSystemUiOverlayStyleTpo =>
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: b17LxqNavigationBarColorVbi,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
      );

  T b17AhdCreateControllerWks();

  Widget b17RuzBuildContentNxe(
    BuildContext b17CmvContextQer,
    T b17TbnControllerYui,
  );

  @override
  State<B17QazRootPageMtr<T>> createState() => _B17VknRootPageStatePse<T>();
}

class _B17VknRootPageStatePse<T extends B17FjeRootControllerSak>
    extends State<B17QazRootPageMtr<T>> {
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
