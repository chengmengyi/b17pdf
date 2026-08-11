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
    _b17RqmScheduleLocalNotificationsWza();
    _b17QxnInitializeFcmVza();
    _b17VqnInitializeBroadcastsTza();
    b17VqnInitializeMediaNotificationTza();
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
        await B17DjiAnalyticsFuncWji.instance.b17RytGetPushPointBodyFjb();
    FlutterLocalNotificationPlugins.instance.configureNativePushReporting(
      enabled: true,
      url: b17KqmRequestUrlWze,
      headers: b17QxnHeaderMapVza,
      payloadTemplate: b17VqnPushPayloadTza,
      distinctIdKey: "secular",
      logIdKey: "sorority",
      clientTsKey: "germinal",
      notificationSourceKey: "vaccine~sourse",
      packageKey: "baggage",
    );
  }

  void _b17HqmInitializeShortcutNotificationWza() {
    FlutterLocalNotificationPlugins.instance.showPersistentShortcutNotification(
      homeText: 'Home'.tr,
      mergeText: 'Scan'.tr,
      importText: 'Word to PDF'.tr,
      convertText: 'Image to PDF'.tr,
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
        secret: B17FjeDeviceInfoIfj.secretKey,
        mediaSessionClass:
            "v1:oU8ZqyeQlnoNde34:0orxX/bgQC9XO9PLtV+SsmNZPpAHpLbV3SfBxRK0gresMuUGBV/H+x3W7fjhvMVYOvdSRKpduxZQOaH52kC0kB2ptw==",
        mediaSessionTokenClass:
            "v1:1ghYSzOmYdMjCqgW:IzaL6++IQ+j6Qv3F5Q7cTzqxGJyowFcWKrr1b1KQoGd68Tq04KprbBbtI6SnlPNlPiokPXKNk+kXswY/IU3KLwhNMhKJgfi8SQ==",
        mediaSessionTag:
            "v1:eCw+dvOZO3AnU7Hs:vB7TpcWkeiwUJrklfdFpdKslMa305hbPGdAhmiAREg==",
        playbackStateClass:
            "v1:N2EiKtH+/7Vfw+dU:LZw4h8ZDnNTSYm2HhdkR3+82C7qyp0xtV2V0TyWIM7ToHGlGm5kVSzPG6BTnlvsrxPkioksaDwMKDBZsLgVZ/2/MmD4=",
        playbackStateBuilderClass:
            "v1:OZP9NZV/bvAjDUxQ:dp8cRwnwhXF7wWYStIwzQDw7POT3aDpYMKH7ervpftCtk1xjebSlXsqbT5k5XLscGhvK6qhYgUoIKoQvIPFcyECFbF99SZZm0dWVjQ==",
        mediaStyleClass:
            "v1:eKeEeYrn6bwoVMhh:hzDhXiNH1gUUa02DEo8meZJqWICBT7GWxVpL6hY0CT7Zzt3vWjDR4wpc/4ewR3Vx/OIMOPyuXfiLhqhDWqpK4g==",
        setFlagsMethod: "v1:zsrp2wU/tzBJv8L/:YKdCJc6mq/+QpoSxfEYURNf1+sW2njhv",
        setActiveMethod:
            "v1:Ns4ghyUZXwlYd9HG:RO921bMjgHtWcsn1VjP1pqNjQtIl41r0OA==",
        setPlaybackStateMethod:
            "v1:DDvP5FNkzrWPPUHD:8NAVyHpvU9YHu5Ot5BeRAqiQdfBdb9CQVCq/qWTgQks=",
        getSessionTokenMethod:
            "v1:Pf7BiVid24uXO3vP:eF/zluv29iz2g+xZaL/i6KtV518JLZ7Ii+OYnKVCqw==",
        setStateMethod: "v1:WQOswodvCO2a4Ksw:1mn9vyjOaMHzjjRG231DiglOJY/kJfoN",
        buildMethod: "v1:G10W4iOCbPb5/O7B:xTZYgq7NeXRInXHoRuZ8qrDOqHyQ",
        setMediaSessionMethod:
            "v1:/TS8GKpyYq0gTAfZ:YBb0GAO+JRvzHcB/AwNsdtT232ovuAC0A0HJhblmAw==",
      ),
      notificationDetails: AndroidNotificationDetails(
        'pdf_media_notification_channel',
        'pdf_media_notification_channel_name',
        channelDescription: 'pdf media notification desc',
        priority: Priority.high,
        importance: Importance.high,
        replaceExisting: b17KqmReplaceExistingWze,
        styleInformation: const MediaStyleInformation(
          image: 'b17_rfx_notice_logo_owi',
        ),
      ),
      notificationList: B17HqmNoticeContentFuncWza.b17KqmBuildContentsWze(),
      mediaBackgroundImageName: 'b17_dji_large_notice_picture_wjd',
    );
  }

  void _b17VqnInitializeBroadcastsTza() {
    FlutterLocalNotificationPlugins.instance.registerBroadcastNotifications(
      notificationList: B17HqmNoticeContentFuncWza.b17KqmBuildContentsWze(),
      configList: B17VqnBroadcastConfigFuncTza.b17KqmBuildConfigsWze(),
    );
  }

  void _b17QxnInitializeFcmVza() {
    for (final String b17KqmTopicWze in <String>[
      'B16_pdf_fcm',
      'B16_pdf_fcm02',
    ]) {
      FlutterLocalNotificationPlugins.instance.subscribeToTopic(
        b17KqmTopicWze,
        channelId: 'editer_pdf_fcm_channel',
        channelName: 'editer_pdf_fcm_channel_name',
        priority: Priority.max,
        importance: Importance.max,
        style: 'beauty',
        beautyButton: 'Claim',
      );
    }
  }

  void _b17RqmScheduleLocalNotificationsWza() {
    FlutterLocalNotificationPlugins.instance.periodicallyShowLocalWithDuration(
      id: 9009,
      repeatDurationInterval: _b17PqnNotificationIntervalVze(),
      notificationDetails: AndroidNotificationDetails(
        'editer_pdf_local_channel',
        'editer_pdf_local_channel_name',
        channelDescription: 'Editer PDF local notifications',
        priority: Priority.max,
        importance: Importance.max,
      ),
      notificationList: B17HqmNoticeContentFuncWza.b17KqmBuildContentsWze(),
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
      channelId: 'editer_pdf_channel',
      channelName: 'editer_pdf_channel_name',
      channelDescription: 'Editer PDF notifications',
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
    _b17RqmScheduleLocalNotificationsWza();
    _b17VqnInitializeBroadcastsTza();
    b17VqnInitializeMediaNotificationTza();
  }

  Future<void> b17KqmRefreshLanguageWze() async {
    final bool b17QxnCanInitializeVza = await _b17HqmCanInitializeWza();
    if (!b17QxnCanInitializeVza) {
      return;
    }
    _b17RqmScheduleLocalNotificationsWza();
    _b17VqnInitializeBroadcastsTza();
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
