import 'package:b17pdf/b17_mye_messaging_kra/b17_dji_notifications_wdo/b17_jso_notice_func_wko.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_address_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_fji_locale_selected_efj.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_qxm_select_locale_vza/b17_hqm_select_locale_controller_wza.dart';
import 'package:b17pdf/b17_mye_messaging_kra/b17_rqm_notice_access_vza/b17_hqv_open_notice_controller_wze.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class B17JfiFirstUserFuncEjf {
  static final B17JfiFirstUserFuncEjf _b17JfinewUserHepEjf =
      B17JfiFirstUserFuncEjf();
  static B17JfiFirstUserFuncEjf get instance => _b17JfinewUserHepEjf;

  //语言选择页没有点确定----启动app：悬浮窗->语言选择页->通知->首页
  //语言选择页点确定----启动app：悬浮窗->通知->首页
  //这个包测试一下没有悬浮窗的
  // toPageAfterLauncher()async{
  //   var checkOverlayPermission = await FlutterLocalNotificationPlugins.instance.checkOverlayPermission();
  //   if(!checkOverlayPermission){
  //     B17FjeNavigationFuncIfj.b17ZxpReplaceNamedLrt<void>(
  //       b17YweRouteNameQpn:
  //       B17FjeNavigationAddressIfj.b17NqvOverlayPermissionRouteWza,
  //     );
  //     return;
  //   }
  //   toPageAfterOverlay();
  // }

  //语言选择页没有点确定----启动app：语言选择页->通知->首页
  //语言选择页点确定----启动app：通知->首页
  toPageChooseLanguage() {
    if (B17FjiLocaleSelectedEfj.b17VqmReadLanguageXpe().isEmpty) {
      // B17FjeNavigationFuncIfj.b17ZxpReplaceNamedLrt<void>(
      //   b17YweRouteNameQpn:
      //   B17FjeNavigationAddressIfj.b17HqmChooseLanguageRouteWza,
      // );
      if (Get.isRegistered<B17HqmSelectLocaleControllerWza>()) {
        B17FjeNavigationFuncIfj.b17WvxPopUntilNameHqt(
          B17FjeNavigationAddressIfj.b17HqmChooseLanguageRouteWza,
        );
      } else {
        B17FjeNavigationFuncIfj.b17ZxpReplaceNamedLrt<void>(
          b17YweRouteNameQpn:
              B17FjeNavigationAddressIfj.b17HqmChooseLanguageRouteWza,
        );
      }
      return;
    }
    toPageOpenNotificationPermission();
  }

  toPageOpenNotificationPermission() async {
    var result = await B17PqnNoticeFuncVze.instance
        .b17JpbHasNotificationPermissionBed();
    if (!result) {
      // B17FjeNavigationFuncIfj.b17ZxpReplaceNamedLrt<void>(
      //   b17YweRouteNameQpn:
      //   B17FjeNavigationAddressIfj.b17HqmNotificationRouteWza,
      // );
      if (Get.isRegistered<B17HqvOpenNoticeControllerWze>()) {
        B17FjeNavigationFuncIfj.b17WvxPopUntilNameHqt(
          B17FjeNavigationAddressIfj.b17HqmNotificationRouteWza,
        );
      } else {
        B17FjeNavigationFuncIfj.b17ZxpReplaceNamedLrt<void>(
          b17YweRouteNameQpn:
              B17FjeNavigationAddressIfj.b17HqmNotificationRouteWza,
        );
      }
      return;
    }
    toHome();
  }

  toHome() {
    B17FjeNavigationFuncIfj.b17ZxpReplaceNamedLrt<void>(
      b17YweRouteNameQpn: B17FjeNavigationAddressIfj.b17VqmHomeRouteXza,
    );
  }
}
