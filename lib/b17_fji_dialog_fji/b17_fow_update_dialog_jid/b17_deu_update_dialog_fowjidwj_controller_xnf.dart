import 'package:app_settings/app_settings.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jiw_ad_hep_djo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jfi_new_user_hep_ejf.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_address_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_hep_ifj.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_qmx_home_vza/b17_hqv_home_controller_wze.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_fje_root_controller_sak.dart';
import 'package:get/get.dart';

class B17FowUpdateDialogControllerJid extends B17FjeRootControllerSak {
  void b17KqnClickContinueUsingVze() {
    _b17QxmReturnToAppVza();
  }

  Future<void> b17VqnClickLeaveAnywayTza() async {
    if (B17QxnUserCheckHepVza.instance.b17VqnIsEligibleUserTza) {
      await B17JiwAdHepDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
        b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_exit,
        b17KqmAdPosIdVzr: B17JkwPosidKos.unload_2,
        b17VmqAdHostContextXtr: Get.context,
      );
    }
    _b17QxmReturnToAppVza();
    await AppSettings.openAppSettings();
  }

  void _b17QxmReturnToAppVza() {
    if (Get.isRegistered<B17HqvHomeControllerWze>()) {
      B17FjeRoutersHepIfj.b17WvxPopUntilNameHqt(
        B17FjeRoutersAddressIfj.b17VqmHomeRouteXza,
      );
      return;
    }
    B17JfiNewUserHepEjf.instance.toPageChooseLanguage();
  }
}
