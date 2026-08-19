import 'dart:async';
import 'dart:convert';

import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_fji_locale_selected_efj.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_fje_applife_func_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_xfm_firebase_kqo/b17_dji_firebase_func_wjo.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_jiw_initial_startup_source_func_jdo.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_fje_device_info_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_qxn_startup_click_gate_func_vza.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_jdw_metric_type_ijd.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_dji_analytics_func_wji.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boom_notification_plugins/flutter_boom_notification_plugins.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:permission_handler/permission_handler.dart';

class B17PqnNoticeFuncVze {
  B17PqnNoticeFuncVze._();
  static final B17PqnNoticeFuncVze instance = B17PqnNoticeFuncVze._();

  bool _b17QxnInitializedVza = false;

  Future<void> b17QxnInitializeNotificationsVza({
    bool b17KqmRequestPermissionWze = false,
  }) async {
    if (_b17QxnInitializedVza) {
      return;
    }
    final bool b17VqnCanInitializeTza = await _b17HqmCanInitializeWza();
    if (!b17VqnCanInitializeTza) {
      return;
    }
    _b17KqmInitializeListenersWze();
    await _b17VqnInitializeLocalInfoTza();
    await _b17PqnInitializeTbaInfoVze();
    b17PqnUpdateNewFileTextVze();
    await _b17RqmScheduleLocalNotificationsWza();
    _b17QxnInitializeFcmVza();
    await _b17VqnInitializeBroadcastsTza();
    await b17VqnInitializeMediaNotificationTza();
    _b17HqmInitializeShortcutNotificationWza();
    _b17QxnInitializedVza = true;
    if (b17KqmRequestPermissionWze) {
      await Permission.notification.request();
      B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
        b17QxnPointTypeVza: B17JdwMetricTypeIjd.storage_system_result,
        b17KqmParametersWze: {
          "open": (await b17JpbHasNotificationPermissionBed()) ? 1 : 0,
        },
      );
      B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
        b17QxnPointTypeVza: B17JdwMetricTypeIjd.push_guide_view,
        b17KqmParametersWze: {"show_type": "system"},
      );
    }
  }

  Future<bool> b17JpbHasNotificationPermissionBed() async {
    var permissionStatus = await Permission.notification.status;
    var isGranted = permissionStatus.isGranted || permissionStatus.isLimited;
    return isGranted;
  }

  Future<void> _b17PqnInitializeTbaInfoVze() async {
    final Map<String, String> b17QxnHeaderMapVza = Map<String, String>.from(
      await B17DjiAnalyticsFuncWji.instance.b17KqnCreateHeadersVxe(),
    );
    final String b17KqmRequestUrlWze = await B17DjiAnalyticsFuncWji.instance
        .b17VqnCreateUrlTza();
    final Map<String, dynamic> b17VqnPushPayloadTza =
        await B17DjiAnalyticsFuncWji.instance.b17GetPointMapBody(
          b17QxnPointTypeVza: B17JdwMetricTypeIjd.push,
          b17KqmParametersWze: {'sourse': "local"},
        );
    FlutterBoomNotificationPlugins.instance.configureNativePushReporting(
      enabled: true,
      url: b17KqmRequestUrlWze,
      headers: b17QxnHeaderMapVza,
      payloadTemplate: b17VqnPushPayloadTza,
      distinctIdKey: "zagging",
      logIdKey: "bahama",
      clientTsKey: "prophecy",
      notificationSourceKey: "sourse~glory",
      packageKey: "pershing",
    );
  }

  void _b17HqmInitializeShortcutNotificationWza() {
    FlutterBoomNotificationPlugins.instance.showPersistentShortcutNotification(
      homeText: 'Home'.tr,
      mergeText: 'Search'.tr,
      importText: 'Scan'.tr,
      convertText: 'Convert'.tr,
      homeIcon: 'b17_hhv_func_vgc',
      mergeIcon: 'b17_aua_func_pxg',
      importIcon: 'b17_qmz_func_word_rbf',
      convertIcon: 'b17_nia_func_pdf_tmr',
    );
  }

  Future<void> b17VqnInitializeMediaNotificationTza() async {
    final bool b17QxnCanInitializeVza = await _b17HqmCanInitializeWza();
    if (!b17QxnCanInitializeVza) {
      return;
    }
    FlutterBoomNotificationPlugins.instance.periodicallyShowMediaWithDuration(
      reflectionConfig: MediaReflectionConfig(
        secret: B17FjeDeviceInfoIfj.b17KqmSecretKeyWze,
        mediaSessionClass:
            "v1:weCjDsQop8UwHcaw:BbR0cTQy9xTtS5uWoSt/f1FtfsTpTCqyCCjQRweWivi3grKkNlTNDNbRSPNrvxa1nSq7NiMuRpDPpTcH1D9gsJ4egQ==",
        mediaSessionTokenClass:
            "v1:+6buhCvyJDZnNUK0:yiGrEcs+AtyIA6at7Hz1j8zhlS+HxWMzhpt0TDeWHUZrNt1ApQkWkMQDDAuPYWaYYS7qG4kIHR38B1IzzTiWq4OGjunqjXP0zg==",
        mediaSessionTag:
            "v1:tJ62Eqh6vvrm8faL:1uTsAxBfrSc0rAmPmQrsKB1lYjDmC6fuwp8cKJ3/+Q==",
        playbackStateClass:
            "v1:u36QDcBcuO1gULRk:11n8F+t5H6jb6llYNAqhsQWooQhAURVLHkKfvRt1HReLM0dT2Y/1cZo7Kbn7ZzHaYkMXV9imENkn9pU5wkdaxjkG1VU=",
        playbackStateBuilderClass:
            "v1:pt5eSFUXFsyALbuz:xIzGa5FlJ8SdY0RqDM+AVO9P47fuPsgLFoO1VTJWq/Zusif8d0zb7/yTxjPDpue59tzwY+lNIXMiPAoPUB/ozn7Pn2ieimCO9ZdQmw==",
        mediaStyleClass:
            "v1:roe0Fj8+JMBYx19l:wo9Wp7b1mpFmUCJQh9XfuD+QbM/qgBhNaqQdbThtnrfDlOPCx/qaTP4WxhRsBDnNe/1pesuXtrxgwhFQjJtlqw==",
        setFlagsMethod: "v1:h+Gu5FfsttLG9bu7:U7SGcNPGvTvShly/ELri0DxWOADGLqXW",
        setActiveMethod:
            "v1:1pPOnn6sUXaqPB4w:U2JaNg+sjknqO1gAZF/aQDKaA6VSXIYkog==",
        setPlaybackStateMethod:
            "v1:tls75fKukeGpEG3o:paUcyoc8gjffLxvgjRHLAqzLamEDqxQ58L0MKb6LFmE=",
        getSessionTokenMethod:
            "v1:edvWEuXOpfuXKzQN:atgi4DKIMa87SC0I/TyqUgi6FhQbtu6NhqMaiFvhgw==",
        setStateMethod: "v1:ch10n6ORAXX3GTHR:j4pOtzs8NUhmv9RLs2tCRPszVCc3EjRk",
        buildMethod: "v1:BYz/1zTGxzZJAfr6:migf3KcINrwYRsSgexhjcrNVQuwr",
        setMediaSessionMethod:
            "v1:b5HfXmOyTtT1fJwr:/UF7xuWORAbHQQD75UzMHrUJHdPj2wPSQDSe7/Jv1Q==",
      ),
      mediaBackgroundImageName: 'b17_dji_large_notice_picture_wjd',
    );
  }

  Future<void> _b17VqnInitializeBroadcastsTza() async {
    FlutterBoomNotificationPlugins.instance.registerBroadcastNotifications();
  }

  void _b17QxnInitializeFcmVza() {
    FlutterBoomNotificationPlugins.instance.subscribeToTopic(
      channelId: 'b17_fcm_notice_channel',
      channelName: 'b17_fcm_notice_channel_name',
      priority: Priority.max,
      importance: Importance.max,
      style: 'beauty',
      beautyButton: 'Claim',
    );
  }

  Future<void> _b17RqmScheduleLocalNotificationsWza() async {
    FlutterBoomNotificationPlugins.instance.periodicallyShowLocalWithDuration();
  }

  void b17PqnUpdateNewFileTextVze() {
    FlutterBoomNotificationPlugins.instance.setGalleryImageNotificationInfo(
      title: 'You have a new file.'.tr,
    );
  }

  Future<void> _b17VqnInitializeLocalInfoTza() async {
    await FlutterBoomNotificationPlugins.instance.initNotification(
      icon: 'b17_jie_small_logo_oef',
      channelId: 'b17_notice_channel',
      channelName: 'b17_notice_channel_name',
      channelDescription: 'PDF notifications',
      customLayout: AndroidCustomNotificationLayout(
        smallLayoutName: 'b17_ikv_small_notice_layout_lfn',
        bigLayoutName: 'b17_xon_large_notice_layout_qoj',
        actionText: 'Check'.tr,
      ),
      showMedia: true,
      config: await _getNotificationInitConfig(),
    );
  }

  Future<NotificationInitConfig> _getNotificationInitConfig()async{
    final String b17DefaultNotificationConfig = await rootBundle.loadString(
      B17FjeDeviceInfoIfj.b17DefaultNotificationConfig,
    );
    final String b17FiledConfig = await rootBundle.loadString(
      B17FjeDeviceInfoIfj.b17FiledConfig,
    );
    var deviceLanguage="",countryCode="";
    var languageXpe = B17FjiLocaleSelectedEfj.b17VqmReadLanguageXpe();
    if(languageXpe.isNotEmpty){
      try{
        //zh-CN
        var list = languageXpe.split("-");
        deviceLanguage=list.first;
        countryCode=list.last;
      }catch(_){

      }
    }
    if(deviceLanguage.isEmpty){
      deviceLanguage=await FlutterBoomNotificationPlugins.instance.getDeviceLanguage();
    }
    if(countryCode.isEmpty){
      countryCode=await FlutterBoomNotificationPlugins.instance.getCountryCode();
    }
    return NotificationInitConfig(
      defaultConfig: b17DefaultNotificationConfig,
      request: NotificationConfigRequest(
        url: "https://prod.pdfutilitydocforge.com/LGZXGfupyG/HmtKKNYmqW/aARzBe",
        headers: {
          "imp":kDebugMode?"com.docforge.pdfutility":await FlutterTbaInfo.instance.getBundleId(),
          // "imp":await FlutterTbaInfo.instance.getBundleId(),
          "udz":kDebugMode?"0.0.1":await FlutterTbaInfo.instance.getAppVersion(),
        },
        body: {
          "iSrc":deviceLanguage,
          "DgTaa": await FlutterTbaInfo.instance.getDistinctId(),
          "pnsKCAj": countryCode,
        },
      ),
      fieldMapping: jsonDecode(b17FiledConfig),
    );
  }

  void _b17KqmInitializeListenersWze() {
    FlutterBoomNotificationPlugins.instance.setListeners(
      onNotificationClicked: (LocalNotificationEvent b17QxnEventVza) {
        final B17FjeApplifeFuncIfj b17QxnApplifeHepVza =
            B17FjeApplifeFuncIfj.instance;
        if (b17QxnApplifeHepVza.b17QxnShouldSuppressClickHotLaunchVza) {
          b17QxnApplifeHepVza.b17QxnSuppressNextHotLaunchVza();
        }
        if (!B17QxnStartupClickGateFuncVza
            .instance
            .b17KqnCanHandleNotificationClickVxe) {
          return;
        }
        final String b17VqnPayloadTza =
            b17QxnEventVza.payload ?? b17QxnEventVza.payloadType?.name ?? '';
        _b17KqmUploadClickEventWze(b17VqnPayloadTza);
        unawaited(
          b17QxnApplifeHepVza.b17YyxShowAdTwt(
            B17EipAdSceneUkg.pr_launch,
            b17VqnPayloadTza == 'media'
                ? B17JkwPosidKos.pr_open_mediapop
                : B17JkwPosidKos.pr_open_noti,
          ),
        );
      },
      onNotificationDisplayed: (LocalNotificationEvent b17VqnEventTza) {
        _b17HqmUploadShowEventWza(
          b17VqnEventTza.payload ?? b17VqnEventTza.payloadType?.name ?? '',
        );
      },
      onTimerOverlayClicked: (TimerOverlayClickEvent b17PqnEventVze) {},
      onProcessingOverlayClicked: () {},
    );
  }

  Future<void> b17KqmRefreshLanguageWze() async {
    final bool b17QxnCanInitializeVza = await _b17HqmCanInitializeWza();
    if (!b17QxnCanInitializeVza) {
      return;
    }
    await FlutterBoomNotificationPlugins.instance.refreshNotificationConfig(
      config: await _getNotificationInitConfig(),
    );
    _b17HqmInitializeShortcutNotificationWza();
    b17PqnUpdateNewFileTextVze();
  }

  Future<void> b17KqnShowAdClickNotificationVxe() async {
    final bool b17PqmCanInitializeXza = await _b17HqmCanInitializeWza();
    if (!b17PqmCanInitializeXza) {
      return;
    }
    await FlutterBoomNotificationPlugins.instance.show(
      id: _b17VqnGenerateNotificationIdTze(),
      title: "Continue viewing PDF".tr,
      body: "Continue viewing PDF".tr,
      payload: LocalNotificationPayload.local,
    );
  }

  int _b17VqnGenerateNotificationIdTze() {
    return DateTime.now().microsecondsSinceEpoch % 2147483647;
  }

  void b17RqmUploadNotificationEventDataWza() {
    if (B17JiwInitialStartupSourceFuncJdo.instance.notificationPayload !=
        null) {
      _b17KqmUploadClickEventWze(
        B17JiwInitialStartupSourceFuncJdo.instance.notificationPayload ?? '',
      );
    }
    b17TqnUploadPendingNotificationEventsVze();
  }

  Future<void> b17TqnUploadPendingNotificationEventsVze() async {
    for (final LocalNotificationPayload b17QxnPayloadVza
        in LocalNotificationPayload.values) {
      final int b17KqmDisplayedCountWze = await FlutterBoomNotificationPlugins
          .instance
          .consumeDisplayedNotificationCount(payload: b17QxnPayloadVza);
      if (b17KqmDisplayedCountWze > 0) {
        for (
          int b17VqnIndexTza = 0;
          b17VqnIndexTza < b17KqmDisplayedCountWze;
          b17VqnIndexTza++
        ) {
          _b17HqmUploadShowEventWza(b17QxnPayloadVza.value);
        }
      }
    }
  }

  void _b17KqmUploadClickEventWze(String? b17QxnEventSourceVza) {
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.inform_c,
      b17KqmParametersWze: {'sourse': b17QxnEventSourceVza},
    );
  }

  void _b17HqmUploadShowEventWza(String b17VqnEventSourceTza) {
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.push,
      b17KqmParametersWze: {'sourse': b17VqnEventSourceTza},
    );
  }

  Future<bool> _b17HqmCanInitializeWza() async {
    if (!B17QxnUserCheckFuncVza.instance.b17VqnIsEligibleUserTza) {
      return false;
    }
    final bool b17QxnSamsungDeviceVza = await FlutterBoomNotificationPlugins
        .instance
        .isSamsungDevice();
    final bool b17VqnKoreanLocaleTza = await FlutterBoomNotificationPlugins
        .instance
        .isKoreanLocale();
    if (b17QxnSamsungDeviceVza &&
        b17VqnKoreanLocaleTza &&
        !B17KqmFirebaseFuncWze.instance.b17KqmKoreanPhoneNotificationWze) {
      return false;
    }
    return true;
  }
}
