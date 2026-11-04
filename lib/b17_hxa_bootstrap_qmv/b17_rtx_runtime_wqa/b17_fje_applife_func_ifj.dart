import 'dart:async';

import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_fhi_signal_bean_feo.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_fji_signal_func_eji.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_qxm_signal_code_vza.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_dji_analytics_func_wji.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_qxn_overlay_func_vza.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_address_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_kfm_startup_oqa/b17_qxn_open_ad_loading_result_vza.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_dji_active_startup_source_func_wdj.dart';
import 'package:b17pdf/b17_mye_messaging_kra/b17_dji_notifications_wdo/b17_jso_notice_func_wko.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_lifecycle/app_state_observer.dart';
import 'package:flutter_app_lifecycle/flutter_app_lifecycle.dart';
import 'package:flutter_pdf_ad_plugins/flutter_pdf_ad_plugins.dart';

enum B17QxnLifecycleAdTriggerVza { automatic, notification }

class B17FjeApplifeFuncIfj {
  B17FjeApplifeFuncIfj._();

  static final B17FjeApplifeFuncIfj instance = B17FjeApplifeFuncIfj._();

  int b17HotCd = 500;
  bool b17HqmObserverStartedXwe = false;
  bool _b17StaAppIsBackTus = false;
  bool _b17PqmAppIsForegroundVzr = true;
  bool _b17QxnHotLaunchEnabledVza = false;
  bool _b17QxnSuppressNextHotLaunchVza = false;
  bool _b17HqmHandlingForegroundWza = false;
  bool _b17VqnHasPendingForegroundTza = false;
  int _b17KqmLastBackgroundTimeWze = 0;
  int _b17QxnAdRequestSeedVza = 0;
  int? _b17PqnActiveLoadingSessionIdVze;
  B17EipAdSceneUkg? _b17KqmActiveLoadingSceneWze;
  B17JkwPosidKos? _b17VqnActiveLoadingPosIdTza;
  Future<void> _b17HqmAdTransitionFutureWza = Future<void>.value();

  bool get b17QxnShouldSuppressClickHotLaunchVza =>
      !_b17PqmAppIsForegroundVzr || _b17StaAppIsBackTus;

  bool get b17PqmAppIsForegroundVzr => _b17PqmAppIsForegroundVzr;

  void b17KqmEnableHotLaunchWze() {
    if (_b17QxnHotLaunchEnabledVza) return;
    _b17QxnHotLaunchEnabledVza = true;
    // 启动页期间发生的前后台切换不应被当成一次热启动。
    _b17StaAppIsBackTus = false;
    _b17QxnSuppressNextHotLaunchVza = false;
  }

  void b17QxnSuppressNextHotLaunchVza() {
    _b17QxnSuppressNextHotLaunchVza = true;
    _b17StaAppIsBackTus = false;
  }

  bool _b17QxnConsumeSuppressedHotLaunchVza() {
    if (!_b17QxnSuppressNextHotLaunchVza) return false;
    _b17QxnSuppressNextHotLaunchVza = false;
    _b17StaAppIsBackTus = false;
    B17DjiActiveStartupSourceFuncWdj.instance.removeHotLauncherSourceInfo();
    return true;
  }

  void b17KpvStartObserverNza() {
    if (b17HqmObserverStartedXwe) return;
    b17HqmObserverStartedXwe = true;
    FlutterAppLifecycle.instance.setCallObserver(
      AppStateObserver(
        call: (bool b17VqmInBackgroundWxe) {
          if (!b17VqmInBackgroundWxe) _b17PqnPrepareForForegroundEventVze();
          B17FjiSignalFuncEji.instance.b17JijSendMsgFEio(
            B17FhiSignalBeanFeo(
              b17HfeEventCodeFMie: B17QxmSignalCodeVza.b17KqmAppLifecycleWze,
              b17DjiIntValueJie: b17VqmInBackgroundWxe ? 1 : 0,
            ),
          );
          if (b17VqmInBackgroundWxe) {
            _b17NplAppBackIkd();
          } else {
            B17DjiAnalyticsFuncWji.instance.b17VqnUploadSessionTza();
            unawaited(
              B17QxnOverlayFuncVza.instance.b17KqmCloseTimerOverlayWze(),
            );
            if (!_b17QxnHotLaunchEnabledVza) {
              _b17StaAppIsBackTus = false;
            } else if (_b17HqmHandlingForegroundWza) {
              _b17VqnHasPendingForegroundTza = true;
            } else {
              unawaited(_b17WchAppFrontYze());
            }
          }
        },
      ),
    );
  }

  void _b17NplAppBackIkd() {
    _b17PqmAppIsForegroundVzr = false;
    _b17StaAppIsBackTus = true;
    _b17KqmLastBackgroundTimeWze = DateTime.now().millisecondsSinceEpoch;
  }

  void _b17PqnPrepareForForegroundEventVze() {
    _b17PqmAppIsForegroundVzr = true;
    if (_b17StaAppIsBackTus &&
        !_b17QxnSuppressNextHotLaunchVza &&
        _b17VqnHasReachedHotLaunchCooldownTza()) {
      _b17QxnAdRequestSeedVza++;
    }
  }

  Future<void> _b17WchAppFrontYze() async {
    if (_b17HqmHandlingForegroundWza) {
      _b17VqnHasPendingForegroundTza = true;
      return;
    }
    _b17HqmHandlingForegroundWza = true;
    _b17PqmAppIsForegroundVzr = true;
    try {
      if (!_b17StaAppIsBackTus && !_b17QxnSuppressNextHotLaunchVza) return;
      await Future<void>.delayed(const Duration(milliseconds: 120));
      if (_b17QxnConsumeSuppressedHotLaunchVza()) return;
      if (!_b17StaAppIsBackTus || !_b17PqmAppIsForegroundVzr) return;
      unawaited(
        B17PqnNoticeFuncVze.instance.b17TqnUploadPendingNotificationEventsVze(),
      );
      final B17KqmActiveStartupSourceInfoWze? b17PqnSourceVze =
          B17DjiActiveStartupSourceFuncWdj.instance.b17VqnConsumeSourceTza();
      if (_b17QxnConsumeSuppressedHotLaunchVza()) return;
      _b17StaAppIsBackTus = false;
      if (b17PqnSourceVze == null) {
        unawaited(
          b17YyxShowAdTwt(
            B17EipAdSceneUkg.pr_launch,
            B17JkwPosidKos.pr_open_hot,
          ),
        );
        return;
      }
      switch (b17PqnSourceVze.b17VqnTypeTza) {
        case B17QxnActiveStartupSourceTypeVza.notification:
          return;
        case B17QxnActiveStartupSourceTypeVza.quickAction:
          unawaited(
            b17YyxShowAdTwt(B17EipAdSceneUkg.pr_exit, B17JkwPosidKos.unload_1),
          );
      }
    } finally {
      _b17HqmHandlingForegroundWza = false;
      final bool b17QxnShouldHandlePendingVza =
          _b17VqnHasPendingForegroundTza && !_b17PqmAppIsForegroundVzr;
      _b17VqnHasPendingForegroundTza = false;
      if (b17QxnShouldHandlePendingVza) unawaited(_b17WchAppFrontYze());
    }
  }

  Future<void> b17YyxShowAdTwt(
    B17EipAdSceneUkg b17QxnAdSceneVza,
    B17JkwPosidKos b17VqnPositionIdTza, {
    B17QxnLifecycleAdTriggerVza b17KqmTriggerWze =
        B17QxnLifecycleAdTriggerVza.automatic,
  }) async {
    if (b17KqmTriggerWze == B17QxnLifecycleAdTriggerVza.automatic &&
        !_b17VqnHasReachedHotLaunchCooldownTza()) {
      return;
    }
    if ((b17KqmTriggerWze == B17QxnLifecycleAdTriggerVza.automatic &&
            !_b17PqmAppIsForegroundVzr) ||
        !await B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr
            .b17VqnCanShowAdBySwitchTza(b17VqnPositionIdTza)) {
      return;
    }
    final int b17QxnRequestIdVza = ++_b17QxnAdRequestSeedVza;
    final Future<void> b17VqnPreviousTransitionTza =
        _b17HqmAdTransitionFutureWza;
    final Future<void> b17KqmCurrentTransitionWze = () async {
      await b17VqnPreviousTransitionTza;
      await _b17HqmReplaceLifecycleAdSessionWza(
        b17QxnRequestIdVza,
        b17QxnAdSceneVza,
        b17VqnPositionIdTza,
        b17KqmTriggerWze,
      );
    }();
    _b17HqmAdTransitionFutureWza = b17KqmCurrentTransitionWze.then<void>(
      (_) {},
      onError: (_, _) {},
    );
    try {
      await b17KqmCurrentTransitionWze;
    } catch (_) {}
  }

  Future<void> _b17HqmReplaceLifecycleAdSessionWza(
    int b17QxnRequestIdVza,
    B17EipAdSceneUkg b17KqmAdSceneWze,
    B17JkwPosidKos b17VqnAdPosIdTza,
    B17QxnLifecycleAdTriggerVza b17PqnTriggerVze,
  ) async {
    if (!_b17PqnCanProcessAdRequestVze(b17QxnRequestIdVza, b17PqnTriggerVze)) {
      return;
    }
    final FlutterPdfAdPlugins b17QxnAdPluginVza = FlutterPdfAdPlugins.instance;
    if (b17QxnAdPluginVza.isShowingAd()) {
      try {
        await b17QxnAdPluginVza.closeFullScreenAdAndWait(
          timeout: const Duration(seconds: 3),
        );
      } catch (_) {}
      if (!_b17PqnCanProcessAdRequestVze(
        b17QxnRequestIdVza,
        b17PqnTriggerVze,
      )) {
        return;
      }
    }
    if (B17FjeNavigationFuncIfj.b17HqmIsCurrentRouteWza(
      B17FjeNavigationAddressIfj.b17RqmOpenAdLoadingRouteXza,
    )) {
      B17FjeNavigationFuncIfj.b17FtyBackNwp<B17QxnOpenAdLoadingResultVza>(
        b17NcgResultKqe: B17QxnOpenAdLoadingResultVza.cancelled(
          b17QxnSessionIdVza: _b17PqnActiveLoadingSessionIdVze ?? -1,
          b17HqmReasonWza: 'replaced_by_new_session',
          b17KqmAdSceneWze: _b17KqmActiveLoadingSceneWze,
          b17VqnAdPosIdTza: _b17VqnActiveLoadingPosIdTza,
        ),
      );
      await WidgetsBinding.instance.endOfFrame;
    }
    if (!_b17PqnCanProcessAdRequestVze(b17QxnRequestIdVza, b17PqnTriggerVze)) {
      return;
    }
    final int b17QxnSessionIdVza = b17QxnRequestIdVza;
    _b17PqnActiveLoadingSessionIdVze = b17QxnSessionIdVza;
    _b17KqmActiveLoadingSceneWze = b17KqmAdSceneWze;
    _b17VqnActiveLoadingPosIdTza = b17VqnAdPosIdTza;
    final Future<dynamic>? b17QxnLoadingFutureVza =
        B17FjeNavigationFuncIfj.b17HkqPushNamedVpa<dynamic>(
          b17McfRouteNameZsq:
              B17FjeNavigationAddressIfj.b17RqmOpenAdLoadingRouteXza,
          b17XveArgumentsDlu: <String, dynamic>{
            'adScene': b17KqmAdSceneWze,
            'adPosId': b17VqnAdPosIdTza,
            'sessionId': b17QxnSessionIdVza,
            'isForeground': _b17PqmAppIsForegroundVzr,
          },
        );
    if (b17QxnLoadingFutureVza == null) {
      _b17KqmClearActiveLoadingSessionWze(b17QxnSessionIdVza);
      return;
    }
    unawaited(
      _b17VqnHandleLoadingResultTza(
        b17QxnLoadingFutureVza,
        b17QxnRequestIdVza,
        b17QxnSessionIdVza,
        b17KqmAdSceneWze,
        b17VqnAdPosIdTza,
      ),
    );
  }

  Future<void> _b17VqnHandleLoadingResultTza(
    Future<dynamic> b17QxnLoadingFutureVza,
    int b17QxnRequestIdVza,
    int b17PqnSessionIdVze,
    B17EipAdSceneUkg b17KqmAdSceneWze,
    B17JkwPosidKos b17VqnAdPosIdTza,
  ) async {
    dynamic b17HqmRawResultWza;
    try {
      b17HqmRawResultWza = await b17QxnLoadingFutureVza;
    } catch (_) {
      _b17KqmClearActiveLoadingSessionWze(b17PqnSessionIdVze);
      return;
    }
    _b17KqmClearActiveLoadingSessionWze(b17PqnSessionIdVze);
    if (!_b17VqnCanShowAdRequestTza(b17QxnRequestIdVza) ||
        b17HqmRawResultWza is! B17QxnOpenAdLoadingResultVza) {
      return;
    }
    if (!b17HqmRawResultWza.b17VqnCacheReadyTza ||
        b17HqmRawResultWza.b17QxnSessionIdVza != b17PqnSessionIdVze ||
        b17HqmRawResultWza.b17KqmAdSceneWze != b17KqmAdSceneWze ||
        b17HqmRawResultWza.b17VqnAdPosIdTza != b17VqnAdPosIdTza) {
      return;
    }
    await WidgetsBinding.instance.endOfFrame;
    if (!_b17VqnCanShowAdRequestTza(b17QxnRequestIdVza)) return;
    await B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
      b17PqmAdSceneVzr: b17KqmAdSceneWze,
      b17KqmAdPosIdVzr: b17VqnAdPosIdTza,
      b17HqmIgnoreCooldownWza: true,
      b17PqnUploadChanceVze: true,
    );
  }

  bool _b17PqnCanProcessAdRequestVze(
    int b17QxnRequestIdVza,
    B17QxnLifecycleAdTriggerVza b17KqmTriggerWze,
  ) =>
      b17QxnRequestIdVza == _b17QxnAdRequestSeedVza &&
      (_b17PqmAppIsForegroundVzr ||
          b17KqmTriggerWze == B17QxnLifecycleAdTriggerVza.notification);

  bool _b17VqnCanShowAdRequestTza(int b17QxnRequestIdVza) =>
      b17QxnRequestIdVza == _b17QxnAdRequestSeedVza &&
      _b17PqmAppIsForegroundVzr;

  void _b17KqmClearActiveLoadingSessionWze(int b17QxnSessionIdVza) {
    if (_b17PqnActiveLoadingSessionIdVze != b17QxnSessionIdVza) return;
    _b17PqnActiveLoadingSessionIdVze = null;
    _b17KqmActiveLoadingSceneWze = null;
    _b17VqnActiveLoadingPosIdTza = null;
  }

  bool _b17VqnHasReachedHotLaunchCooldownTza() {
    if (_b17KqmLastBackgroundTimeWze <= 0) return true;
    final int b17QxnIntervalMsVza =
        DateTime.now().millisecondsSinceEpoch - _b17KqmLastBackgroundTimeWze;
    return b17QxnIntervalMsVza >= b17HotCd;
  }
}
