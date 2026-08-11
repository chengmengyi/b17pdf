import 'dart:async';

import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jiw_ad_hep_djo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fje_applife_hep_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fhi_event_hep_ejo/b17_fhi_event_bean_feo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fhi_event_hep_ejo/b17_qxm_event_code_vza.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jiw_cold_launcher_source_hep_jdo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_qxn_launcher_click_gate_hep_vza.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jfi_new_user_hep_ejf.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fje_quick_action_hep_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_jdw_point_type_ijd.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_dji_tba_hep_wji.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_fje_root_controller_sak.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';
import 'package:flutter_pdf_ad_plugins/flutter_pdf_ad_plugins.dart';
import 'package:get/get.dart';

class B17FjiLauncherControllerFje extends B17FjeRootControllerSak
    with GetSingleTickerProviderStateMixin {
  static const String b17QmxProgressUpdateIdVza = 'b16_launcher_progress';
  static const Duration b17VqmLaunchDurationWxe = Duration(seconds: 15);

  late final AnimationController b17KqnProgressControllerVza;
  late B17EipAdSceneUkg b17QxnLaunchAdSceneVza;
  late B17JkwPosidKos b17KqmLaunchAdPosIdWze;
  Duration b17VqnNewUserOpenAdCheckTimeTza = const Duration(seconds: 12);
  bool b17HqmNavigationStartedWxe = false;

  final Stopwatch _b17PqnAdCheckStopwatchVze = Stopwatch();
  Timer? _b17KqnAdCheckTimerVxe;
  bool _b17PqmCheckingAdXza = false;
  bool _b17VqnInBackgroundTze = false;

  double get b17PqmProgressValueXra => b17KqnProgressControllerVza.value;

  bool get _b17HqmUseNewLaunchAdWza =>
      B17JiwAdHepDjo.b17KqmAdUtilsInstanceVzr.b17QxnLoadNewLaunchAdVza;

  @override
  void onInit() {
    super.onInit();
    B17QxnLauncherClickGateHepVza.instance.b17QxnMarkLauncherStartedVza();
    _b17QxnResolveLaunchAdVza();
    B17JiwAdHepDjo.b17KqmAdUtilsInstanceVzr.b17KqnUploadAdChanceVxe(
      b17PqmAdSceneVzr: b17QxnLaunchAdSceneVza,
      b17KqmAdPosIdVzr: b17KqmLaunchAdPosIdWze,
    );
    b17KqnProgressControllerVza =
        AnimationController(vsync: this, duration: b17VqmLaunchDurationWxe)
          ..addListener(b17RkqNotifyProgressVma)
          ..addStatusListener(b17TqmHandleAnimationStatusXze)
          ..forward();
    _b17PqnAdCheckStopwatchVze.start();
    _b17KqnAdCheckTimerVxe = Timer.periodic(
      const Duration(milliseconds: 500),
      (_) => _b17PqmCheckCachedAdXza(),
    );
  }

  void _b17QxnResolveLaunchAdVza() {
    if (_b17HqmUseNewLaunchAdWza) {
      b17QxnLaunchAdSceneVza = B17EipAdSceneUkg.pr_new_launch;
      b17KqmLaunchAdPosIdWze = B17JkwPosidKos.pr_new_open;
      return;
    }

    final String b17PqnNotificationPayloadVze =
        B17JiwColdLauncherSourceHepJdo.instance.notificationPayload ?? '';
    if (b17PqnNotificationPayloadVze.isNotEmpty) {
      b17QxnLaunchAdSceneVza = B17EipAdSceneUkg.pr_launch;
      b17KqmLaunchAdPosIdWze =
          b17PqnNotificationPayloadVze == LocalNotificationPayload.media.value
          ? B17JkwPosidKos.pr_open_mediapop
          : B17JkwPosidKos.pr_open_noti;
      return;
    }

    final String b17KqnQuickActionTypeVxe =
        B17JiwColdLauncherSourceHepJdo.instance.b17KqmQuickActionTypeWze ?? '';
    if (b17KqnQuickActionTypeVxe.isNotEmpty) {
      b17QxnLaunchAdSceneVza = B17EipAdSceneUkg.pr_exit;
      b17KqmLaunchAdPosIdWze = B17JkwPosidKos.unload_1;
      return;
    }

    b17QxnLaunchAdSceneVza = B17EipAdSceneUkg.pr_launch;
    b17KqmLaunchAdPosIdWze = B17JkwPosidKos.pr_open_cold;
  }

  void b17RkqNotifyProgressVma() {
    update([b17QmxProgressUpdateIdVza]);
  }

  void b17TqmHandleAnimationStatusXze(AnimationStatus b17VqmStatusPra) {
    if (b17VqmStatusPra != AnimationStatus.completed ||
        b17HqmNavigationStartedWxe) {
      return;
    }
    b17HqmNavigationStartedWxe = true;
    _b17KqnAdCheckTimerVxe?.cancel();
    _b17RqmHandleLaunchDeadlineWza();
  }

  Future<void> _b17PqmCheckCachedAdXza() async {
    if (b17HqmNavigationStartedWxe ||
        _b17VqnInBackgroundTze ||
        _b17PqmCheckingAdXza) {
      return;
    }
    _b17PqmCheckingAdXza = true;
    final B17EipAdSceneUkg b17TqnSceneVze = _b17VqmCurrentCheckSceneXza();
    final B17JkwPosidKos b17RqmPosIdWza = _b17KqnPosIdForSceneVxe(
      b17TqnSceneVze,
    );
    final bool b17QxnHasAdVza = await _b17HqmHasCachedAdWza(b17TqnSceneVze);
    _b17PqmCheckingAdXza = false;
    if (!b17QxnHasAdVza || b17HqmNavigationStartedWxe) {
      return;
    }
    b17HqmNavigationStartedWxe = true;
    await _b17VqnShowLaunchAdTza(b17TqnSceneVze, b17RqmPosIdWza);
  }

  B17EipAdSceneUkg _b17VqmCurrentCheckSceneXza() {
    if (_b17HqmUseNewLaunchAdWza &&
        _b17PqnAdCheckStopwatchVze.elapsed < b17VqnNewUserOpenAdCheckTimeTza) {
      return B17EipAdSceneUkg.pr_new_launch;
    }
    if (_b17HqmUseNewLaunchAdWza) {
      return B17EipAdSceneUkg.pr_launch;
    }
    return b17QxnLaunchAdSceneVza;
  }

  B17JkwPosidKos _b17KqnPosIdForSceneVxe(B17EipAdSceneUkg b17QxnSceneVza) {
    if (b17QxnSceneVza == B17EipAdSceneUkg.pr_new_launch) {
      return B17JkwPosidKos.pr_new_open;
    }
    if (_b17HqmUseNewLaunchAdWza &&
        b17QxnSceneVza == B17EipAdSceneUkg.pr_launch) {
      return B17JkwPosidKos.pr_open_cold;
    }
    return b17KqmLaunchAdPosIdWze;
  }

  Future<bool> _b17HqmHasCachedAdWza(B17EipAdSceneUkg b17VqnSceneTza) async {
    try {
      final AdInfoBean? b17PqnCachedAdVze = await FlutterPdfAdPlugins.instance
          .getAvailableCachedAdInfo<B17EipAdSceneUkg>(b17VqnSceneTza);
      return b17PqnCachedAdVze != null;
    } catch (_) {
      return false;
    }
  }

  Future<void> _b17RqmHandleLaunchDeadlineWza() async {
    if (_b17HqmUseNewLaunchAdWza) {
      if (b17VqnNewUserOpenAdCheckTimeTza >= b17VqmLaunchDurationWxe) {
        final bool b17QxnHasNewAdVza = await _b17HqmHasCachedAdWza(
          B17EipAdSceneUkg.pr_new_launch,
        );
        if (b17QxnHasNewAdVza) {
          await _b17VqnShowLaunchAdTza(
            B17EipAdSceneUkg.pr_new_launch,
            B17JkwPosidKos.pr_new_open,
          );
          return;
        }
      }
      final bool b17KqmHasFallbackAdWze = await _b17HqmHasCachedAdWza(
        B17EipAdSceneUkg.pr_launch,
      );
      if (b17KqmHasFallbackAdWze) {
        await _b17VqnShowLaunchAdTza(
          B17EipAdSceneUkg.pr_launch,
          B17JkwPosidKos.pr_open_cold,
        );
        return;
      }
    } else if (await _b17HqmHasCachedAdWza(b17QxnLaunchAdSceneVza)) {
      await _b17VqnShowLaunchAdTza(
        b17QxnLaunchAdSceneVza,
        b17KqmLaunchAdPosIdWze,
      );
      return;
    }
    await b17QxnFinishLauncherVza();
  }

  Future<void> _b17VqnShowLaunchAdTza(
    B17EipAdSceneUkg b17QxnSceneVza,
    B17JkwPosidKos b17KqmPosIdWze,
  ) async {
    _b17KqnAdCheckTimerVxe?.cancel();
    _b17PqnAdCheckStopwatchVze.stop();
    if (b17KqnProgressControllerVza.isAnimating) {
      b17KqnProgressControllerVza.stop(canceled: false);
    }
    B17QxnLauncherClickGateHepVza.instance.b17VqnMarkLauncherAdWaitingTza(
      b17PqnAdSceneVze: b17QxnSceneVza,
      b17KqmAdPosIdWze: b17KqmPosIdWze,
    );
    final bool? b17RqmDidShowAdWza = await B17JiwAdHepDjo
        .b17KqmAdUtilsInstanceVzr
        .b17PqmShowCachedSceneAdVzr(
          b17PqmAdSceneVzr: b17QxnSceneVza,
          b17KqmAdPosIdVzr: b17KqmPosIdWze,
          b17PqnUploadChanceVze: false,
        );
    if (b17RqmDidShowAdWza != true) {
      B17QxnLauncherClickGateHepVza.instance.b17PqnMarkLauncherAdNotShownVze();
    }
    await b17QxnFinishLauncherVza();
  }

  Future<void> b17QxnFinishLauncherVza() async {
    B17JiwAdHepDjo.b17KqmAdUtilsInstanceVzr.b17KqmPreloadAdBySceneWze(
      B17EipAdSceneUkg.pr_user_use,
    );
    B17DjiTbaHepWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwPointTypeIjd.app_launch_result,
    );
    var result = await B17FjeQuickActionHepIfj.instance
        .b17VqnConsumeColdStartActionTza();
    if (result) {
      return;
    }
    B17JfiNewUserHepEjf.instance.toPageChooseLanguage();
  }

  @override
  bool b17FeiRegisterEventJif() => true;

  @override
  // ignore: avoid_renaming_method_parameters
  void b17RifHandleEventhJei(B17FhiEventBeanFeo b17QzmEventXva) {
    if (b17QzmEventXva.b17HfeEventCodeFMie ==
        B17QxmEventCodeVza.b17QxnNewOpenAdCheckTimeVza) {
      final int b17KqmSecondsWze = b17QzmEventXva.b17DjiIntValueJie ?? 0;
      if (b17KqmSecondsWze > 0) {
        b17VqnNewUserOpenAdCheckTimeTza = Duration(seconds: b17KqmSecondsWze);
      }
      return;
    }
    if (b17QzmEventXva.b17HfeEventCodeFMie !=
        B17QxmEventCodeVza.b17KqmAppLifecycleWze) {
      return;
    }
    _b17VqnInBackgroundTze = b17QzmEventXva.b17DjiIntValueJie == 1;
    if (_b17VqnInBackgroundTze) {
      _b17PqnAdCheckStopwatchVze.stop();
      b17KqnProgressControllerVza.stop(canceled: false);
    } else {
      _b17PqnAdCheckStopwatchVze.start();
      if (!b17KqnProgressControllerVza.isCompleted &&
          !b17KqnProgressControllerVza.isAnimating) {
        b17KqnProgressControllerVza.forward();
      }
    }
  }

  @override
  void onClose() {
    B17FjeApplifeHepIfj.instance.b17KpvStartObserverNza();
    B17QxnLauncherClickGateHepVza.instance.b17KqmMarkLauncherClosedWze();
    _b17KqnAdCheckTimerVxe?.cancel();
    _b17PqnAdCheckStopwatchVze.stop();
    b17KqnProgressControllerVza
      ..removeListener(b17RkqNotifyProgressVma)
      ..removeStatusListener(b17TqmHandleAnimationStatusXze)
      ..dispose();
    super.onClose();
  }
}
