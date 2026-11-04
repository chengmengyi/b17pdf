import 'dart:async';

import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_fhi_signal_bean_feo.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_qxm_signal_code_vza.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_jfi_first_user_func_ejf.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_qxn_guide_completed_cache_vza.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_fje_base_controller_sak.dart';
import 'package:flutter/material.dart';

class B17HqmGuideControllerWza extends B17FjeBaseControllerSak {
  static const String b17QxnNativeAdEligibilityUpdateIdVza =
      'b17_guide_native_ad_eligibility';

  final PageController b17QxnPageControllerVza = PageController();

  int b17KqmCurrentPageWze = 0;
  bool b17RqmCanShowNativeAdWza =
      B17QxnUserCheckFuncVza.instance.b17VqnIsEligibleUserTza;
  bool _b17VqnTriedGuideFullAdTza = false;
  bool _b17PqnFinishingGuideVze = false;

  void b17RqmOnPageChangedWza(
    int b17QxnPageIndexVza,
    BuildContext b17QxnContextVza,
  ) {
    b17KqmCurrentPageWze = b17QxnPageIndexVza;
    if (b17QxnPageIndexVza == 1 && !_b17VqnTriedGuideFullAdTza) {
      _b17VqnTriedGuideFullAdTza = true;
      if (B17QxnUserCheckFuncVza.instance.b17VqnIsEligibleUserTza) {
        B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
          b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_new_int,
          b17KqmAdPosIdVzr: B17JkwPosidKos.pr_guide_full,
          b17HqmIgnoreCooldownWza: true,
          b17VmqAdHostContextXtr: b17QxnContextVza,
        );
      }
    }
  }

  void b17VqnClickBottomTza(BuildContext b17QxnContextVza) {
    if (b17KqmCurrentPageWze < 1) {
      b17QxnPageControllerVza.animateToPage(
        b17KqmCurrentPageWze + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
      );
      return;
    }
    if (_b17PqnFinishingGuideVze) return;
    _b17PqnFinishingGuideVze = true;
    unawaited(_b17HqmFinishGuideWza(b17QxnContextVza));
  }

  Future<void> _b17HqmFinishGuideWza(BuildContext b17QxnContextVza) async {
    if (B17QxnUserCheckFuncVza.instance.b17VqnIsEligibleUserTza) {
      await B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
        b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_new_int,
        b17KqmAdPosIdVzr: B17JkwPosidKos.pr_guide_int,
        b17HqmIgnoreCooldownWza: true,
        b17VmqAdHostContextXtr: b17QxnContextVza,
      );
    }
    await B17QxnGuideCompletedCacheVza.b17VqnSaveCompletedTza(true);
    B17JfiFirstUserFuncEjf.instance.toPageOpenNotificationPermission();
  }

  @override
  bool b17FeiRegisterEventJif() => true;

  @override
  void b17RifHandleEventhJei(B17FhiSignalBeanFeo b17QzmEventXva) {
    if (b17QzmEventXva.b17HfeEventCodeFMie !=
        B17QxmSignalCodeVza.b17PqmRefreshBUserStateVzr) {
      return;
    }
    final bool b17QxnCanShowNativeAdVza =
        B17QxnUserCheckFuncVza.instance.b17VqnIsEligibleUserTza;
    if (b17RqmCanShowNativeAdWza == b17QxnCanShowNativeAdVza) return;
    b17RqmCanShowNativeAdWza = b17QxnCanShowNativeAdVza;
    update(<String>[b17QxnNativeAdEligibilityUpdateIdVza]);
  }

  @override
  void onClose() {
    b17QxnPageControllerVza.dispose();
    super.onClose();
  }
}
