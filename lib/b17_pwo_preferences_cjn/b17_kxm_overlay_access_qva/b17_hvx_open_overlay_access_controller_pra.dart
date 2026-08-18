import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_fje_device_info_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_jfi_first_user_func_ejf.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_address_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_fje_base_controller_sak.dart';
import 'package:flutter_boom_notification_plugins/flutter_boom_notification_plugins.dart';
import 'package:get/get.dart';

class B17HvxOpenOverlayAccessControllerPra extends B17FjeBaseControllerSak {
  bool b17KqmPermissionRequestRunningVza = false;

  Future<void> b17HqmClickContinueWze() async {
    if (b17KqmPermissionRequestRunningVza) {
      return;
    }
    b17KqmPermissionRequestRunningVza = true;
    try {
      final bool b17VqmHasPermissionXra = await FlutterBoomNotificationPlugins
          .instance
          .checkOverlayPermission();
      if (b17VqmHasPermissionXra) {
        b17PqnOpenNotificationPageVxe();
        return;
      }
      final bool b17KqvPermissionGrantedXne =
          await FlutterBoomNotificationPlugins.instance
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
    b17PqnOpenNotificationPageVxe();
  }

  void b17PqnOpenNotificationPageVxe() {
    B17JfiFirstUserFuncEjf.instance.toPageChooseLanguage();
  }
}
