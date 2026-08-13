import 'dart:async';
import 'dart:convert';

import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fje_applife_func_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_firebase_func_wjo.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jiw_initial_startup_source_func_jdo.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fje_device_info_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_qxn_startup_click_gate_func_vza.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_notice_func_wdo/b17_vdt_broadcast_list_infi_opt.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_notice_func_wdo/b17_dji_notice_list_info_wjd.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fef_cache_func_jei/b17_jid_media_unique_config_wjo.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fef_cache_func_jei/b17_fji_notice_time_efj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_jdw_metric_type_ijd.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_dji_analytics_func_wji.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';
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
    final Map<String, dynamic> b17VqnPushPayloadTza = await B17DjiAnalyticsFuncWji.instance.b17GetPointMapBody(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.push,
      b17KqmParametersWze: {'sourse': "local"},
    );
    FlutterLocalNotificationPlugins.instance.configureNativePushReporting(
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
    FlutterLocalNotificationPlugins.instance.showPersistentShortcutNotification(
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
    FlutterLocalNotificationPlugins.instance.updateShowMediaTag(
      showMedia: true,
    );
    final bool b17KqmReplaceExistingWze =
        B17JidMediaUniqueConfigWjo.b17VqmReadXpe() == 1;
    FlutterLocalNotificationPlugins.instance.periodicallyShowMediaWithDuration(
      id: 9010,
      repeatDurationInterval: _b17PqnNotificationIntervalVze(),
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
        channelDescription: 'pdf media notification desc',
        priority: Priority.high,
        importance: Importance.high,
        replaceExisting: b17KqmReplaceExistingWze,
        styleInformation: const MediaStyleInformation(
          image: 'b17_rfx_notice_logo_owi',
        ),
      ),
      notificationList:
          await B17HqmNoticeContentFuncWza.b17KqmBuildContentsWze(),
      mediaBackgroundImageName: 'b17_dji_large_notice_picture_wjd',
    );
  }

  Future<void> _b17VqnInitializeBroadcastsTza() async {
    FlutterLocalNotificationPlugins.instance.registerBroadcastNotifications(
      notificationList:
          await B17HqmNoticeContentFuncWza.b17KqmBuildContentsWze(),
      configList: B17VqnBroadcastConfigFuncTza.b17KqmBuildConfigsWze(),
    );
  }

  void _b17QxnInitializeFcmVza() {
    for (final String b17KqmTopicWze in <String>[
      'B17_pdf_fcm',
      'B17_pdf_fcm02',
    ]) {
      FlutterLocalNotificationPlugins.instance.subscribeToTopic(
        b17KqmTopicWze,
        channelId: 'b17_fcm_notice_channel',
        channelName: 'b17_fcm_notice_channel_name',
        priority: Priority.max,
        importance: Importance.max,
        style: 'beauty',
        beautyButton: 'Claim',
      );
    }
  }

  Future<void> _b17RqmScheduleLocalNotificationsWza() async {
    FlutterLocalNotificationPlugins.instance.periodicallyShowLocalWithDuration(
      id: 9009,
      repeatDurationInterval: _b17PqnNotificationIntervalVze(),
      notificationDetails: AndroidNotificationDetails(
        'b17_local_notice_channel',
        'b17_local_notice_channel_name',
        channelDescription: 'PDF local notifications',
        priority: Priority.max,
        importance: Importance.max,
      ),
      notificationList:
          await B17HqmNoticeContentFuncWza.b17KqmBuildContentsWze(),
    );
  }

  Duration _b17PqnNotificationIntervalVze() {
    try {
      final String b17QxnConfigTextVza = B17FjiNoticeTimeEfj.b17VqmReadXpe();
      final dynamic b17VqnConfigJsonTza = jsonDecode(b17QxnConfigTextVza);
      final int b17KqmIntervalSecondsWze =
          b17VqnConfigJsonTza['local_interval'] as int;
      if (b17KqmIntervalSecondsWze > 0) {
        return Duration(seconds: b17KqmIntervalSecondsWze);
      }
    } catch (_) {}
    return Duration(minutes: 30);
  }

  void b17PqnUpdateNewFileTextVze() {
    FlutterLocalNotificationPlugins.instance.setGalleryImageNotificationInfo(
      title: 'You have a new file.'.tr,
    );
  }

  Future<void> _b17VqnInitializeLocalInfoTza() async {
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
    );
  }

  void _b17KqmInitializeListenersWze() {
    FlutterLocalNotificationPlugins.instance.setListeners(
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

  Future<void> b17KqmRefreshScheduleWze() async {
    final bool b17QxnCanInitializeVza = await _b17HqmCanInitializeWza();
    if (!b17QxnCanInitializeVza) {
      return;
    }
    await _b17RqmScheduleLocalNotificationsWza();
    await _b17VqnInitializeBroadcastsTza();
    await b17VqnInitializeMediaNotificationTza();
  }

  Future<void> b17KqmRefreshLanguageWze() async {
    final bool b17QxnCanInitializeVza = await _b17HqmCanInitializeWza();
    if (!b17QxnCanInitializeVza) {
      return;
    }
    await _b17RqmScheduleLocalNotificationsWza();
    await _b17VqnInitializeBroadcastsTza();
    _b17HqmInitializeShortcutNotificationWza();
    b17PqnUpdateNewFileTextVze();
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
