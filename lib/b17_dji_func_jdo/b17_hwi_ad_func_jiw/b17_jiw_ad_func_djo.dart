import 'dart:convert';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fef_cache_func_jei/b17_vqn_ad_switch_cache_tza.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fef_cache_func_jei/b17_hqm_firebase_ad_config_cache_wza.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fef_cache_func_jei/b17_pqn_last_ad_show_time_cache_vze.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fef_cache_func_jei/b17_qxn_load_new_launch_ad_cache_vza.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_jdw_metric_type_ijd.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_dji_analytics_func_wji.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_firebase_func_wjo.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fje_device_info_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_qxn_startup_click_gate_func_vza.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_notice_func_wdo/b17_jso_notice_func_wko.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_check_af_new/flutter_check_af_new.dart';
import 'package:flutter_pdf_ad_plugins/flutter_pdf_ad_plugins.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:appsflyer_sdk_plus/appsflyer_sdk.dart';

class B17JiwAdFuncDjo implements FlutterPdfAdListener {
  static final B17JiwAdFuncDjo _b17PqmAdUtilsInstanceVzr = B17JiwAdFuncDjo._();

  B17JiwAdFuncDjo._();

  bool b17QxnLoadNewLaunchAdVza = false;
  int _b17PqmLastShowCachedSceneAdTimeVzr = 0;

  static B17JiwAdFuncDjo get b17KqmAdUtilsInstanceVzr =>
      _b17PqmAdUtilsInstanceVzr;

  final List<B17EipAdSceneUkg> _b17VmqStartupPreloadAdScenesXtr =
      <B17EipAdSceneUkg>[];
  final Set<B17EipAdSceneUkg> _b17KqmNoReloadAfterCloseAdScenesVzr =
      <B17EipAdSceneUkg>{B17EipAdSceneUkg.pr_new_launch};
  final Map<B17EipAdSceneUkg, Set<B17JkwPosidKos>>
  _b17XmqAdSceneAllowedPosIdsMapVtr = <B17EipAdSceneUkg, Set<B17JkwPosidKos>>{
    B17EipAdSceneUkg.pr_new_launch: <B17JkwPosidKos>{
      B17JkwPosidKos.pr_new_open,
    },
    B17EipAdSceneUkg.pr_launch: <B17JkwPosidKos>{
      B17JkwPosidKos.pr_open_cold,
      B17JkwPosidKos.pr_open_hot,
      B17JkwPosidKos.pr_open_noti,
      B17JkwPosidKos.pr_open_pop,
      B17JkwPosidKos.pr_open_file,
      B17JkwPosidKos.pr_open_mediapop,
      B17JkwPosidKos.pr_permission_open,
    },
    B17EipAdSceneUkg.pr_ban1: <B17JkwPosidKos>{
      B17JkwPosidKos.pr_new_lan_nat,
      B17JkwPosidKos.pr_main_banner1,
    },
    B17EipAdSceneUkg.pr_ban2: <B17JkwPosidKos>{
      B17JkwPosidKos.pr_main_banner2,
      B17JkwPosidKos.unload_nat1,
    },
    B17EipAdSceneUkg.pr_ban3: <B17JkwPosidKos>{B17JkwPosidKos.pr_main_banner3},
    B17EipAdSceneUkg.pr_user_use: <B17JkwPosidKos>{
      B17JkwPosidKos.pr_up_int,
      B17JkwPosidKos.pr_down_int,
      B17JkwPosidKos.pr_sc_pdf,
      B17JkwPosidKos.pr_w_pdf,
      B17JkwPosidKos.pr_img_pdf,
      B17JkwPosidKos.pr_refresh,
      B17JkwPosidKos.pr_search_int,
      B17JkwPosidKos.pr_read_int,
    },
    B17EipAdSceneUkg.pr_exit: <B17JkwPosidKos>{
      B17JkwPosidKos.pr_readback,
      B17JkwPosidKos.pr_exit_app,
      B17JkwPosidKos.unload_1,
      B17JkwPosidKos.unload_2,
      B17JkwPosidKos.pr_comment,
    },
  };

  Future<void> b17PqmInitializeAdSdkVzr() async {
    _b17XmqBuildStartupPreloadSceneListVtr();
    FlutterPdfAdPlugins.instance.setListener(this);
    FlutterPdfAdPlugins.instance.initializeAdmob();
    final UmpConsentResult b17KqmUmpConsentResultVzr = await FlutterPdfAdPlugins
        .instance
        .handleUmpConsent();
    if (!b17KqmUmpConsentResultVzr.canRequestAds) {
      return;
    }
    FlutterPdfAdPlugins.instance.updateDebugPaidRevenueRange(
      minRevenue: 100,
      maxRevenue: 200,
    );
    FlutterPdfAdPlugins.instance.updateInterstitialLikeNativePlacements(
      const <B17EipAdSceneUkg>[B17EipAdSceneUkg.pr_user_use],
    );
    FlutterPdfAdPlugins.instance.updateSmallTemplateNativePlacements(
      const <B17EipAdSceneUkg>[
        B17EipAdSceneUkg.pr_ban1,
        B17EipAdSceneUkg.pr_ban2,
        B17EipAdSceneUkg.pr_ban3,
      ],
    );
    FlutterPdfAdPlugins.instance.updateSkipReloadAfterClosePlacements(
      _b17KqmNoReloadAfterCloseAdScenesVzr,
    );
    await b17KqmRefreshRemoteAdConfigVzr();
    await FlutterPdfAdPlugins.instance.initPlugins(
      distinctId: await FlutterTbaInfo.instance.getDistinctId(),
      fengKongLogic: () {
        return false;
      },
      smallNativeAdLayoutName: 'b17_krb_native_ad_layout_ncz',
    );
    await _b17VmqPreloadStartupAdScenesXtr();
  }

  Future<void> _b17VmqPreloadStartupAdScenesXtr() async {
    final List<Future<void>> b17PqmStartupPreloadTasksVzr =
        _b17VmqStartupPreloadAdScenesXtr
            .map(_b17PqmPreloadAdScenePlacementVzr)
            .toList(growable: false);
    await Future.wait(b17PqmStartupPreloadTasksVzr);
  }

  Future<void> _b17PqmPreloadAdScenePlacementVzr(
    B17EipAdSceneUkg b17PqmAdSceneVzr, {
    B17JkwPosidKos? b17VmqAdPosIdXtr,
  }) async {
    final B17JkwPosidKos b17KqmResolvedAdPosIdVzr =
        b17VmqAdPosIdXtr ??
        _b17KqmResolveStartupPreloadPosIdVzr(b17PqmAdSceneVzr);
    if (!_b17PqmCanUseAdScenePosIdVzr(
      b17PqmAdSceneVzr,
      b17KqmResolvedAdPosIdVzr,
    )) {
      return;
    }
    try {
      await _b17KqmLoadStartupAdSceneIgnoringShieldVzr(b17PqmAdSceneVzr);
    } catch (_) {
      return;
    }
  }

  Future<void> b17KqmPreloadAdBySceneWze(
    B17EipAdSceneUkg b17VqnAdSceneTza,
  ) async {
    await Future.wait(<Future<void>>[
      _b17PqmPreloadAdScenePlacementVzr(b17VqnAdSceneTza),
    ]);
  }

  Future<Widget?> b17PqmTakeFilesListNativeAdWidgetVzr({
    bool b17PqmLoadIfNeededVzr = true,
    bool b17PqmReloadAfterTakeVzr = false,
    Duration b17PqmDisposeDelayVzr = const Duration(seconds: 2),
  }) async {
    return FlutterPdfAdPlugins.instance.takeCachedAdWidget<B17EipAdSceneUkg>(
      B17EipAdSceneUkg.pr_ban1,
      adPosId: B17JkwPosidKos.pr_main_banner1,
      loadIfNeeded: b17PqmLoadIfNeededVzr,
      reloadAfterTake: b17PqmReloadAfterTakeVzr,
      disposeDelay: b17PqmDisposeDelayVzr,
    );
  }

  Future<Widget?> b17PqmBuildCachedNativeAdWidgetVzr({
    required B17EipAdSceneUkg b17PqmAdSceneVzr,
    required B17JkwPosidKos b17KqmAdPosIdVzr,
  }) async {
    if (!_b17PqmCanUseAdScenePosIdVzr(b17PqmAdSceneVzr, b17KqmAdPosIdVzr)) {
      return null;
    }
    return FlutterPdfAdPlugins.instance.buildCachedAdWidget<B17EipAdSceneUkg>(
      b17PqmAdSceneVzr,
      adPosId: b17KqmAdPosIdVzr,
    );
  }

  Future<bool> b17PqmHasFilesListNativeAdVzr() {
    return b17XmqHasCachedSceneAdVtr(
      b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_ban1,
      b17KqmAdPosIdVzr: B17JkwPosidKos.pr_main_banner1,
    );
  }

  Future<void> b17PqmRequestFilesListNativeAdVzr() async {
    await FlutterPdfAdPlugins.instance.loadPlacement<B17EipAdSceneUkg>(
      B17EipAdSceneUkg.pr_ban1,
      force: true,
      placementLabelBuilder: (B17EipAdSceneUkg b17PqmAdSceneVzr) =>
          b17PqmAdSceneVzr.name,
    );
  }

  Future<void> _b17KqmLoadStartupAdSceneIgnoringShieldVzr(
    B17EipAdSceneUkg b17PqmAdSceneVzr,
  ) async {
    if (b17PqmAdSceneVzr != B17EipAdSceneUkg.pr_ban2 &&
        b17PqmAdSceneVzr != B17EipAdSceneUkg.pr_exit) {
      await FlutterPdfAdPlugins.instance.loadPlacement<B17EipAdSceneUkg>(
        b17PqmAdSceneVzr,
        placementLabelBuilder: (B17EipAdSceneUkg b17PqmAdPlacementVzr) =>
            b17PqmAdPlacementVzr.name,
      );
      return;
    }
    await FlutterPdfAdPlugins.instance.loadPlacement<B17EipAdSceneUkg>(
      b17PqmAdSceneVzr,
      placementLabelBuilder: (B17EipAdSceneUkg b17PqmAdPlacementVzr) =>
          b17PqmAdPlacementVzr.name,
    );
  }

  bool _b17PqmCanUseAdScenePosIdVzr(
    B17EipAdSceneUkg b17PqmAdSceneVzr,
    B17JkwPosidKos b17KqmAdPosIdVzr,
  ) {
    return _b17VmqIsAdScenePosIdMatchedXtr(b17PqmAdSceneVzr, b17KqmAdPosIdVzr);
  }

  bool _b17VmqIsAdScenePosIdMatchedXtr(
    B17EipAdSceneUkg b17PqmAdSceneVzr,
    B17JkwPosidKos b17KqmAdPosIdVzr,
  ) {
    final Set<B17JkwPosidKos>? b17VmqAllowedAdPosIdsXtr =
        _b17XmqAdSceneAllowedPosIdsMapVtr[b17PqmAdSceneVzr];
    if (b17VmqAllowedAdPosIdsXtr == null) {
      return true;
    }
    return b17VmqAllowedAdPosIdsXtr.contains(b17KqmAdPosIdVzr);
  }

  B17JkwPosidKos _b17KqmResolveStartupPreloadPosIdVzr(
    B17EipAdSceneUkg b17PqmAdSceneVzr,
  ) {
    final Set<B17JkwPosidKos>? b17VmqAllowedAdPosIdsXtr =
        _b17XmqAdSceneAllowedPosIdsMapVtr[b17PqmAdSceneVzr];
    if (b17VmqAllowedAdPosIdsXtr == null || b17VmqAllowedAdPosIdsXtr.isEmpty) {
      return _b17XmqAdSceneAllowedPosIdsMapVtr[b17PqmAdSceneVzr]?.first ??
          B17JkwPosidKos.pr_open_cold;
    }
    return b17VmqAllowedAdPosIdsXtr.first;
  }

  void _b17XmqBuildStartupPreloadSceneListVtr() {
    _b17VmqStartupPreloadAdScenesXtr.clear();
    _b17VmqStartupPreloadAdScenesXtr.add(B17EipAdSceneUkg.pr_launch);
    _b17VmqStartupPreloadAdScenesXtr.add(B17EipAdSceneUkg.pr_ban1);
    if (B17QxnUserCheckFuncVza.instance.b17VqnIsEligibleUserTza) {
      _b17VmqStartupPreloadAdScenesXtr.add(B17EipAdSceneUkg.pr_ban2);
      _b17VmqStartupPreloadAdScenesXtr.add(B17EipAdSceneUkg.pr_exit);
    }
    b17QxnLoadNewLaunchAdVza =
        B17QxnLoadNewLaunchAdCacheVza.b17KqmReadEnabledWze();
    if (b17QxnLoadNewLaunchAdVza) {
      B17QxnLoadNewLaunchAdCacheVza.b17VqnSaveEnabledTza(false);
      _b17VmqStartupPreloadAdScenesXtr.add(B17EipAdSceneUkg.pr_new_launch);
    }
  }

  Future<void> b17KqmRefreshRemoteAdConfigVzr() async {
    final dynamic b17PqmAdConfigMapVzr = await _b17KqmLoadAdConfigMapVzr();
    final Map<B17EipAdSceneUkg, List<AdInfoBean>> b17VmqParsedAdConfigXtr =
        <B17EipAdSceneUkg, List<AdInfoBean>>{};
    if (b17PqmAdConfigMapVzr is Map) {
      b17PqmAdConfigMapVzr.forEach((
        dynamic b17PqmConfigSceneKeyVzr,
        dynamic b17KqmConfigListValueVzr,
      ) {
        final B17EipAdSceneUkg? b17VmqConfigAdSceneXtr =
            _b17PqmFindAdSceneByConfigKeyVzr('$b17PqmConfigSceneKeyVzr');
        if (b17VmqConfigAdSceneXtr == null ||
            b17KqmConfigListValueVzr is! List) {
          return;
        }
        final List<AdInfoBean> b17KqmSceneAdConfigsVzr = b17VmqParsedAdConfigXtr
            .putIfAbsent(b17VmqConfigAdSceneXtr, () => <AdInfoBean>[]);
        for (final dynamic b17PqmConfigItemVzr in b17KqmConfigListValueVzr) {
          if (b17PqmConfigItemVzr is! Map) {
            continue;
          }
          b17KqmSceneAdConfigsVzr.add(
            AdInfoBean.fromPlacementJson(
              Map<String, dynamic>.from(b17PqmConfigItemVzr),
            ),
          );
        }
      });
    }
    FlutterPdfAdPlugins.instance.updateConfigs<B17EipAdSceneUkg>(
      b17VmqParsedAdConfigXtr,
      placementLabelBuilder: (B17EipAdSceneUkg b17PqmAdSceneVzr) =>
          b17PqmAdSceneVzr.name,
    );
  }

  void b17HqmUpdateFacebookAdConfigWza(String b17PqmPdfAdfbVzr) {
    try {
      final dynamic b17PqmAdConfigMapVzr = jsonDecode(b17PqmPdfAdfbVzr);
      final Map<B17EipAdSceneUkg, List<AdInfoBean>> b17VmqParsedAdConfigXtr =
          <B17EipAdSceneUkg, List<AdInfoBean>>{};
      if (b17PqmAdConfigMapVzr is Map) {
        b17PqmAdConfigMapVzr.forEach((
          dynamic b17PqmConfigSceneKeyVzr,
          dynamic b17KqmConfigListValueVzr,
        ) {
          final B17EipAdSceneUkg? b17VmqConfigAdSceneXtr =
              _b17PqmFindAdSceneByConfigKeyVzr('$b17PqmConfigSceneKeyVzr');
          if (b17VmqConfigAdSceneXtr == null ||
              b17KqmConfigListValueVzr is! List) {
            return;
          }
          final List<AdInfoBean> b17KqmSceneAdConfigsVzr =
              b17VmqParsedAdConfigXtr.putIfAbsent(
                b17VmqConfigAdSceneXtr,
                () => <AdInfoBean>[],
              );
          for (final dynamic b17PqmConfigItemVzr in b17KqmConfigListValueVzr) {
            if (b17PqmConfigItemVzr is! Map) {
              continue;
            }
            b17KqmSceneAdConfigsVzr.add(
              AdInfoBean.fromPlacementJson(
                Map<String, dynamic>.from(b17PqmConfigItemVzr),
              ),
            );
          }
        });
      }
      FlutterPdfAdPlugins.instance.updateFacebookConfigs<B17EipAdSceneUkg>(
        b17VmqParsedAdConfigXtr,
        placementLabelBuilder: (B17EipAdSceneUkg b17PqmAdSceneVzr) =>
            b17PqmAdSceneVzr.name,
      );
    } catch (_) {}
  }

  B17EipAdSceneUkg? _b17PqmFindAdSceneByConfigKeyVzr(
    String b17KqmConfigKeyVzr,
  ) {
    try {
      return B17EipAdSceneUkg.values.byName(b17KqmConfigKeyVzr);
    } catch (b17PqmErrorVzr) {
      return null;
    }
  }

  Future<dynamic> _b17KqmLoadAdConfigMapVzr() async {
    try {
      final String b17VmqStoredAdConfigXtr =
          B17HqmFirebaseAdConfigCacheWza.b17KqnReadConfigVxe();
      if (b17VmqStoredAdConfigXtr.isNotEmpty) {
        return jsonDecode(b17VmqStoredAdConfigXtr);
      }
      return jsonDecode(await _b17VmqLoadLocalAdConfigTextXtr());
    } catch (b17PqmErrorVzr) {
      return jsonDecode(await _b17VmqLoadLocalAdConfigTextXtr());
    }
  }

  Future<String> _b17VmqLoadLocalAdConfigTextXtr() async {
    final String b17PqmEncryptedLocalAdConfigVzr = await rootBundle.loadString(
      B17FjeDeviceInfoIfj.localAdConfig,
    );
    return b17PqmEncryptedLocalAdConfigVzr;
  }

  Future<bool?> b17PqmShowCachedSceneAdVzr({
    required B17EipAdSceneUkg b17PqmAdSceneVzr,
    required B17JkwPosidKos b17KqmAdPosIdVzr,
    BuildContext? b17VmqAdHostContextXtr,
    bool b17PqnUploadChanceVze = true,
  }) async {
    if (FlutterPdfAdPlugins.instance.isShowingAd()) {
      return false;
    }
    if (!await b17VqnCanShowAdBySwitchTza(b17KqmAdPosIdVzr)) {
      return false;
    }
    if (!_b17PqmCanUseAdScenePosIdVzr(b17PqmAdSceneVzr, b17KqmAdPosIdVzr)) {
      debugPrint(
        'b17YyxShowAdTwt _b17PqmCanUseAdScenePosIdVzr scene=$b17PqmAdSceneVzr, posid=$b17KqmAdPosIdVzr',
      );
      return false;
    }
    if (!_b17OrsShouldExcludeCooldownFHow(
      b17PqmAdSceneVzr: b17PqmAdSceneVzr,
      b17KqmAdPosIdVzr: b17KqmAdPosIdVzr,
    )) {
      return false;
    }
    final int b17VmqCurrentShowCachedSceneAdTimeXtr =
        DateTime.now().millisecondsSinceEpoch;
    final int b17KqmLastShowCachedSceneAdIntervalVzr =
        _b17PqmLastShowCachedSceneAdTimeVzr <= 0
        ? -1
        : b17VmqCurrentShowCachedSceneAdTimeXtr -
              _b17PqmLastShowCachedSceneAdTimeVzr;
    _b17PqmLastShowCachedSceneAdTimeVzr = b17VmqCurrentShowCachedSceneAdTimeXtr;
    if (b17PqnUploadChanceVze) {
      b17KqnUploadAdChanceVxe(
        b17PqmAdSceneVzr: b17PqmAdSceneVzr,
        b17KqmAdPosIdVzr: b17KqmAdPosIdVzr,
      );
    }
    try {
      final bool b17VmqHasCachedAdXtr = await _b17KqmHasCachedAdForSceneVzr(
        b17PqmAdSceneVzr: b17PqmAdSceneVzr,
        b17KqmAdPosIdVzr: b17KqmAdPosIdVzr,
      );
      if (!b17VmqHasCachedAdXtr) {
        B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
          b17QxnPointTypeVza: B17JdwMetricTypeIjd.show_ad_no_cache,
          b17KqmParametersWze: {
            "scene": b17PqmAdSceneVzr.name,
            "ad_pos_id": b17KqmAdPosIdVzr.name,
            "last_time": b17KqmLastShowCachedSceneAdIntervalVzr,
          },
        );
        if (_b17KqmNoReloadAfterCloseAdScenesVzr.contains(b17PqmAdSceneVzr)) {
          return false;
        }
        _b17PqmPreloadAdScenePlacementVzr(
          b17PqmAdSceneVzr,
          b17VmqAdPosIdXtr: b17KqmAdPosIdVzr,
        );
        return false;
      }
      final BuildContext? b17PqmValidAdHostContextVzr = b17VmqAdHostContextXtr;
      if (b17PqmValidAdHostContextVzr != null &&
          !b17PqmValidAdHostContextVzr.mounted) {
        return false;
      }
      final bool? b17PqmDidShowCachedAdVzr = await FlutterPdfAdPlugins.instance
          .showCachedAd<B17EipAdSceneUkg>(
            b17PqmAdSceneVzr,
            adPosId: b17KqmAdPosIdVzr,
            context: b17PqmValidAdHostContextVzr,
          );
      return b17PqmDidShowCachedAdVzr;
    } catch (b17PqmErrorVzr, b17KqmStackTraceVzr) {
      debugPrint(
        'show cached placement error: scene=$b17PqmAdSceneVzr, error=$b17PqmErrorVzr',
      );
      debugPrint(b17KqmStackTraceVzr.toString());
      return false;
    }
  }

  Future<bool> b17VqnCanShowAdBySwitchTza(
    B17JkwPosidKos b17KqmAdPosIdWze,
  ) async {
    try {
      String b17PqnSwitchConfigVze =
          B17VqnAdSwitchCacheTza.b17KqmReadConfigWze();
      if (b17PqnSwitchConfigVze.isEmpty) {
        b17PqnSwitchConfigVze = await rootBundle.loadString(
          B17FjeDeviceInfoIfj.localAdSwitch,
        );
      }
      final dynamic b17QxnSwitchJsonVza = jsonDecode(b17PqnSwitchConfigVze);
      if (b17QxnSwitchJsonVza is! Map<String, dynamic>) {
        return true;
      }
      final dynamic b17HqmSwitchValueWza =
          b17QxnSwitchJsonVza[b17KqmAdPosIdWze.name];
      return b17HqmSwitchValueWza != 0;
    } catch (_) {
      return true;
    }
  }

  void b17KqnUploadAdChanceVxe({
    required B17EipAdSceneUkg b17PqmAdSceneVzr,
    required B17JkwPosidKos b17KqmAdPosIdVzr,
  }) {
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.ad_chance,
      b17KqmParametersWze: {
        "scene": b17PqmAdSceneVzr.name,
        "ad_pos_id": b17KqmAdPosIdVzr.name,
      },
    );
  }

  Future<bool> b17XmqHasCachedSceneAdVtr({
    required B17EipAdSceneUkg b17PqmAdSceneVzr,
    required B17JkwPosidKos b17KqmAdPosIdVzr,
  }) {
    return _b17KqmHasCachedAdForSceneVzr(
      b17PqmAdSceneVzr: b17PqmAdSceneVzr,
      b17KqmAdPosIdVzr: b17KqmAdPosIdVzr,
    );
  }

  Future<void> b17RqmLoadBPackageAdXza() async {
    if (!B17QxnUserCheckFuncVza.instance.b17VqnIsEligibleUserTza) {
      return;
    }
    b17KqmPreloadAdBySceneWze(B17EipAdSceneUkg.pr_exit);
    b17KqmPreloadAdBySceneWze(B17EipAdSceneUkg.pr_ban2);
  }

  bool _b17OrsShouldExcludeCooldownFHow({
    required B17EipAdSceneUkg b17PqmAdSceneVzr,
    required B17JkwPosidKos b17KqmAdPosIdVzr,
  }) {
    final String? b17VmqCooldownKeyXtr = _b17PqmGetCooldownKeyVzr(
      b17PqmAdSceneVzr: b17PqmAdSceneVzr,
      b17KqmAdPosIdVzr: b17KqmAdPosIdVzr,
    );
    if (b17VmqCooldownKeyXtr == null) {
      debugPrint(
        'b17YyxShowAdTwt cooldown scene=${b17PqmAdSceneVzr.name}, '
        'posid=${b17KqmAdPosIdVzr.name}, canShow=true, '
        'cooldownMs=0, intervalMs=-1, reason=no-cooldown',
      );
      return true;
    }
    final int b17PqmLastShowTimeMsVzr =
        B17PqnLastAdShowTimeCacheVze.b17KqmReadTimeWze(b17VmqCooldownKeyXtr);
    final int b17KqmCooldownMsVzr =
        B17KqmFirebaseFuncWze.instance.b17PqnAdCooldownSecondsVze * 1000;
    if (b17PqmLastShowTimeMsVzr <= 0) {
      debugPrint(
        'b17YyxShowAdTwt cooldown scene=${b17PqmAdSceneVzr.name}, '
        'posid=${b17KqmAdPosIdVzr.name}, canShow=true, '
        'cooldownKey=$b17VmqCooldownKeyXtr, '
        'cooldownMs=$b17KqmCooldownMsVzr, intervalMs=-1, '
        'reason=no-last-show',
      );
      return true;
    }
    final int b17VmqNowMsXtr = DateTime.now().millisecondsSinceEpoch;
    final int b17PqmShowIntervalMsVzr =
        b17VmqNowMsXtr - b17PqmLastShowTimeMsVzr;
    final bool b17VmqCanShowXtr =
        b17PqmShowIntervalMsVzr >= b17KqmCooldownMsVzr;
    debugPrint(
      'b17YyxShowAdTwt cooldown scene=${b17PqmAdSceneVzr.name}, '
      'posid=${b17KqmAdPosIdVzr.name}, canShow=$b17VmqCanShowXtr, '
      'cooldownKey=$b17VmqCooldownKeyXtr, '
      'cooldownMs=$b17KqmCooldownMsVzr, '
      'intervalMs=$b17PqmShowIntervalMsVzr',
    );
    return b17VmqCanShowXtr;
  }

  String? _b17PqmGetCooldownKeyVzr({
    required B17EipAdSceneUkg b17PqmAdSceneVzr,
    required B17JkwPosidKos b17KqmAdPosIdVzr,
  }) {
    if (b17PqmAdSceneVzr == B17EipAdSceneUkg.pr_user_use) {
      return b17PqmAdSceneVzr.name;
    }
    if (b17PqmAdSceneVzr == B17EipAdSceneUkg.pr_exit &&
        b17KqmAdPosIdVzr == B17JkwPosidKos.pr_readback) {
      return b17KqmAdPosIdVzr.name;
    }
    return null;
  }

  Future<bool> _b17KqmHasCachedAdForSceneVzr({
    required B17EipAdSceneUkg b17PqmAdSceneVzr,
    required B17JkwPosidKos b17KqmAdPosIdVzr,
  }) async {
    if (!_b17VmqIsAdScenePosIdMatchedXtr(b17PqmAdSceneVzr, b17KqmAdPosIdVzr)) {
      debugPrint(
        'HasAvailableCachedAd _b17VmqIsAdScenePosIdMatchedXtr scene=$b17PqmAdSceneVzr, posid=$b17KqmAdPosIdVzr',
      );
      return false;
    }
    if (!_b17PqmCanUseAdScenePosIdVzr(b17PqmAdSceneVzr, b17KqmAdPosIdVzr)) {
      return false;
    }
    try {
      final AdInfoBean? b17PqmCachedAdInfoVzr = await FlutterPdfAdPlugins
          .instance
          .getAvailableCachedAdInfo<B17EipAdSceneUkg>(b17PqmAdSceneVzr);
      return b17PqmCachedAdInfoVzr != null;
    } catch (b17PqmErrorVzr, b17KqmStackTraceVzr) {
      debugPrint(
        'HasAvailableCachedAd catch scene=$b17PqmAdSceneVzr, error=$b17PqmErrorVzr',
      );
      debugPrint(b17KqmStackTraceVzr.toString());
      return false;
    }
  }

  @override
  void onAdClicked(
    Object b17PqmAdPlacementVzr,
    AdInfoBean b17KqmAdInfoVzr,
    Object b17VmqAdPosIdXtr,
    String b17VmqAdNetworkXtr,
    String b17PqmAdSourceNameVzr,
  ) {
    B17PqnNoticeFuncVze.instance.b17KqnShowAdClickNotificationVxe();
    if (b17PqmAdPlacementVzr is! B17EipAdSceneUkg) {
      return;
    }
    if (b17VmqAdPosIdXtr is! B17JkwPosidKos) {
      return;
    }
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.ad_click,
      b17KqmParametersWze: {
        "scene": b17PqmAdPlacementVzr.name,
        "ad_format": b17KqmAdInfoVzr.adType,
        "ad_code_id": b17KqmAdInfoVzr.adId,
        "ad_pos_id": b17VmqAdPosIdXtr.name,
        "ad_network": b17VmqAdNetworkXtr,
        "ad_source_client": b17PqmAdSourceNameVzr,
      },
    );
  }

  @override
  void onAdClosed(
    Object b17PqmAdPlacementVzr,
    AdInfoBean b17KqmAdInfoVzr,
    Object b17VmqAdPosIdXtr,
    String b17VmqAdNetworkXtr,
    String b17PqmAdSourceNameVzr,
  ) {
    if (b17PqmAdPlacementVzr is! B17EipAdSceneUkg) {
      return;
    }
    if (b17VmqAdPosIdXtr is! B17JkwPosidKos) {
      return;
    }
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.ad_close,
      b17KqmParametersWze: {
        "scene": b17PqmAdPlacementVzr.name,
        "ad_format": b17KqmAdInfoVzr.adType,
        "ad_code_id": b17KqmAdInfoVzr.adId,
        "ad_pos_id": b17VmqAdPosIdXtr.name,
        "ad_network": b17VmqAdNetworkXtr,
        "ad_source_client": b17PqmAdSourceNameVzr,
      },
    );
  }

  @override
  void onAdPaidEvent(
    Object b17PqmAdPlacementVzr,
    Object b17VmqAdPosIdXtr,
    double b17KqmRevenueVzr,
    String b17PqmCurrencyCodeVzr,
    String b17VmqAdNetworkXtr,
    String b17KqmPrecisionTypeVzr,
    AdInfoBean b17PqmAdInfoVzr,
  ) {
    if (b17PqmAdPlacementVzr is! B17EipAdSceneUkg) {
      return;
    }
    if (b17VmqAdPosIdXtr is! B17JkwPosidKos) {
      return;
    }
    if (b17KqmRevenueVzr >= 0.01) {
      B17KqmFirebaseFuncWze.instance.b17VqnLogAnalyticsEventTza(
        b17QxnNameVza: B17JdwMetricTypeIjd.pr_total_001_revenue.name,
      );
      B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
        b17QxnPointTypeVza: B17JdwMetricTypeIjd.pr_total_001_revenue,
        b17KqmParametersWze: {
          "scene": b17PqmAdPlacementVzr.name,
          "ad_pos_id": b17VmqAdPosIdXtr.name,
          "ad_format": b17PqmAdInfoVzr.adType,
          "ad_code_id": b17PqmAdInfoVzr.adId,
          "currency": b17PqmCurrencyCodeVzr,
          "value": b17KqmRevenueVzr,
          "ad_network": b17VmqAdNetworkXtr,
          "ad_source_client": b17PqmAdInfoVzr.adPlat,
        },
      );
    }

    FlutterCheckAf.instance.uploadAdRevenue(
      b17VmqAdNetworkXtr,
      b17KqmRevenueVzr,
      b17PqmAdInfoVzr.adId ?? "",
      b17PqmAdPlacementVzr.name,
      AFMediationNetwork.googleAdMob,
    );

    B17KqmFirebaseFuncWze.instance.b17KqmLogFacebookPurchaseWze(
      b17KqmRevenueVzr,
      b17PqmCurrencyCodeVzr,
    );

    B17KqmFirebaseFuncWze.instance.b17VqnLogAnalyticsEventTza(
      b17QxnNameVza: B17JdwMetricTypeIjd.ad_impression_revenue.name,
      b17KqmParametersWze: {
        "currency": b17PqmCurrencyCodeVzr,
        "value": b17KqmRevenueVzr,
      },
    );
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.ad_impression_revenue,
      b17KqmParametersWze: {
        "scene": b17PqmAdPlacementVzr.name,
        "ad_pos_id": b17VmqAdPosIdXtr.name,
        "ad_format": b17PqmAdInfoVzr.adType,
        "ad_code_id": b17PqmAdInfoVzr.adId,
        "currency": b17PqmCurrencyCodeVzr,
        "value": b17KqmRevenueVzr,
        "ad_network": b17VmqAdNetworkXtr,
        "ad_source_client": b17PqmAdInfoVzr.adPlat,
      },
    );

    B17DjiAnalyticsFuncWji.instance.b17HqmUploadAdWza(
      b17QxnAdInfoVza: b17PqmAdInfoVzr,
      b17KqmAdSceneWze: b17PqmAdPlacementVzr,
      b17VqnPositionIdTza: b17VmqAdPosIdXtr,
      b17HqmRevenueWza: b17KqmRevenueVzr,
      b17PqnCurrencyVze: b17PqmCurrencyCodeVzr,
      b17KqnAdNetworkVxe: b17VmqAdNetworkXtr,
      b17PqmPrecisionXza: b17KqmPrecisionTypeVzr,
    );
  }

  @override
  void onAdRequestFailure(
    Object b17PqmAdPlacementVzr,
    AdInfoBean b17KqmAdInfoVzr,
    String b17PqmFailReasonVzr,
    String b17VmqAdNetworkXtr,
    String b17KqmAdSourceNameVzr,
    double loadDurationSeconds,
  ) {
    if (b17PqmAdPlacementVzr is! B17EipAdSceneUkg) {
      return;
    }
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.ad_load_fail,
      b17KqmParametersWze: {
        "scene": b17PqmAdPlacementVzr.name,
        "ad_format": b17KqmAdInfoVzr.adType,
        "ad_code_id": b17KqmAdInfoVzr.adId,
        "error_message": b17PqmFailReasonVzr,
        "ad_source_client": b17KqmAdSourceNameVzr,
        "ad_network": b17VmqAdNetworkXtr,
        "load_time": loadDurationSeconds,
      },
    );
  }

  @override
  void onAdRequestStart(
    Object b17PqmAdPlacementVzr,
    AdInfoBean b17KqmAdInfoVzr,
  ) {
    if (b17PqmAdPlacementVzr is! B17EipAdSceneUkg) {
      return;
    }
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.ad_request,
      b17KqmParametersWze: {
        "scene": b17PqmAdPlacementVzr.name,
        "ad_format": b17KqmAdInfoVzr.adType,
        "ad_code_id": b17KqmAdInfoVzr.adId,
      },
    );
  }

  @override
  void onAdRequestSuccess(
    Object b17PqmAdPlacementVzr,
    AdInfoBean b17KqmAdInfoVzr,
    String b17VmqAdNetworkXtr,
    String b17PqmAdSourceNameVzr,
    double loadDurationSeconds,
  ) {
    if (b17PqmAdPlacementVzr is! B17EipAdSceneUkg) {
      return;
    }
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.ad_load_success,
      b17KqmParametersWze: {
        "scene": b17PqmAdPlacementVzr.name,
        "ad_format": b17KqmAdInfoVzr.adType,
        "ad_code_id": b17KqmAdInfoVzr.adId,
        "ad_source_client": b17PqmAdSourceNameVzr,
        "ad_network": b17VmqAdNetworkXtr,
        "load_time": loadDurationSeconds,
      },
    );
  }

  @override
  void onAdShowFailure(
    Object b17PqmAdPlacementVzr,
    AdInfoBean b17KqmAdInfoVzr,
    Object b17VmqAdPosIdXtr,
    String b17VmqAdNetworkXtr,
    String b17PqmAdSourceNameVzr,
    String b17KqmErrorMessageVzr,
  ) {
    if (b17PqmAdPlacementVzr is! B17EipAdSceneUkg) {
      return;
    }
    if (b17VmqAdPosIdXtr is! B17JkwPosidKos) {
      return;
    }
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.ad_show_fail,
      b17KqmParametersWze: {
        "scene": b17PqmAdPlacementVzr.name,
        "ad_format": b17KqmAdInfoVzr.adType,
        "ad_code_id": b17KqmAdInfoVzr.adId,
        "ad_pos_id": b17VmqAdPosIdXtr.name,
        "ad_network": b17VmqAdNetworkXtr,
        "ad_source_client": b17PqmAdSourceNameVzr,
        "error_message": b17KqmErrorMessageVzr,
      },
    );
  }

  @override
  void onAdShowStart(
    Object b17PqmAdPlacementVzr,
    AdInfoBean b17KqmAdInfoVzr,
    Object b17VmqAdPosIdXtr,
    String b17VmqAdNetworkXtr,
    String b17PqmAdSourceNameVzr,
  ) {
    if (b17PqmAdPlacementVzr is! B17EipAdSceneUkg) {
      return;
    }
    if (b17VmqAdPosIdXtr is! B17JkwPosidKos) {
      return;
    }
    B17QxnStartupClickGateFuncVza.instance
        .b17HqmMarkLauncherAdShownIfMatchedWza(
          b17PqnAdSceneVze: b17PqmAdPlacementVzr,
          b17KqmAdPosIdWze: b17VmqAdPosIdXtr,
        );
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.ad_show,
      b17KqmParametersWze: {
        "scene": b17PqmAdPlacementVzr.name,
        "ad_format": b17KqmAdInfoVzr.adType,
        "ad_code_id": b17KqmAdInfoVzr.adId,
        "ad_pos_id": b17VmqAdPosIdXtr.name,
        "ad_network": b17VmqAdNetworkXtr,
        "ad_source_client": b17PqmAdSourceNameVzr,
        "ad_source": b17PqmAdSourceNameVzr,
      },
    );
  }

  @override
  void onAdShowSuccess(
    Object b17PqmAdPlacementVzr,
    AdInfoBean b17KqmAdInfoVzr,
    Object b17VmqAdPosIdXtr,
    String b17VmqAdNetworkXtr,
    String b17PqmAdSourceNameVzr,
  ) {
    if (b17PqmAdPlacementVzr is! B17EipAdSceneUkg) {
      return;
    }
    if (b17VmqAdPosIdXtr is! B17JkwPosidKos) {
      return;
    }
    final String? b17PqmCooldownKeyVzr = _b17PqmGetCooldownKeyVzr(
      b17PqmAdSceneVzr: b17PqmAdPlacementVzr,
      b17KqmAdPosIdVzr: b17VmqAdPosIdXtr,
    );
    if (b17PqmCooldownKeyVzr == null) {
      return;
    }
    B17PqnLastAdShowTimeCacheVze.b17VqnSaveTimeTza(
      b17HqmSceneKeyWza: b17PqmCooldownKeyVzr,
      b17PqnTimestampVze: DateTime.now().millisecondsSinceEpoch,
    );
  }

  @override
  void onAdmobInitialized() {
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.sdk_initialization,
    );
  }

  @override
  void onTachi25OneDayRevenueEvent(String b17PqmEventNameVzr) {}

  @override
  void onTachi25TotalRevenueEvent(String b17PqmEventNameVzr) {}

  @override
  void onUmpConsentCanRequestAds(bool b17PqmCanRequestAdsVzr) {
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.can_request_ads,
      b17KqmParametersWze: {"canRequest": b17PqmCanRequestAdsVzr ? 1 : 0},
    );
  }

  @override
  void onUmpConsentFlowComplete(UmpConsentResult b17PqmResultVzr) {
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.consent_status_update,
      b17KqmParametersWze: {
        "countryCode": b17PqmResultVzr.countryCode,
        "requiresCmpByLocale": b17PqmResultVzr.requiresCmpByLocale,
        "purpose_ads": b17PqmResultVzr.canRequestAds,
        "result": b17PqmResultVzr.consentStatus.name,
        "privacyOptionsRequirementStatus":
            b17PqmResultVzr.privacyOptionsRequirementStatus.name,
        "formError":
            "code:${b17PqmResultVzr.formError?.errorCode},message:${b17PqmResultVzr.formError?.message}",
      },
    );
  }

  @override
  void onUmpConsentFlowStart(
    String b17PqmCountryCodeVzr,
    bool b17KqmRequiresCmpByLocaleVzr,
  ) {
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.consent_flow_trigger,
      b17KqmParametersWze: {
        "countryCode": b17PqmCountryCodeVzr,
        "requiresCmp": b17KqmRequiresCmpByLocaleVzr,
      },
    );
  }

  @override
  void onUmpConsentFormShow() {
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.consent_ui_show,
    );
  }

  @override
  void onUmpFormLoad() {
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.ump_form_load,
    );
  }

  @override
  void onUmpFormRequest() {
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.ump_form_request,
    );
  }

  @override
  void onUserGroupResolved(int b17PqmUserGroupVzr) {
    B17DjiAnalyticsFuncWji.instance.addUserGroup(b17PqmUserGroupVzr);
  }
}
