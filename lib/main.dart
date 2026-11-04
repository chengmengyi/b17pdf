import 'dart:async';

import 'package:b17pdf/b17_gve_telemetry_rkx/b17_qxn_overlay_func_vza.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_fje_device_info_ifj.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_xfm_firebase_kqo/b17_dji_firebase_func_wjo.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fje_localization_ifj/b17_kqm_locale_func_vza.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_jiw_initial_startup_source_func_jdo.dart';
import 'package:b17pdf/b17_mye_messaging_kra/b17_gmn_shortcuts_bzl/b17_fje_shortcut_func_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_address_ifj.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_dji_analytics_func_wji.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:b17pdf/b17_mye_messaging_kra/b17_dji_notifications_wdo/b17_jso_notice_func_wko.dart';
import 'package:flutter_headless_lifecycle_bootstrap/flutter_headless_lifecycle_bootstrap.dart';

@pragma('vm:entry-point')
Future<void> cycleMainB17() async {
  await FlutterHeadlessLifecycleBootstrap.run(
    backgroundInitializer: initB17Background,
    uiInitializer: initB17UI,
  );
}

Future<void> initB17Background() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  // Service 无界面拉活也上报 install；不要在这里上报 session。
  B17DjiAnalyticsFuncWji.instance.b17QxnUploadInstallVza();

  // 后台首次拉起时 GetMaterialApp 尚未创建，必须先手动初始化 GetX 翻译。
  Get.addTranslations(B17KqmLocaleFuncVza().keys);
  Get.locale = B17KqmLocaleFuncVza.b17RmqResolveInitialLocaleXve();
  Get.fallbackLocale = const Locale('en', 'US');

  B17PqnNoticeFuncVze.instance.startSessionBackground();
  unawaited(B17KqmFirebaseFuncWze.instance.b17QxnInitializeFirebaseVza());
  await B17QxnUserCheckFuncVza.instance.b17HqmInitializeAttributionWza();
}

Future<void> initB17UI() async {
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);
  await B17JiwInitialStartupSourceFuncJdo.instance.b17CchInitSourceQrc();
  B17KqmFirebaseFuncWze.instance.b17QxnInitializeFirebaseVza();
  B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17PqmInitializeAdSdkVzr();
  await B17FjeShortcutFuncIfj.instance.init(
    b17QxnEnabledVza: B17QxnUserCheckFuncVza.instance.b17VqnIsEligibleUserTza,
  );
  final Locale b17QmxInitialLocaleVza =
      B17KqmLocaleFuncVza.b17RmqResolveInitialLocaleXve();
  B17PqnNoticeFuncVze.instance.b17QxnInitializeNotificationsVza();
  B17DjiAnalyticsFuncWji.instance.b17QxnUploadInstallVza();
  B17DjiAnalyticsFuncWji.instance.b17VqnUploadSessionTza();
  B17QxnOverlayFuncVza.instance.b17QxnInitializeOverlayVza();
  B17PqnNoticeFuncVze.instance.b17RqmUploadNotificationEventDataWza();

  runApp(B17VqmApplicationXza(b17HqmInitialLocaleWze: b17QmxInitialLocaleVza));
}

Future<void> main() async {
  await cycleMainB17();
}

class B17VqmApplicationXza extends StatelessWidget {
  const B17VqmApplicationXza({super.key, required this.b17HqmInitialLocaleWze});

  final Locale b17HqmInitialLocaleWze;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 790),
      builder: (BuildContext b17KqmContextWze, Widget? b17VqnChildXra) =>
          RefreshConfiguration(
            springDescription: const SpringDescription(
              mass: 0.8,
              stiffness: 150,
              damping: 20.0,
            ),
            child: GetMaterialApp(
              title: B17FjeDeviceInfoIfj.b17QxnApplicationNameVza,
              enableLog: true,
              darkTheme: ThemeData.dark(),
              themeMode: ThemeMode.system,
              debugShowCheckedModeBanner: false,
              translations: B17KqmLocaleFuncVza(),
              locale: b17HqmInitialLocaleWze,
              fallbackLocale: B17KqmLocaleFuncVza.b17CqnFallbackLocaleXwa,
              supportedLocales: B17KqmLocaleFuncVza.b17JxqSupportedLocalesVte,
              initialRoute: B17FjeNavigationAddressIfj.b17KfmLauncherRouteOqa,
              getPages: B17FjeNavigationAddressIfj.b17RxqPagesTma,
              defaultTransition: Transition.rightToLeft,
              localizationsDelegates: const [
                RefreshLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              builder:
                  (BuildContext b17PqmContextWza, Widget? b17VqnWidgetXre) {
                    return MediaQuery(
                      data: MediaQuery.of(
                        b17PqmContextWza,
                      ).copyWith(textScaler: const TextScaler.linear(1.0)),
                      child: b17VqnWidgetXre ?? const SizedBox.shrink(),
                    );
                  },
            ),
          ),
    );
  }
}
