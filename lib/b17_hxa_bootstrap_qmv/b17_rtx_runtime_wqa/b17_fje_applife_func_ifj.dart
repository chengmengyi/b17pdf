import 'dart:async';

import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_fhi_signal_bean_feo.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_fji_signal_func_eji.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_qxm_signal_code_vza.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_address_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_dji_active_startup_source_func_wdj.dart';
import 'package:b17pdf/b17_mye_messaging_kra/b17_dji_notifications_wdo/b17_jso_notice_func_wko.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_rqm_last_open_ad_close_time_xza.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_lifecycle/app_state_observer.dart';
import 'package:flutter_app_lifecycle/flutter_app_lifecycle.dart';
import 'package:flutter_pdf_ad_plugins/flutter_pdf_ad_plugins.dart';

class B17FjeApplifeFuncIfj {
  B17FjeApplifeFuncIfj._();

  static final B17FjeApplifeFuncIfj instance = B17FjeApplifeFuncIfj._();
  static const Duration _b17PqmOpenAdLoadingTimeoutVzr = Duration(seconds: 16);

  int b17HotCd = 500;
  bool b17HqmObserverStartedXwe = false, _b17StaAppIsBackTus = false;
  bool _b17PqmAppIsForegroundVzr = true;
  bool _b17KqmWaitingForegroundClickSourceWze = false;
  bool _b17QxnSuppressNextHotLaunchVza = false;
  bool _b17VqnShowingLifecycleAdTza = false;
  bool _b17HqmOpenAdLoadingActiveWza = false;

  bool get b17QxnShouldSuppressClickHotLaunchVza =>
      !_b17PqmAppIsForegroundVzr ||
      _b17StaAppIsBackTus ||
      _b17KqmWaitingForegroundClickSourceWze;

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
          B17FjiSignalFuncEji.instance.b17JijSendMsgFEio(
            B17FhiSignalBeanFeo(
              b17HfeEventCodeFMie: B17QxmSignalCodeVza.b17KqmAppLifecycleWze,
              b17DjiIntValueJie: b17VqmInBackgroundWxe ? 1 : 0,
            ),
          );
          if (b17VqmInBackgroundWxe) {
            _b17NplAppBackIkd();
          } else {
            unawaited(_b17WchAppFrontYze());
          }
        },
      ),
    );
  }

  void _b17NplAppBackIkd() {
    _b17PqmAppIsForegroundVzr = false;
    _b17StaAppIsBackTus = true;
  }

  Future<void> _b17WchAppFrontYze() async {
    _b17PqmAppIsForegroundVzr = true;
    if (!_b17StaAppIsBackTus && !_b17QxnSuppressNextHotLaunchVza) return;
    if (_b17QxnConsumeSuppressedHotLaunchVza()) return;
    if (!_b17StaAppIsBackTus) return;
    await Future<void>.delayed(const Duration(milliseconds: 120));
    if (_b17QxnConsumeSuppressedHotLaunchVza()) return;
    if (!_b17StaAppIsBackTus) return;
    await _b17PqmWaitForForegroundClickSourceVzr();
    if (_b17QxnConsumeSuppressedHotLaunchVza()) return;
    if (!_b17StaAppIsBackTus) return;

    unawaited(
      B17PqnNoticeFuncVze.instance.b17TqnUploadPendingNotificationEventsVze(),
    );
    final B17KqmActiveStartupSourceInfoWze? b17PqnSourceVze =
        B17DjiActiveStartupSourceFuncWdj.instance.b17VqnConsumeSourceTza();
    if (_b17QxnConsumeSuppressedHotLaunchVza()) return;
    _b17StaAppIsBackTus = false;
    if (b17PqnSourceVze == null) {
      unawaited(
        b17YyxShowAdTwt(B17EipAdSceneUkg.pr_launch, B17JkwPosidKos.pr_open_hot),
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
  }

  Future<void> _b17PqmWaitForForegroundClickSourceVzr() async {
    _b17KqmWaitingForegroundClickSourceWze = true;
    try {
      for (int b17KqmIndexWze = 0; b17KqmIndexWze < 10; b17KqmIndexWze++) {
        if (_b17QxnSuppressNextHotLaunchVza) break;
        await Future<void>.delayed(const Duration(milliseconds: 20));
      }
    } finally {
      _b17KqmWaitingForegroundClickSourceWze = false;
    }
  }

  Future<void> b17YyxShowAdTwt(
    B17EipAdSceneUkg b17QxnAdSceneVza,
    B17JkwPosidKos b17VqnPositionIdTza,
  ) async {
    if (_b17PqmIsHotLaunchCooldownActiveVzr()) {
      return;
    }
    _b17PqmLogLifecycleVzr(
      'showLifecycleAd start scene=${b17QxnAdSceneVza.name} '
      'position=${b17VqnPositionIdTza.name} foreground=$_b17PqmAppIsForegroundVzr '
      'showing=$_b17VqnShowingLifecycleAdTza loading=$_b17HqmOpenAdLoadingActiveWza',
    );
    if (_b17VqnShowingLifecycleAdTza ||
        _b17HqmOpenAdLoadingActiveWza ||
        !_b17PqmAppIsForegroundVzr) {
      return;
    }
    _b17VqnShowingLifecycleAdTza = true;
    try {
      await _b17KqmPrepareAndShowLifecycleAdWze(
        b17QxnAdSceneVza,
        b17VqnPositionIdTza,
      );
    } finally {
      _b17VqnShowingLifecycleAdTza = false;
    }
  }

  Future<void> _b17KqmPrepareAndShowLifecycleAdWze(
    B17EipAdSceneUkg b17PqmAdSceneVzr,
    B17JkwPosidKos b17KqmAdPosIdVzr,
  ) async {
    final FlutterPdfAdPlugins b17PqmAdPluginVzr = FlutterPdfAdPlugins.instance;
    if (!await _b17VqnPrepareCurrentFullScreenAdTza(
      b17PqmAdPluginVzr,
      b17KqmAdPosIdVzr,
    )) {
      return;
    }
    final B17JiwAdFuncDjo b17KqmAdFuncWze =
        B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr;
    if (!_b17PqmAppIsForegroundVzr) return;
    if (B17FjeNavigationFuncIfj.b17HqmIsCurrentRouteWza(
      B17FjeNavigationAddressIfj.b17RqmOpenAdLoadingRouteXza,
    )) {
      return;
    }
    b17KqmAdFuncWze.b17KqnUploadAdChanceVxe(
      b17PqmAdSceneVzr: b17PqmAdSceneVzr,
      b17KqmAdPosIdVzr: b17KqmAdPosIdVzr,
    );
    dynamic b17PqmLoadingResultVzr;
    _b17HqmOpenAdLoadingActiveWza = true;
    try {
      final Future<dynamic>? b17VqnLoadingFutureTza =
          B17FjeNavigationFuncIfj.b17HkqPushNamedVpa<dynamic>(
            b17McfRouteNameZsq:
                B17FjeNavigationAddressIfj.b17RqmOpenAdLoadingRouteXza,
            b17XveArgumentsDlu: <String, dynamic>{
              'adScene': b17PqmAdSceneVzr,
              'adPosId': b17KqmAdPosIdVzr,
            },
          );
      if (b17VqnLoadingFutureTza == null) return;
      try {
        b17PqmLoadingResultVzr = await b17VqnLoadingFutureTza.timeout(
          _b17PqmOpenAdLoadingTimeoutVzr,
          onTimeout: () {
            if (B17FjeNavigationFuncIfj.b17HqmIsCurrentRouteWza(
              B17FjeNavigationAddressIfj.b17RqmOpenAdLoadingRouteXza,
            )) {
              B17FjeNavigationFuncIfj.b17FtyBackNwp<bool>(
                b17NcgResultKqe: false,
              );
            }
            return false;
          },
        );
      } catch (_) {
        if (B17FjeNavigationFuncIfj.b17HqmIsCurrentRouteWza(
          B17FjeNavigationAddressIfj.b17RqmOpenAdLoadingRouteXza,
        )) {
          B17FjeNavigationFuncIfj.b17FtyBackNwp<bool>(b17NcgResultKqe: false);
        }
        return;
      }
    } finally {
      _b17HqmOpenAdLoadingActiveWza = false;
    }
    if (b17PqmLoadingResultVzr != true || !_b17PqmAppIsForegroundVzr) return;
    await WidgetsBinding.instance.endOfFrame;
    if (!_b17PqmAppIsForegroundVzr) return;
    if (!await _b17VqnPrepareCurrentFullScreenAdTza(
      b17PqmAdPluginVzr,
      b17KqmAdPosIdVzr,
    )) {
      return;
    }
    unawaited(
      _b17HqmShowCachedLifecycleAdWza(
        b17PqmAdSceneVzr: b17PqmAdSceneVzr,
        b17KqmAdPosIdVzr: b17KqmAdPosIdVzr,
        b17VqnUploadChanceTza: false,
      ),
    );
  }

  Future<void> _b17HqmShowCachedLifecycleAdWza({
    required B17EipAdSceneUkg b17PqmAdSceneVzr,
    required B17JkwPosidKos b17KqmAdPosIdVzr,
    required bool b17VqnUploadChanceTza,
  }) async {
    await B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
      b17PqmAdSceneVzr: b17PqmAdSceneVzr,
      b17KqmAdPosIdVzr: b17KqmAdPosIdVzr,
      b17PqnUploadChanceVze: b17VqnUploadChanceTza,
      b17HqmIgnoreCooldownWza: b17KqmAdPosIdVzr != B17JkwPosidKos.pr_open_hot,
    );
  }

  Future<bool> _b17VqnPrepareCurrentFullScreenAdTza(
    FlutterPdfAdPlugins b17PqmAdPluginVzr,
    B17JkwPosidKos b17KqmAdPosIdVzr,
  ) async {
    if (!_b17PqmAppIsForegroundVzr) return false;
    if (b17KqmAdPosIdVzr == B17JkwPosidKos.pr_open_hot) {
      if (b17PqmAdPluginVzr.isShowingAd()) {
        return false;
      }
      return true;
    }
    if (!b17PqmAdPluginVzr.isShowingAd()) return true;
    final bool b17VqnClosedTza = await b17PqmAdPluginVzr
        .closeFullScreenAdAndWait(timeout: const Duration(seconds: 3));
    return b17VqnClosedTza && _b17PqmAppIsForegroundVzr;
  }

  bool _b17PqmIsHotLaunchCooldownActiveVzr() {
    final int b17KqmLastOpenAdCloseTimeWze =
        B17RqmLastOpenAdCloseTimeXza.b17KqmReadTimeWze();
    final int b17VqnHotCooldownMsTza = b17HotCd * 1000;
    return DateTime.now().millisecondsSinceEpoch -
            b17KqmLastOpenAdCloseTimeWze <
        b17VqnHotCooldownMsTza;
  }

  void _b17PqmLogLifecycleVzr(String b17VqnMessageTza) {
    debugPrint('[AppLifecycle] $b17VqnMessageTza');
  }
}
