import 'package:app_settings/app_settings.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jfi_first_user_func_ejf.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_address_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_fje_screens_ifj/b17_qmx_dashboard_vza/b17_hqv_dashboard_controller_wze.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_fje_base_controller_sak.dart';
import 'package:get/get.dart';

class B17FowUpdatePopupControllerJid extends B17FjeBaseControllerSak {
  void b17KqnClickContinueUsingVze() {
    _b17QxmReturnToAppVza();
  }

  Future<void> b17VqnClickLeaveAnywayTza() async {
    if (B17QxnUserCheckFuncVza.instance.b17VqnIsEligibleUserTza) {
      await B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
        b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_exit,
        b17KqmAdPosIdVzr: B17JkwPosidKos.unload_2,
        b17VmqAdHostContextXtr: Get.context,
      );
    }
    _b17QxmReturnToAppVza();
    await AppSettings.openAppSettings();
  }

  void _b17QxmReturnToAppVza() {
    if (Get.isRegistered<B17HqvDashboardControllerWze>()) {
      B17FjeNavigationFuncIfj.b17WvxPopUntilNameHqt(
        B17FjeNavigationAddressIfj.b17VqmHomeRouteXza,
      );
      return;
    }
    B17JfiFirstUserFuncEjf.instance.toPageChooseLanguage();
  }
}
