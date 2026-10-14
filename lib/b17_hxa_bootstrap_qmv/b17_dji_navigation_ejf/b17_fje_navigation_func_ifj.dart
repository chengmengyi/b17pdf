import 'dart:async';

import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_jiw_check_user_ojd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract final class B17FjeNavigationFuncIfj {
  static bool b17HqmIsCurrentRouteWza(String b17VqnRouteNameTza) =>
      Get.currentRoute == b17VqnRouteNameTza;

  static Future<T?>? b17HkqPushNamedVpa<T>({
    required String b17McfRouteNameZsq,
    Map<String, dynamic>? b17XveArgumentsDlu,
  }) {
    return Get.toNamed<T>(b17McfRouteNameZsq, arguments: b17XveArgumentsDlu);
  }

  static Future<T?>? b17ZxpReplaceNamedLrt<T>({
    required String b17YweRouteNameQpn,
    Map<String, dynamic>? b17KstArgumentsJva,
  }) {
    return Get.offNamed<T>(b17YweRouteNameQpn, arguments: b17KstArgumentsJva);
  }

  static Future<T?>? b17NvrResetToNamedMce<T>({
    required String b17DqyRouteNameXka,
    Map<String, dynamic>? b17BlgArgumentsFru,
  }) {
    return Get.offAllNamed<T>(
      b17DqyRouteNameXka,
      arguments: b17BlgArgumentsFru,
    );
  }

  static void b17WvxPopUntilNameHqt(String b17PzjRouteNameLem) {
    Get.until((b17KqmRouteCdu) {
      return b17KqmRouteCdu.settings.name == b17PzjRouteNameLem;
    });
  }

  static void b17FtyBackNwp<T>({T? b17NcgResultKqe}) {
    Get.back<T>(result: b17NcgResultKqe);
  }

  static void b17PqnBackWithExitAdVze<T>({T? b17KqmResultWze}) {
    Get.back<T>(result: b17KqmResultWze);
    b17VqnShowExitAdIfNeededTza();
  }

  static void b17VqnShowExitAdIfNeededTza() {
    if (!B17QxnUserCheckFuncVza.instance.b17VqnIsEligibleUserTza) {
      return;
    }
    unawaited(
      Future<void>.delayed(Duration.zero, () async {
        await B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr
            .b17PqmShowCachedSceneAdVzr(
              b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_exit,
              b17KqmAdPosIdVzr: B17JkwPosidKos.pr_exit_app,
            );
      }),
    );
  }

  static Future<T?> b17VxqShowBottomSheetPrn<T>({
    required Widget b17QnwChildXza,
    bool b17MkrDismissibleVte = true,
    Color? b17HpxBarrierColorQwy,
    bool b17ZnlScrollControlledQde = true,
  }) {
    return Get.bottomSheet<T>(
      SafeArea(top: true, bottom: true, child: b17QnwChildXza),
      isScrollControlled: b17ZnlScrollControlledQde,
      barrierColor: b17HpxBarrierColorQwy,
      isDismissible: b17MkrDismissibleVte,
    );
  }

  static Future<T?> b17CtmShowDialogXqe<T>({
    required Widget b17WvpChildRka,
    bool b17ZxmBarrierDismissibleQny = false,
    bool b17YtqUseSafeAreaWlp = false,
  }) {
    return Get.dialog<T>(
      Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: b17WvpChildRka,
      ),
      useSafeArea: b17YtqUseSafeAreaWlp,
      barrierDismissible: b17ZxmBarrierDismissibleQny,
    );
  }

  static Map<String, dynamic> b17NtbGetParamsYpi() {
    try {
      return Get.arguments as Map<String, dynamic>;
    } catch (e) {
      return {};
    }
  }
}
