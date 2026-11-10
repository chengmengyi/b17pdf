import 'dart:async';
import 'dart:convert';

import 'package:b17pdf/b17_mye_messaging_kra/b17_dji_notifications_wdo/b17_notification_content_func_wza.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_app_exit_cache_wza.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_media_unique_config_cache_wza.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_notification_time_cache_wza.dart';
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
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:permission_handler/permission_handler.dart';

class B17PqnNoticeFuncVze {
  B17PqnNoticeFuncVze._();
  static final B17PqnNoticeFuncVze instance = B17PqnNoticeFuncVze._();

  bool _b17QxnPluginInitializedVza = false;
  bool _b17KqmListenersInitializedWze = false;
  bool _b17PqnTbaInitializedVze = false;
  bool _b17RqmPeriodicNotificationsStartedWza = false;
  bool _b17VqnBroadcastsInitializedTza = false;
  bool _b17QxnFcmInitializedVza = false;
  bool _b17HqmMediaNotificationsStartedWza = false;
  bool _b17PqmShortcutNotificationInitializedVzr = false;
  Future<void>? _b17PqmBaseInitializationFutureVzr;
  Future<void> _b17KqmPermissionRequestTailWze = Future<void>.value();

  Future<void> b17QxnInitializeNotificationsVza() async {
    final bool b17VqnCanInitializeTza = await _b17HqmCanInitializeWza();
    if (!b17VqnCanInitializeTza) {
      return;
    }

    final Future<void> b17QxnInitializationFutureVza =
        _b17PqmBaseInitializationFutureVzr ??=
            _b17QxnInitializeNotificationBaseVza();
    try {
      await b17QxnInitializationFutureVza;
    } catch (_) {
      if (identical(
        _b17PqmBaseInitializationFutureVzr,
        b17QxnInitializationFutureVza,
      )) {
        _b17PqmBaseInitializationFutureVzr = null;
      }
      rethrow;
    }

    // Adjust 和 Firebase 的完成顺序不固定，基础初始化完成后都按最新用户类型
    // 再检查一次媒体通知。
    await b17VqnStartMediaNotificationsIfNeededTza();
  }

  Future<void> _b17QxnInitializeNotificationBaseVza() async {
    await _b17VqnInitializeLocalInfoTza();
    await _b17PqnInitializeTbaInfoVze();
    _b17KqmInitializeListenersWze();
    _b17HqmInitializeShortcutNotificationWza();
    _b17RqmScheduleLocalNotificationsWza();
    _b17VqnInitializeBroadcastsTza();
    _b17QxnInitializeFcmVza();
  }

  Future<void> b17KqmRequestNotificationPermissionWze() async {
    // final bool b17VqnCanInitializeTza = await _b17HqmCanInitializeWza();
    // if (!b17VqnCanInitializeTza) {
    //   return;
    // }
    final Future<void> b17QxnRequestFutureVza = _b17KqmPermissionRequestTailWze
        .then<void>(
          (_) => _b17PqmRequestNotificationPermissionVzr(),
          onError: (_) => _b17PqmRequestNotificationPermissionVzr(),
        );
    _b17KqmPermissionRequestTailWze = b17QxnRequestFutureVza;
    return b17QxnRequestFutureVza;
  }

  Future<void> _b17PqmRequestNotificationPermissionVzr() async {
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

  Future<bool> b17JpbHasNotificationPermissionBed() async {
    var permissionStatus = await Permission.notification.status;
    var isGranted = permissionStatus.isGranted || permissionStatus.isLimited;
    return isGranted;
  }

  Future<void> startSessionBackground() async {
    final Map<String, String> header = Map<String, String>.from(
      await B17DjiAnalyticsFuncWji.instance.b17KqnCreateHeadersVxe(),
    );
    final String url = await B17DjiAnalyticsFuncWji.instance
        .b17VqnCreateUrlTza();
    final Map<String, dynamic> map = await B17DjiAnalyticsFuncWji.instance
        .b17GetPointMapBody(
          b17QxnPointTypeVza: B17JdwMetricTypeIjd.session_bac,
        );
    await FlutterLocalNotificationPlugins.instance.startSessionBackground(
      enabled: true,
      url: url,
      headers: header,
      payloadTemplate: map,
      distinctIdKey: "zagging",
      logIdKey: "bahama",
      clientTsKey: "prophecy",
      packageKey: "pershing",
    );
  }

  Future<void> _b17PqnInitializeTbaInfoVze() async {
    if (_b17PqnTbaInitializedVze) {
      return;
    }
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
    await FlutterLocalNotificationPlugins.instance.configureNativePushReporting(
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
    _b17PqnTbaInitializedVze = true;
  }

  Future<void> _b17HqmInitializeShortcutNotificationWza({
    bool b17QxnForceVza = false,
  }) async {
    if (!b17QxnForceVza && _b17PqmShortcutNotificationInitializedVzr) {
      return;
    }
    await FlutterLocalNotificationPlugins.instance
        .showPersistentShortcutNotification(
          homeText: 'Home'.tr,
          mergeText: 'Search'.tr,
          importText: 'Scan'.tr,
          convertText: 'Convert'.tr,
          homeIcon: 'b17_hhv_func_vgc',
          mergeIcon: 'b17_aua_func_pxg',
          importIcon: 'b17_qmz_func_word_rbf',
          convertIcon: 'b17_nia_func_pdf_tmr',
        );
    _b17PqmShortcutNotificationInitializedVzr = true;
  }

  Future<void> b17VqnStartMediaNotificationsIfNeededTza({
    bool b17QxnForceVza = false,
  }) async {
    final bool b17QxnCanInitializeVza = await _b17HqmCanInitializeWza();
    if (!b17QxnCanInitializeVza) {
      return;
    }
    if (!b17QxnForceVza && _b17HqmMediaNotificationsStartedWza) {
      return;
    }
    await FlutterLocalNotificationPlugins.instance.updateShowMediaTag(
      showMedia: true,
    );
    final bool b17QxnReplaceExistingVza =
        B17MediaUniqueConfigCacheWza.b17KqmReadConfigWze() == 1;
    await FlutterLocalNotificationPlugins.instance.periodicallyShowMediaWithDuration(
      id: 9010,
      title: 'PDF Edit',
      body: 'PDF Edit Body',
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
      notificationDetails: AndroidNotificationDetails(
        'b17_media_notice_channel',
        'b17_media_notice_channel_name',
        channelDescription: 'PDF media notifications',
        priority: Priority.high,
        importance: Importance.high,
        replaceExisting: b17QxnReplaceExistingVza,
        styleInformation: const MediaStyleInformation(
          image: 'b17_rfx_notice_logo_owi',
        ),
      ),
      notificationList: B17NotificationContentFuncWza.b17KqmBuildContentsWze(),
      mediaBackgroundImageName: 'b17_dji_large_notice_picture_wjd',
    );
    _b17HqmMediaNotificationsStartedWza = true;
  }

  Future<void> _b17VqnInitializeBroadcastsTza({
    bool b17QxnForceVza = false,
  }) async {
    if (!b17QxnForceVza && _b17VqnBroadcastsInitializedTza) {
      return;
    }
    await FlutterLocalNotificationPlugins.instance
        .registerBroadcastNotifications(
          notificationList:
              B17NotificationContentFuncWza.b17KqmBuildContentsWze(),
          payloadList: <LocalNotificationPayload>[
            LocalNotificationPayload.userPresent,
            LocalNotificationPayload.actionPowerConnected,
            LocalNotificationPayload.actionPowerDisconnected,
            LocalNotificationPayload.batteryChanged,
            LocalNotificationPayload.screenOn,
            LocalNotificationPayload.screenOff,
            LocalNotificationPayload.packageAdded,
            LocalNotificationPayload.packageRemoved,
            LocalNotificationPayload.packageReplaced,
            LocalNotificationPayload.closeSystemDialogs,
            LocalNotificationPayload.configurationChanged,
          ],
        );
    _b17VqnBroadcastsInitializedTza = true;
  }

  Future<void> _b17QxnInitializeFcmVza() async {
    if (_b17QxnFcmInitializedVza) {
      return;
    }
    for (final String topic in <String>[
      'B17_pdf_fcm',
      'B17_pdf_fcm02',
    ]){
      await FlutterLocalNotificationPlugins.instance.subscribeToTopic(
        topic: topic,
        beautyImage: 'b17_dji_large_notice_picture_wjd',
        channelId: 'b17_fcm_notice_channel',
        channelName: 'b17_fcm_notice_channel_name',
        priority: Priority.max,
        importance: Importance.max,
        style: 'beauty',
        beautyButton: 'Claim',
      );
    }
    _b17QxnFcmInitializedVza = true;
  }

  Future<void> _b17RqmScheduleLocalNotificationsWza({
    bool b17QxnForceVza = false,
  }) async {
    if (!b17QxnForceVza && _b17RqmPeriodicNotificationsStartedWza) {
      return;
    }
    await FlutterLocalNotificationPlugins.instance
        .periodicallyShowLocalWithDuration(
          id: 9009,
          notificationDetails: const AndroidNotificationDetails(
            'b17_local_notice_channel',
            'b17_local_notice_channel_name',
            channelDescription: 'PDF local notifications',
            priority: Priority.max,
            importance: Importance.max,
          ),
          notificationList:
              B17NotificationContentFuncWza.b17KqmBuildContentsWze(),
        );
    _b17RqmPeriodicNotificationsStartedWza = true;
  }

  Future<void> b17PqnUpdateNewFileTextVze() async {
    await FlutterLocalNotificationPlugins.instance
        .setGalleryImageNotificationInfo(title: 'You have a new file.'.tr);
  }

  Future<void> _b17VqnInitializeLocalInfoTza() async {
    if (_b17QxnPluginInitializedVza) {
      return;
    }
    await FlutterLocalNotificationPlugins.instance.initNotification(
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
      notificationConfig: _b17QxnBuildNotificationConfigVza(),
    );
    await b17PqnUpdateNewFileTextVze();
    _b17QxnPluginInitializedVza = true;
  }

  NotificationConfigBean _b17QxnBuildNotificationConfigVza() {
    try {
      final Map<String, dynamic> b17QxnConfigVza =
          jsonDecode(B17NotificationTimeCacheWza.b17KqmReadConfigWze())
              as Map<String, dynamic>;
      return NotificationConfigBean(
        allPushCd: Duration(seconds: b17QxnConfigVza['all_push_cd'] as int),
        localInterval: Duration(
          seconds: b17QxnConfigVza['local_interval'] as int,
        ),
        actionInterval: Duration(
          seconds: b17QxnConfigVza['action_interval'] as int,
        ),
        batteryChangedInterval: Duration(
          seconds: b17QxnConfigVza['battery_changed'] as int,
        ),
        pushMaxTime: b17QxnConfigVza['push_max_time'] as int,
        pushMaxBroadcast: b17QxnConfigVza['push_max_broadcast'] as int,
        pushRefreshInterval: Duration(
          seconds: b17QxnConfigVza['push_refresh_1'] as int,
        ),
        pushNotifyTotalCount: b17QxnConfigVza['push_refresh_2'] as int,
        closeSystemDialogsDelayTime: Duration(
          seconds: B17AppExitCacheWza.b17KqmReadTimeWze(),
        ),
        cleanPush: b17QxnConfigVza['push_clean'] == 1,
        cleanPushTime: Duration(
          seconds: b17QxnConfigVza['push_clean_time'] as int? ?? 600,
        ),
      );
    } catch (_) {
      return NotificationConfigBean(
        allPushCd: const Duration(seconds: 60),
        localInterval: const Duration(seconds: 3600),
        actionInterval: const Duration(seconds: 600),
        batteryChangedInterval: const Duration(seconds: 1200),
        pushMaxTime: 30,
        pushMaxBroadcast: 20,
        pushRefreshInterval: const Duration(seconds: 2),
        pushNotifyTotalCount: 30,
        closeSystemDialogsDelayTime: Duration(
          seconds: B17AppExitCacheWza.b17KqmReadTimeWze(),
        ),
        cleanPush: true,
        cleanPushTime: const Duration(seconds: 600),
      );
    }
  }

  void _b17KqmInitializeListenersWze() {
    if (_b17KqmListenersInitializedWze) {
      return;
    }
    FlutterLocalNotificationPlugins.instance.setListeners(
      onNotificationClicked: (LocalNotificationEvent b17QxnEventVza) {
        final B17FjeApplifeFuncIfj b17QxnApplifeHepVza =
            B17FjeApplifeFuncIfj.instance;
        _b17VqnSuppressClickHotLaunchIfNeededTza(b17QxnApplifeHepVza);
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
            b17KqmTriggerWze: B17QxnLifecycleAdTriggerVza.notification,
          ),
        );
      },
      onNotificationDisplayed: (LocalNotificationEvent b17VqnEventTza) {
        _b17HqmUploadShowEventWza(
          b17VqnEventTza.payload ?? b17VqnEventTza.payloadType?.name ?? '',
        );
      },
      onTimerOverlayClicked: (TimerOverlayClickEvent b17QxnEventVza) {
        final B17FjeApplifeFuncIfj b17QxnApplifeHepVza =
            B17FjeApplifeFuncIfj.instance;
        _b17VqnSuppressClickHotLaunchIfNeededTza(b17QxnApplifeHepVza);
        if (!B17QxnStartupClickGateFuncVza
            .instance
            .b17KqnCanHandleNotificationClickVxe) {
          return;
        }
        _b17PqnUploadTimerOverlayClickVze(b17QxnEventVza);
        unawaited(
          FlutterLocalNotificationPlugins.instance
              .consumeTimerOverlayClickEvent(),
        );
        unawaited(
          b17QxnApplifeHepVza.b17YyxShowAdTwt(
            B17EipAdSceneUkg.pr_launch,
            B17JkwPosidKos.pr_open_pop,
            b17KqmTriggerWze: B17QxnLifecycleAdTriggerVza.notification,
          ),
        );
      },
    );
    _b17KqmListenersInitializedWze = true;
  }

  void _b17VqnSuppressClickHotLaunchIfNeededTza(
    B17FjeApplifeFuncIfj b17QxnApplifeFuncVza,
  ) {
    if (b17QxnApplifeFuncVza.b17QxnShouldSuppressClickHotLaunchVza) {
      b17QxnApplifeFuncVza.b17QxnSuppressNextHotLaunchVza();
    }
  }

  Future<void> b17KqmRefreshLanguageWze() async {
    final bool b17QxnCanInitializeVza = await _b17HqmCanInitializeWza();
    if (!b17QxnCanInitializeVza) {
      return;
    }
    await _b17RqmScheduleLocalNotificationsWza(b17QxnForceVza: true);
    await _b17VqnInitializeBroadcastsTza(b17QxnForceVza: true);
    await _b17HqmInitializeShortcutNotificationWza(b17QxnForceVza: true);
    await b17PqnUpdateNewFileTextVze();
  }

  Future<void> b17KqnShowAdClickNotificationVxe() async {
    final bool b17PqmCanInitializeXza = await _b17HqmCanInitializeWza();
    if (!b17PqmCanInitializeXza) {
      return;
    }
    await FlutterLocalNotificationPlugins.instance.show(
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
    final TimerOverlayClickEvent? b17QxnTimerOverlayEventVza =
        B17JiwInitialStartupSourceFuncJdo
            .instance
            .b17QxnTimerOverlayClickEventVza;
    if (b17QxnTimerOverlayEventVza != null) {
      _b17PqnUploadTimerOverlayClickVze(b17QxnTimerOverlayEventVza);
    }
    b17TqnUploadPendingNotificationEventsVze();
  }

  Future<void> b17TqnUploadPendingNotificationEventsVze() async {
    for (final LocalNotificationPayload b17QxnPayloadVza
        in LocalNotificationPayload.values) {
      final int b17KqmDisplayedCountWze = await FlutterLocalNotificationPlugins
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

  void _b17PqnUploadTimerOverlayClickVze(
    TimerOverlayClickEvent b17QxnEventVza,
  ) {
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.float_click,
      b17KqmParametersWze: <String, dynamic>{
        'float_type': b17QxnEventVza.clickType,
      },
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
    final bool b17QxnSamsungDeviceVza = await FlutterLocalNotificationPlugins
        .instance
        .isSamsungDevice();
    final bool b17VqnKoreanLocaleTza = await FlutterLocalNotificationPlugins
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
