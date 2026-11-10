import 'package:b17pdf/b17_gve_telemetry_rkx/b17_xfm_firebase_kqo/b17_dji_firebase_func_wjo.dart';
import 'package:b17pdf/b17_mye_messaging_kra/b17_dji_notifications_wdo/b17_jso_notice_func_wko.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_address_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_fji_locale_selected_efj.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_qxn_guide_completed_cache_vza.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_qxn_overlay_permission_open_date_cache_vza.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_qxm_select_locale_vza/b17_hqm_select_locale_controller_wza.dart';
import 'package:b17pdf/b17_mye_messaging_kra/b17_rqm_notice_access_vza/b17_hqv_open_notice_controller_wze.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';
import 'package:get/get.dart';

class B17JfiFirstUserFuncEjf {
  static final B17JfiFirstUserFuncEjf _b17JfinewUserHepEjf =
      B17JfiFirstUserFuncEjf();
  static B17JfiFirstUserFuncEjf get instance => _b17JfinewUserHepEjf;

  //语言选择页没有点确定----启动app：悬浮窗->语言选择页->引导页->通知->首页
  //语言选择页点确定----启动app：悬浮窗->引导页->通知->首页
  Future<void> toPageAfterLauncher() async {
    var checkOverlayPermission = await FlutterLocalNotificationPlugins.instance
        .checkOverlayPermission();
    if (!checkOverlayPermission && _b17QxnCanOpenOverlayPermissionTodayVza()) {
      await B17QxnOverlayPermissionOpenDateCacheVza.b17VqnSaveDateTza(
        _b17QxnTodayVza(),
      );
      B17FjeNavigationFuncIfj.b17ZxpReplaceNamedLrt<void>(
        b17YweRouteNameQpn:
            B17FjeNavigationAddressIfj.b17NqvOverlayPermissionRouteWza,
      );
      return;
    }
    toPageChooseLanguage();
  }

  void toPageChooseLanguage() {
    if (B17FjiLocaleSelectedEfj.b17VqmReadLanguageXpe().isEmpty) {
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
    toPageGuide();
  }

  void toPageGuide() {
    if (B17KqmFirebaseFuncWze.instance.showGuidePage&&!B17QxnGuideCompletedCacheVza.b17KqmReadCompletedWze()) {
      B17FjeNavigationFuncIfj.b17ZxpReplaceNamedLrt<void>(
        b17YweRouteNameQpn: B17FjeNavigationAddressIfj.b17QxnGuideRouteVza,
      );
      return;
    }
    toPageOpenNotificationPermission();
  }

  bool _b17QxnCanOpenOverlayPermissionTodayVza() {
    return B17QxnOverlayPermissionOpenDateCacheVza.b17KqmReadDateWze() !=
        _b17QxnTodayVza();
  }

  String _b17QxnTodayVza() {
    final DateTime b17QxnNowVza = DateTime.now();
    final String b17KqmYearWze = (b17QxnNowVza.year % 100).toString().padLeft(
      2,
      '0',
    );
    final String b17VqnMonthTza = b17QxnNowVza.month.toString().padLeft(2, '0');
    final String b17HqmDayWza = b17QxnNowVza.day.toString().padLeft(2, '0');
    return '$b17KqmYearWze-$b17VqnMonthTza-$b17HqmDayWza';
  }

  Future<void> toPageOpenNotificationPermission() async {
    var result = await B17PqnNoticeFuncVze.instance
        .b17JpbHasNotificationPermissionBed();
    if (!result) {
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

  void toHome() {
    B17FjeNavigationFuncIfj.b17ZxpReplaceNamedLrt<void>(
      b17YweRouteNameQpn: B17FjeNavigationAddressIfj.b17VqmHomeRouteXza,
    );
  }
}
