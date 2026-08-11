import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jiw_ad_hep_djo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fje_applife_hep_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_firebase_hep_wjo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fje_language_hep_ifj/b17_kqm_language_hep_vza.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jiw_cold_launcher_source_hep_jdo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fje_quick_action_hep_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_address_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_dji_tba_hep_wji.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'b17_dji_hep_jdo/b17_dji_notification_hep_wdo/b17_jso_notification_hep_wko.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await GetStorage.init();
  await B17JiwColdLauncherSourceHepJdo.instance.b17CchInitSourceQrc();
  B17KqmFirebaseHepWze.instance.b17QxnInitializeFirebaseVza();
  B17JiwAdHepDjo.b17KqmAdUtilsInstanceVzr.b17PqmInitializeAdSdkVzr();
  await B17FjeQuickActionHepIfj.instance.init();
  B17QxnUserCheckHepVza.instance.b17HqmInitializeAttributionWza();
  final Locale b17QmxInitialLocaleVza =
      B17KqmLanguageHepVza.b17RmqResolveInitialLocaleXve();
  B17PqnNotificationHepVze.instance.b17QxnInitializeNotificationsVza(
    b17KqmRequestPermissionWze: true,
  );
  B17DjiTbaHepWji.instance.b17QxnUploadInstallVza();
  B17PqnNotificationHepVze.instance.b17RqmUploadNotificationEventDataWza();

  runApp(B17VqmApplicationXza(b17HqmInitialLocaleWze: b17QmxInitialLocaleVza));
}

class B17VqmApplicationXza extends StatelessWidget {
  const B17VqmApplicationXza({super.key, required this.b17HqmInitialLocaleWze});

  final Locale b17HqmInitialLocaleWze;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 780),
      builder: (BuildContext b17KqmContextWze, Widget? b17VqnChildXra) =>
          RefreshConfiguration(
            springDescription: const SpringDescription(
              mass: 0.8,
              stiffness: 150,
              damping: 20.0,
            ),
            child: GetMaterialApp(
              onGenerateTitle: (BuildContext b17TqmContextWva) => 'PDF'.tr,
              enableLog: true,
              darkTheme: ThemeData.dark(),
              themeMode: ThemeMode.system,
              debugShowCheckedModeBanner: false,
              translations: B17KqmLanguageHepVza(),
              locale: b17HqmInitialLocaleWze,
              fallbackLocale: B17KqmLanguageHepVza.b17CqnFallbackLocaleXwa,
              supportedLocales: B17KqmLanguageHepVza.b17JxqSupportedLocalesVte,
              initialRoute: B17FjeRoutersAddressIfj.b17KfmLauncherRouteOqa,
              getPages: B17FjeRoutersAddressIfj.b17RxqPagesTma,
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
