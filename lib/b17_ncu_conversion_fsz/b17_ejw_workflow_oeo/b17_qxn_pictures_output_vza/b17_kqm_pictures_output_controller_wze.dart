import 'dart:io';

import 'package:b17pdf/b17_ncu_conversion_fsz/b17_fji_operations_ejf/b17_qxm_pictures_func_vza/b17_kqm_pictures_func_wze.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_qzm_permissions_xva/b17_kqn_access_func_vze.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_address_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_fje_base_controller_sak.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

enum B17SouPicturesOutputRce { scan, choose }

class B17KqmPicturesOutputControllerWze extends B17FjeBaseControllerSak {
  final List<String> b17QxnImagePathsVza = List<String>.from(
    (Get.arguments?['b17EpaImagThs'] as List?)?.whereType<String>() ??
        const <String>[],
  );
  final B17SouPicturesOutputRce b17VqnSourceTza =
      Get.arguments?['b17HreSourceKaq'] as B17SouPicturesOutputRce? ??
      B17SouPicturesOutputRce.choose;
  final PageController b17HqmPageControllerWza = PageController();
  final ScrollController b17PqnThumbnailControllerVze = ScrollController();
  int b17KqmSelectedIndexWze = 0;

  void b17UjfClickBackBzn() =>
      B17FjeNavigationFuncIfj.b17PqnBackWithExitAdVze<void>();

  void b17VqnSelectImageTza(int b17QxnIndexVza) {
    if (b17QxnIndexVza < 0 || b17QxnIndexVza >= b17QxnImagePathsVza.length) {
      return;
    }
    b17KqmSelectedIndexWze = b17QxnIndexVza;
    b17HqmPageControllerWza.animateToPage(
      b17QxnIndexVza,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeInOut,
    );
    _b17KqmScrollThumbnailWze();
    update();
  }

  void b17HqmPageChangedWza(int b17QxnIndexVza) {
    b17KqmSelectedIndexWze = b17QxnIndexVza;
    _b17KqmScrollThumbnailWze();
    update();
  }

  Future<void> b17RuaClickReplacePmb() async {
    final List<String> b17VqnNewPathsTza = await _b17QxnPickImagesVza();
    if (b17VqnNewPathsTza.isEmpty || b17QxnImagePathsVza.isEmpty) return;
    b17QxnImagePathsVza[b17KqmSelectedIndexWze] = b17VqnNewPathsTza.first;
    update();
  }

  Future<void> b17ZahClickAddZei() async {
    final List<String> b17VqnNewPathsTza = await _b17QxnPickImagesVza();
    if (b17VqnNewPathsTza.isEmpty) return;
    b17QxnImagePathsVza.addAll(b17VqnNewPathsTza);
    update();
  }

  Future<List<String>> _b17QxnPickImagesVza() {
    return switch (b17VqnSourceTza) {
      B17SouPicturesOutputRce.scan =>
        B17KqmPicturesFuncWze.instance.b17BonToScanZjx(
          b17QxnOpenResultVza: false,
        ),
      B17SouPicturesOutputRce.choose =>
        B17KqmPicturesFuncWze.instance.b17McvChooseImagesXri(
          b17QxnOpenResultVza: false,
        ),
    };
  }

  Future<void> b17IedClickSaveJkt() async {
    if (b17QxnImagePathsVza.isEmpty) return;
    if (b17QxnImagePathsVza.length > 100) {
      Fluttertoast.showToast(msg: 'Max 100 images allowed'.tr);
      return;
    }
    final Permission b17QxnPermissionVza = await _b17VqnStoragePermissionTza();
    final B17VqmAccessOutputXze b17HqmResultWza = await B17KqnAccessFuncVze
        .instance
        .requestPermission(b17QxmPermissionVza: b17QxnPermissionVza);
    if (!b17HqmResultWza.b17HqmIsGrantedWza) return;
    B17FjeNavigationFuncIfj.b17HkqPushNamedVpa<void>(
      b17McfRouteNameZsq:
          B17FjeNavigationAddressIfj.b17HqmProcessWaitingRouteWza,
      b17XveArgumentsDlu: <String, dynamic>{
        'b17EpaImagThs': List<String>.from(b17QxnImagePathsVza),
        'b17HreSourceKaq': b17VqnSourceTza,
      },
    );
  }

  Future<Permission> _b17VqnStoragePermissionTza() async {
    if (!Platform.isAndroid) return Permission.storage;
    final b17QxnAndroidInfoVza = await DeviceInfoPlugin().androidInfo;
    return b17QxnAndroidInfoVza.version.sdkInt >= 30
        ? Permission.manageExternalStorage
        : Permission.storage;
  }

  void _b17KqmScrollThumbnailWze() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!b17PqnThumbnailControllerVze.hasClients) return;
      final double b17QxnTargetVza = (b17KqmSelectedIndexWze * 80.0).clamp(
        0,
        b17PqnThumbnailControllerVze.position.maxScrollExtent,
      );
      b17PqnThumbnailControllerVze.animateTo(
        b17QxnTargetVza,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void onClose() {
    b17HqmPageControllerWza.dispose();
    b17PqnThumbnailControllerVze.dispose();
    super.onClose();
  }
}
