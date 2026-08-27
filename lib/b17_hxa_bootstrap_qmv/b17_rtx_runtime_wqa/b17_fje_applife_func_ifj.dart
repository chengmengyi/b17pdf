import 'dart:async';

import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_fhi_signal_bean_feo.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_qxm_signal_code_vza.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_fji_signal_func_eji.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_dji_active_startup_source_func_wdj.dart';
import 'package:b17pdf/b17_mye_messaging_kra/b17_dji_notifications_wdo/b17_jso_notice_func_wko.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_rqm_last_open_ad_close_time_xza.dart';
import 'package:flutter_app_lifecycle/app_state_observer.dart';
import 'package:flutter_app_lifecycle/flutter_app_lifecycle.dart';
import 'package:flutter_pdf_ad_plugins/flutter_pdf_ad_plugins.dart';

class B17FjeApplifeFuncIfj {
  B17FjeApplifeFuncIfj._();

  static final B17FjeApplifeFuncIfj instance = B17FjeApplifeFuncIfj._();
  int b17HotCd = 3;
  bool b17HqmObserverStartedXwe = false, _b17StaAppIsBackTus = false;
  bool _b17QxnSuppressNextHotLaunchVza = false;

  bool get b17QxnShouldSuppressClickHotLaunchVza => _b17StaAppIsBackTus;

  void b17QxnSuppressNextHotLaunchVza() {
    _b17QxnSuppressNextHotLaunchVza = true;
    _b17StaAppIsBackTus = false;
  }

  bool _b17QxnConsumeSuppressedHotLaunchVza() {
    if (!_b17QxnSuppressNextHotLaunchVza) {
      return false;
    }
    _b17QxnSuppressNextHotLaunchVza = false;
    _b17StaAppIsBackTus = false;
    B17DjiActiveStartupSourceFuncWdj.instance.removeHotLauncherSourceInfo();
    return true;
  }

  void b17KpvStartObserverNza() {
    if (b17HqmObserverStartedXwe) {
      return;
    }
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
    _b17StaAppIsBackTus = true;
  }

  Future<void> _b17WchAppFrontYze() async {
    if (!_b17StaAppIsBackTus && !_b17QxnSuppressNextHotLaunchVza) {
      return;
    }
    if (_b17QxnConsumeSuppressedHotLaunchVza()) {
      return;
    }
    if (!_b17StaAppIsBackTus) {
      return;
    }
    _b17StaAppIsBackTus = false;
    unawaited(
      B17PqnNoticeFuncVze.instance.b17TqnUploadPendingNotificationEventsVze(),
    );
    final B17KqmActiveStartupSourceInfoWze? b17PqnSourceVze =
        B17DjiActiveStartupSourceFuncWdj.instance.b17VqnConsumeSourceTza();
    if (b17PqnSourceVze == null) {
      b17YyxShowAdTwt(B17EipAdSceneUkg.pr_launch, B17JkwPosidKos.pr_open_hot);
      return;
    }
    switch (b17PqnSourceVze.b17VqnTypeTza) {
      case B17QxnActiveStartupSourceTypeVza.notification:
        return;
      case B17QxnActiveStartupSourceTypeVza.quickAction:
        b17YyxShowAdTwt(B17EipAdSceneUkg.pr_exit, B17JkwPosidKos.unload_1);
    }
  }

  Future<void> b17YyxShowAdTwt(
    B17EipAdSceneUkg b17QxnAdSceneVza,
    B17JkwPosidKos b17VqnPositionIdTza,
  ) async {
    final int b17KqmLastOpenAdCloseTimeWze = B17RqmLastOpenAdCloseTimeXza.b17KqmReadTimeWze();
    final int b17VqnHotCooldownMsTza = b17HotCd * 1000;
    if (DateTime.now().millisecondsSinceEpoch - b17KqmLastOpenAdCloseTimeWze < b17VqnHotCooldownMsTza) {
      return;
    }
    await FlutterPdfAdPlugins.instance.closeFullScreenAdAndWait();
    B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
      b17PqmAdSceneVzr: b17QxnAdSceneVza,
      b17KqmAdPosIdVzr: b17VqnPositionIdTza,
    );
  }
}
