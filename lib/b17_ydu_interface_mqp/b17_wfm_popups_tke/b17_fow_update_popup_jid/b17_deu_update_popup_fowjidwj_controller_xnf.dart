import 'package:app_settings/app_settings.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_jfi_first_user_func_ejf.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_address_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_rke_documents_wpt/b17_qmx_workspace_vza/b17_hqv_dashboard_controller_wze.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_fje_base_controller_sak.dart';
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
    B17JfiFirstUserFuncEjf.instance.toPageAfterLauncher();
  }
}
