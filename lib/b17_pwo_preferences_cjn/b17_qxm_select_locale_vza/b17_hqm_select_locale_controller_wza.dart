import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fje_localization_ifj/b17_kqm_locale_func_vza.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fje_localization_ifj/b17_fie_locale_utilities_ife.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_jfi_first_user_func_ejf.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_jdw_metric_type_ijd.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_dji_analytics_func_wji.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_fje_base_controller_sak.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17HqmSelectLocaleControllerWza extends B17FjeBaseControllerSak {
  final ScrollController b17QxmLanguageScrollControllerVza = ScrollController();
  late B17QxmLocaleItemVza b17KqnSelectedLanguageVze;
  bool _b17VqnHasScrolledTza = false;

  List<B17QxmLocaleItemVza> get b17PqmLanguageListWza =>
      B17FieLocaleUtilitiesIfe.b17RqmLanguageListWza;

  @override
  void onInit() {
    super.onInit();
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.lang_select_view,
    );
    final b17HqmInitialLocaleWza =
        B17FieLocaleUtilitiesIfe.b17HqnInitialLocaleVze();
    b17KqnSelectedLanguageVze = b17PqmLanguageListWza.firstWhere(
      (b17QxmItemVza) => B17FieLocaleUtilitiesIfe.b17VqnIsSameLocaleTza(
        b17QxmItemVza.b17VqnLocaleTza,
        b17HqmInitialLocaleWza,
      ),
      orElse: () => b17PqmLanguageListWza.first,
    );
  }

  @override
  void onReady() {
    super.onReady();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => b17VqnScrollSelectedLanguageTza(),
    );
  }

  bool b17PqmIsSelectedXza(B17QxmLocaleItemVza b17KqnItemVze) =>
      B17FieLocaleUtilitiesIfe.b17VqnIsSameLocaleTza(
        b17KqnSelectedLanguageVze.b17VqnLocaleTza,
        b17KqnItemVze.b17VqnLocaleTza,
      );

  void b17HqmClickLanguageWza(B17QxmLocaleItemVza b17QxmItemVza) {
    b17KqnSelectedLanguageVze = b17QxmItemVza;
    update();
  }

  void b17VqnScrollSelectedLanguageTza() {
    if (_b17VqnHasScrolledTza ||
        !b17QxmLanguageScrollControllerVza.hasClients) {
      return;
    }
    final b17KqnIndexVze = b17PqmLanguageListWza.indexWhere(
      b17PqmIsSelectedXza,
    );
    _b17VqnHasScrolledTza = true;
    if (b17KqnIndexVze <= 0) return;
    final b17QxmTargetOffsetVza = b17KqnIndexVze * 56.h;
    b17QxmLanguageScrollControllerVza.animateTo(
      b17QxmTargetOffsetVza.clamp(
        0.0,
        b17QxmLanguageScrollControllerVza.position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> b17PooClickOkUto() async {
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.lang_select_click,
    );
    if (B17QxnUserCheckFuncVza.instance.b17VqnIsEligibleUserTza) {
      await B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
        b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_new_int,
        b17KqmAdPosIdVzr: B17JkwPosidKos.pr_new_lan_int,
        b17HqmIgnoreCooldownWza: true,
        b17VmqAdHostContextXtr: Get.context,
      );
    }
    await B17KqmLocaleFuncVza.b17GqmSelectLanguageWxe(
      b17KqnSelectedLanguageVze.b17VqnLocaleTza,
    );
    B17JfiFirstUserFuncEjf.instance.toPageGuide();
  }

  @override
  void onClose() {
    b17QxmLanguageScrollControllerVza.dispose();
    super.onClose();
  }
}
