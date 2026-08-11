import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_notification_hep_wdo/b17_jso_notification_hep_wko.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_address_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_hep_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fji_storage_hep_ejf/b17_fef_storage_hep_jei/b17_fji_language_selected_efj.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_qxm_choose_language_vza/b17_hqm_choose_language_controller_wza.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_rqm_open_notification_page_vza/b17_hqv_open_notification_controller_wze.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class B17JfiNewUserHepEjf {
  static final B17JfiNewUserHepEjf _b17JfinewUserHepEjf = B17JfiNewUserHepEjf();
  static B17JfiNewUserHepEjf get instance => _b17JfinewUserHepEjf;

  //语言选择页没有点确定----启动app：悬浮窗->语言选择页->通知->首页
  //语言选择页点确定----启动app：悬浮窗->通知->首页
  //这个包测试一下没有悬浮窗的
  // toPageAfterLauncher()async{
  //   var checkOverlayPermission = await FlutterLocalNotificationPlugins.instance.checkOverlayPermission();
  //   if(!checkOverlayPermission){
  //     B17FjeRoutersHepIfj.b17ZxpReplaceNamedLrt<void>(
  //       b17YweRouteNameQpn:
  //       B17FjeRoutersAddressIfj.b17NqvOverlayPermissionRouteWza,
  //     );
  //     return;
  //   }
  //   toPageAfterOverlay();
  // }

  //语言选择页没有点确定----启动app：语言选择页->通知->首页
  //语言选择页点确定----启动app：通知->首页
  toPageChooseLanguage() {
    if (B17FjiLanguageSelectedEfj.b17VqmReadLanguageXpe().isEmpty) {
      // B17FjeRoutersHepIfj.b17ZxpReplaceNamedLrt<void>(
      //   b17YweRouteNameQpn:
      //   B17FjeRoutersAddressIfj.b17HqmChooseLanguageRouteWza,
      // );
      if (Get.isRegistered<B17HqmChooseLanguageControllerWza>()) {
        B17FjeRoutersHepIfj.b17WvxPopUntilNameHqt(
          B17FjeRoutersAddressIfj.b17HqmChooseLanguageRouteWza,
        );
      } else {
        B17FjeRoutersHepIfj.b17ZxpReplaceNamedLrt<void>(
          b17YweRouteNameQpn:
              B17FjeRoutersAddressIfj.b17HqmChooseLanguageRouteWza,
        );
      }
      return;
    }
    toPageOpenNotificationPermission();
  }

  toPageOpenNotificationPermission() async {
    var result = await B17PqnNotificationHepVze.instance
        .b17JpbHasNotificationPermissionBed();
    if (!result) {
      // B17FjeRoutersHepIfj.b17ZxpReplaceNamedLrt<void>(
      //   b17YweRouteNameQpn:
      //   B17FjeRoutersAddressIfj.b17HqmNotificationRouteWza,
      // );
      if (Get.isRegistered<B17HqvOpenNotificationControllerWze>()) {
        B17FjeRoutersHepIfj.b17WvxPopUntilNameHqt(
          B17FjeRoutersAddressIfj.b17HqmNotificationRouteWza,
        );
      } else {
        B17FjeRoutersHepIfj.b17ZxpReplaceNamedLrt<void>(
          b17YweRouteNameQpn:
              B17FjeRoutersAddressIfj.b17HqmNotificationRouteWza,
        );
      }
      return;
    }
    toHome();
  }

  toHome() {
    B17FjeRoutersHepIfj.b17ZxpReplaceNamedLrt<void>(
      b17YweRouteNameQpn: B17FjeRoutersAddressIfj.b17VqmHomeRouteXza,
    );
  }
}
