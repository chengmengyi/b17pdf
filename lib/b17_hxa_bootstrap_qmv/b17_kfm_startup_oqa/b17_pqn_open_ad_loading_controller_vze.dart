import 'dart:async';

import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_fhi_signal_bean_feo.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_qxm_signal_code_vza.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_dji_analytics_func_wji.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_jdw_metric_type_ijd.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_kfm_startup_oqa/b17_qxn_open_ad_loading_result_vza.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_loading_delay_djwi.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_fje_base_controller_sak.dart';
import 'package:get/get.dart';

class B17PqnOpenAdLoadingControllerVze extends B17FjeBaseControllerSak {
  static const String b17RqmProgressUpdateIdXza =
      'b17_open_ad_loading_progress';
  static const Duration b17VqnMaximumWaitTza = Duration(seconds: 15);
  static const Duration b17KqmTickIntervalWze = Duration(milliseconds: 100);
  static const Duration b17HqmCacheCheckIntervalWza = Duration(
    milliseconds: 500,
  );

  B17EipAdSceneUkg? b17PqmAdSceneVzr;
  B17JkwPosidKos? b17KqmAdPosIdVzr;
  int b17QxnSessionIdVza = -1;
  double b17VqnProgressTza = 0;

  final Stopwatch _b17PqmStopwatchVzr = Stopwatch();
  Timer? _b17KqmTimerWze;
  Duration _b17VqnLastCacheCheckTza = Duration.zero;
  bool _b17HqmCheckingCacheWza = false;
  bool _b17RqmFinishedXza = false;
  bool _b17QxnIsForegroundVza = true;
  late final Duration _b17PqmCacheCheckDelayVzr;

  @override
  void onInit() {
    super.onInit();
    final Map<String, dynamic> b17VqnArgumentsTza =
        Get.arguments is Map<String, dynamic>
        ? Get.arguments as Map<String, dynamic>
        : <String, dynamic>{};
    final Object? b17PqmSceneArgumentVzr = b17VqnArgumentsTza['adScene'];
    final Object? b17KqmPosIdArgumentWze = b17VqnArgumentsTza['adPosId'];
    final Object? b17QxnSessionArgumentVza = b17VqnArgumentsTza['sessionId'];
    final Object? b17QxnForegroundArgumentVza =
        b17VqnArgumentsTza['isForeground'];
    if (b17PqmSceneArgumentVzr is B17EipAdSceneUkg &&
        b17KqmPosIdArgumentWze is B17JkwPosidKos) {
      b17PqmAdSceneVzr = b17PqmSceneArgumentVzr;
      b17KqmAdPosIdVzr = b17KqmPosIdArgumentWze;
    }
    if (b17QxnSessionArgumentVza is int) {
      b17QxnSessionIdVza = b17QxnSessionArgumentVza;
    }
    if (b17QxnForegroundArgumentVza is bool) {
      _b17QxnIsForegroundVza = b17QxnForegroundArgumentVza;
    }
    if (b17PqmAdSceneVzr == null ||
        b17KqmAdPosIdVzr == null ||
        b17QxnSessionIdVza < 0) {
      Future<void>.delayed(Duration.zero, () {
        _b17PqmFinishVzr(
          b17VqnCacheReadyTza: false,
          b17HqmReasonWza: 'invalid_arguments',
        );
      });
      return;
    }
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.show_hot_launcher,
      b17KqmParametersWze: <String, dynamic>{
        'ad_context': b17PqmAdSceneVzr!.name,
        'ad_pos_id': b17KqmAdPosIdVzr!.name,
      },
    );
    final int b17KqmDelaySecondsWze = B17LoadingDelayDjwi.b17KqmReadTimeWze();
    _b17PqmCacheCheckDelayVzr = Duration(
      seconds: b17KqmDelaySecondsWze > 0 ? b17KqmDelaySecondsWze : 0,
    );
    if (_b17QxnIsForegroundVza) {
      _b17PqmStopwatchVzr.start();
    }
    _b17KqmTimerWze = Timer.periodic(
      b17KqmTickIntervalWze,
      (_) => _b17KqmOnTickWze(),
    );
    unawaited(
      B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17KqmPreloadAdBySceneWze(
        b17PqmAdSceneVzr!,
      ),
    );
  }

  void _b17KqmOnTickWze() {
    if (_b17RqmFinishedXza || !_b17QxnIsForegroundVza) return;
    b17VqnProgressTza =
        (_b17PqmStopwatchVzr.elapsedMilliseconds /
                b17VqnMaximumWaitTza.inMilliseconds)
            .clamp(0.0, 1.0);
    update(<String>[b17RqmProgressUpdateIdXza]);
    if (_b17PqmStopwatchVzr.elapsed >= b17VqnMaximumWaitTza) {
      _b17PqmFinishVzr(b17VqnCacheReadyTza: false, b17HqmReasonWza: 'timeout');
      return;
    }
    if (_b17PqmStopwatchVzr.elapsed >= _b17PqmCacheCheckDelayVzr &&
        _b17PqmStopwatchVzr.elapsed - _b17VqnLastCacheCheckTza >=
            b17HqmCacheCheckIntervalWza) {
      unawaited(_b17VqnCheckCacheTza());
    }
  }

  Future<void> _b17VqnCheckCacheTza() async {
    if (_b17HqmCheckingCacheWza ||
        _b17RqmFinishedXza ||
        !_b17QxnIsForegroundVza ||
        b17PqmAdSceneVzr == null ||
        b17KqmAdPosIdVzr == null) {
      return;
    }
    _b17HqmCheckingCacheWza = true;
    _b17VqnLastCacheCheckTza = _b17PqmStopwatchVzr.elapsed;
    try {
      final bool b17PqmHasCachedAdVzr = await B17JiwAdFuncDjo
          .b17KqmAdUtilsInstanceVzr
          .b17XmqHasCachedSceneAdVtr(
            b17PqmAdSceneVzr: b17PqmAdSceneVzr!,
            b17KqmAdPosIdVzr: b17KqmAdPosIdVzr!,
          );
      if (b17PqmHasCachedAdVzr &&
          !_b17RqmFinishedXza &&
          _b17QxnIsForegroundVza) {
        b17VqnProgressTza = 1;
        update(<String>[b17RqmProgressUpdateIdXza]);
        _b17PqmFinishVzr(
          b17VqnCacheReadyTza: true,
          b17HqmReasonWza: 'cache_ready',
        );
      }
    } finally {
      _b17HqmCheckingCacheWza = false;
    }
  }

  void _b17PqmFinishVzr({
    required bool b17VqnCacheReadyTza,
    required String b17HqmReasonWza,
  }) {
    if (_b17RqmFinishedXza) return;
    _b17RqmFinishedXza = true;
    _b17KqmTimerWze?.cancel();
    _b17KqmTimerWze = null;
    _b17PqmStopwatchVzr.stop();
    final String? b17QxnCloseReasonVza = b17VqnCacheReadyTza
        ? 'has_cache'
        : b17HqmReasonWza == 'timeout'
        ? 'no_cache'
        : null;
    if (b17QxnCloseReasonVza != null &&
        b17PqmAdSceneVzr != null &&
        b17KqmAdPosIdVzr != null) {
      B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
        b17QxnPointTypeVza: B17JdwMetricTypeIjd.close_hot_launcher,
        b17KqmParametersWze: <String, dynamic>{
          'ad_context': b17PqmAdSceneVzr!.name,
          'ad_pos_id': b17KqmAdPosIdVzr!.name,
          'close_reason': b17QxnCloseReasonVza,
        },
      );
    }
    B17FjeNavigationFuncIfj.b17FtyBackNwp<B17QxnOpenAdLoadingResultVza>(
      b17NcgResultKqe: b17VqnCacheReadyTza
          ? B17QxnOpenAdLoadingResultVza.ready(
              b17QxnSessionIdVza: b17QxnSessionIdVza,
              b17KqmAdSceneWze: b17PqmAdSceneVzr!,
              b17VqnAdPosIdTza: b17KqmAdPosIdVzr!,
            )
          : B17QxnOpenAdLoadingResultVza.cancelled(
              b17QxnSessionIdVza: b17QxnSessionIdVza,
              b17HqmReasonWza: b17HqmReasonWza,
              b17KqmAdSceneWze: b17PqmAdSceneVzr,
              b17VqnAdPosIdTza: b17KqmAdPosIdVzr,
            ),
    );
  }

  @override
  bool b17FeiRegisterEventJif() => true;

  @override
  void b17RifHandleEventhJei(B17FhiSignalBeanFeo b17QzmEventXva) {
    if (b17QzmEventXva.b17HfeEventCodeFMie !=
        B17QxmSignalCodeVza.b17KqmAppLifecycleWze) {
      return;
    }
    final bool b17QxnIsForegroundVza = b17QzmEventXva.b17DjiIntValueJie != 1;
    if (_b17QxnIsForegroundVza == b17QxnIsForegroundVza) return;
    _b17QxnIsForegroundVza = b17QxnIsForegroundVza;
    if (_b17RqmFinishedXza) return;
    if (_b17QxnIsForegroundVza) {
      _b17PqmStopwatchVzr.start();
    } else {
      _b17PqmStopwatchVzr.stop();
    }
  }

  @override
  void onClose() {
    _b17KqmTimerWze?.cancel();
    _b17KqmTimerWze = null;
    _b17PqmStopwatchVzr.stop();
    super.onClose();
  }
}
