import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_dji_analytics_func_wji.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_jdw_metric_type_ijd.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_qxn_overlay_func_vza.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_fje_device_info_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_jfi_first_user_func_ejf.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_address_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_fje_base_controller_sak.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';
import 'package:get/get.dart';

class B17HvxOpenOverlayAccessControllerPra extends B17FjeBaseControllerSak {
  bool b17KqmPermissionRequestRunningVza = false;

  @override
  void onInit() {
    super.onInit();
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.float_page_view,
    );
  }

  Future<void> b17HqmClickContinueWze() async {
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.float_page_click,
      b17KqmParametersWze: {"button":"open"},
    );
    if (b17KqmPermissionRequestRunningVza) {
      return;
    }
    b17KqmPermissionRequestRunningVza = true;
    try {
      final bool b17VqmHasPermissionXra = await FlutterLocalNotificationPlugins
          .instance
          .checkOverlayPermission();
      if (b17VqmHasPermissionXra) {
        b17PqnOpenNotificationPageVxe();
        return;
      }
      final bool b17KqvPermissionGrantedXne =
          await FlutterLocalNotificationPlugins.instance
              .requestOverlayPermission(
                title: 'Almost there! Unlock your full potential'.tr,
                desc: 'Find {n} below and toggle the switch to ON.'.tr,
                overlayPermissionGuideLayout: 'b17_fje_overlay_layout_ifj',
              );
      if (b17KqvPermissionGrantedXne) {
        b17PqnOpenNotificationPageVxe();
      }
    } finally {
      b17KqmPermissionRequestRunningVza = false;
    }
  }

  void b17VqmClickLaterXze() {
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.float_page_click,
      b17KqmParametersWze: {"button":"later"},
    );
    b17PqnOpenNotificationPageVxe();
  }

  void b17PqnOpenNotificationPageVxe() {
    B17QxnOverlayFuncVza.instance.uploadPermissionState();
    B17JfiFirstUserFuncEjf.instance.toPageChooseLanguage();
  }
}
