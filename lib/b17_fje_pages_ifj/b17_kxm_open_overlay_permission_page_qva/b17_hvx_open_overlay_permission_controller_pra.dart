import 'package:b17pdf/b17_dji_hep_jdo/b17_fje_local_info_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jfi_new_user_hep_ejf.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_address_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_hep_ifj.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_fje_root_controller_sak.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';
import 'package:get/get.dart';

class B17HvxOpenOverlayPermissionControllerPra extends B17FjeRootControllerSak {
  bool b17KqmPermissionRequestRunningVza = false;

  Future<void> b17HqmClickContinueWze() async {
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
    b17PqnOpenNotificationPageVxe();
  }

  void b17PqnOpenNotificationPageVxe() {
    B17JfiNewUserHepEjf.instance.toPageChooseLanguage();
  }
}
