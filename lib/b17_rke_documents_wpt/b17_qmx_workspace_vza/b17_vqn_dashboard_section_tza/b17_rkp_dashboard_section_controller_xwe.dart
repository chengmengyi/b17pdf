import 'dart:io';

import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_jdw_metric_type_ijd.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_dji_analytics_func_wji.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_fje_base_controller_sak.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_fhi_signal_bean_feo.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_qxm_signal_code_vza.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_fji_signal_func_eji.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_qzm_permissions_xva/b17_kqn_access_func_vze.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_qxn_insert_widget_cache_vza.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

enum B17PeeDocumentTabTyFie {
  all("All"),
  pdf("PDF"),
  word("Word"),
  excel("Excel");

  final String name;
  const B17PeeDocumentTabTyFie(this.name);
}

class B17RkpDashboardSectionControllerXwe extends B17FjeBaseControllerSak
    with GetSingleTickerProviderStateMixin {
  TextEditingController textEditingController = TextEditingController();
  late final TabController b17KqnTabControllerVze;
  int b17QmvSelectedTabIndexNza = 0;
  bool b17QxnShowAddWidgetVza =
      !B17QxnInsertWidgetCacheVza.b17KqmReadAddedWze();
  bool b17VqnRequestingStoragePermissionTza = false;

  @override
  void onInit() {
    super.onInit();
    b17KqnTabControllerVze = TabController(
      length: B17PeeDocumentTabTyFie.values.length,
      vsync: this,
    )..addListener(b17HqmHandleTabChangedWza);
  }

  @override
  void onReady() {
    super.onReady();
    b17HqmRequestStoragePermissionWza();
  }

  void b17HqmHandleTabChangedWza() {
    final int b17KqnIndexVze = b17KqnTabControllerVze.index;
    if (b17QmvSelectedTabIndexNza == b17KqnIndexVze) return;
    b17QmvSelectedTabIndexNza = b17KqnIndexVze;
    update();
  }

  void b17QxnHandleTabTapVza(BuildContext b17QxnContextVza) {
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.file_filter_click,
    );
    B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
      b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_user_use,
      b17KqmAdPosIdVzr: B17JkwPosidKos.pr_up_int,
      b17VmqAdHostContextXtr: b17QxnContextVza,
    );
  }

  void b17PqmSearchFilesXza(String b17VqnKeywordTze) =>
      B17FjiSignalFuncEji.instance.b17JijSendMsgFEio(
        B17FhiSignalBeanFeo(
          b17HfeEventCodeFMie: B17QxmSignalCodeVza.b17VqnFileSearchTza,
          b17DjiStringValueJie: b17VqnKeywordTze,
        ),
      );

  @override
  bool b17FeiRegisterEventJif() => true;

  @override
  void b17RifHandleEventhJei(B17FhiSignalBeanFeo b17QzmEventXva) {
    if (b17QzmEventXva.b17HfeEventCodeFMie ==
        B17QxmSignalCodeVza.b17PqnWidgetAddedVze) {
      b17QxnShowAddWidgetVza = false;
      update();
    } else if (b17QzmEventXva.b17HfeEventCodeFMie ==
        B17QxmSignalCodeVza.b17RqmStoragePermissionRequestWza) {
      b17HqmRequestStoragePermissionWza();
    }
  }

  Future<void> b17HqmRequestStoragePermissionWza() async {
    if (b17VqnRequestingStoragePermissionTza) return;
    b17VqnRequestingStoragePermissionTza = true;
    try {
      final Permission b17QxnPermissionVza =
          await _b17KqmStoragePermissionWze();
      final B17VqmAccessOutputXze b17VqnResultTza = await B17KqnAccessFuncVze
          .instance
          .requestPermission(b17QxmPermissionVza: b17QxnPermissionVza);
      if (b17VqnResultTza.b17PqnIsShowPermissionAdVxe) {
        B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
          b17QxnPointTypeVza: B17JdwMetricTypeIjd.storage_auth_click,
        );
      }
      if (B17QxnUserCheckFuncVza.instance.b17VqnIsEligibleUserTza) {
        B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
          b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_launch,
          b17KqmAdPosIdVzr: B17JkwPosidKos.pr_permission_open,
          b17HqmIgnoreCooldownWza: true,
        );
      }
      if (!b17VqnResultTza.b17HqmIsGrantedWza) return;
      B17FjiSignalFuncEji.instance.b17JijSendMsgFEio(
        B17FhiSignalBeanFeo(
          b17HfeEventCodeFMie:
              B17QxmSignalCodeVza.b17TqnStoragePermissionGrantedVze,
        ),
      );
    } finally {
      b17VqnRequestingStoragePermissionTza = false;
    }
  }

  Future<Permission> _b17KqmStoragePermissionWze() async {
    if (!Platform.isAndroid) return Permission.storage;
    final b17QxnAndroidInfoVza = await DeviceInfoPlugin().androidInfo;
    return b17QxnAndroidInfoVza.version.sdkInt >= 30
        ? Permission.manageExternalStorage
        : Permission.storage;
  }

  void test() async {
    if (!kDebugMode) {
      return;
    }
    // B17FjeNavigationFuncIfj.b17VxqShowBottomSheetPrn(b17QnwChildXza: B17WjdCommentPopupJiIwe());
    // B17DjiAnalyticsFuncWji.instance.b17QgrAddLifeTimePjg();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    b17KqnTabControllerVze
      ..removeListener(b17HqmHandleTabChangedWza)
      ..dispose();
    super.onClose();
  }
}
