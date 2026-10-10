import 'dart:convert';

import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_fje_applife_func_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_fje_device_info_ifj.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_float_oho_cache_vze.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_fhi_signal_bean_feo.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_qxm_signal_code_vza.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_fji_signal_func_eji.dart';
import 'package:b17pdf/b17_mye_messaging_kra/b17_dji_notifications_wdo/b17_jso_notice_func_wko.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_vqn_ad_switch_cache_tza.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_hqm_firebase_ad_config_cache_wza.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_jdi_referrer_config_wiw.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_custom_facebook/flutter_custom_facebook.dart';
import 'package:flutter_pdf_ad_plugins/flutter_pdf_ad_plugins.dart';

class B17KqmFirebaseFuncWze {
  B17KqmFirebaseFuncWze._();
  static final B17KqmFirebaseFuncWze instance = B17KqmFirebaseFuncWze._();

  FirebaseRemoteConfig? _b17QxnRemoteConfigVza;
  FirebaseAnalytics? _b17VqnAnalyticsTza;

  bool _b17HqmFacebookInitializedWza = false;

  int b17PqnAdCooldownSecondsVze = 30,aKcCd=180;
  bool b17KqmKoreanPhoneNotificationWze = false;
  String b17AdSource = "local";

  Future<void> b17QxnInitializeFirebaseVza() async {
    if (B17HqmFirebaseAdConfigCacheWza.b17KqnReadConfigVxe().isNotEmpty) {
      b17AdSource = "remote";
    }
    try {
      await Firebase.initializeApp();
      _b17VqnAnalyticsTza ??= FirebaseAnalytics.instance;
      _b17QxnRemoteConfigVza = FirebaseRemoteConfig.instance;
      await _b17QxnRemoteConfigVza?.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(seconds: 1),
        ),
      );
      await _b17QxnRemoteConfigVza?.fetchAndActivate();
      b17VqnApplyRemoteConfigTza();
    } catch (b17QxnErrorVza) {
      await Future.delayed(const Duration(milliseconds: 1000));
      return b17QxnInitializeFirebaseVza();
    }
  }

  void b17VqnApplyRemoteConfigTza() {
    var float_oho = _b17QxnRemoteConfigVza?.getInt("float_oho")??0;
    if(float_oho>0){
      B17FloatOhoCacheVze.b17VqnSaveTimeTza(b17PqnTimestampVze: float_oho);
    }
    final int b17QxnOpenCooldownVza = _b17QxnRemoteConfigVza?.getInt('new_op_cd') ?? 0;
    if (b17QxnOpenCooldownVza > 0) {
      B17FjiSignalFuncEji.instance.b17JijSendMsgFEio(
        B17FhiSignalBeanFeo(
          b17HfeEventCodeFMie: B17QxmSignalCodeVza.b17QxnNewOpenAdCheckTimeVza,
          b17DjiIntValueJie: b17QxnOpenCooldownVza,
        ),
      );
    }

    final String b17KqmPdfAdConfigWze =
        _b17QxnRemoteConfigVza?.getString('pdf_ad_17') ?? '';
    if (b17KqmPdfAdConfigWze.isNotEmpty) {
      b17AdSource = "remote";
      B17HqmFirebaseAdConfigCacheWza.b17PqmSaveConfigXza(b17KqmPdfAdConfigWze);
      B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17KqmRefreshRemoteAdConfigVzr();
    }

    final String b17VqnFacebookAdConfigTza =
        _b17QxnRemoteConfigVza?.getString('pdf_adfb') ?? '';
    if (b17VqnFacebookAdConfigTza.isNotEmpty) {
      B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17HqmUpdateFacebookAdConfigWza(
        b17VqnFacebookAdConfigTza,
      );
    }

    b17HqmApplyAdCooldownConfigWza();

    final String b17PqnReferrerConfigVze =
        _b17QxnRemoteConfigVza?.getString('pr_refer') ?? '';
    if (b17PqnReferrerConfigVze.isNotEmpty) {
      B17JdiReferrerConfigWiw.b17DqnSaveVya(b17PqnReferrerConfigVze);
      B17QxnUserCheckFuncVza.instance.b17PqnApplyReferrerConfigVze();
    }

    final String b17RqmRiskConfigWza =
        _b17QxnRemoteConfigVza?.getString('risk_control') ?? '';
    if (b17RqmRiskConfigWza.isNotEmpty) {
      B17QxnUserCheckFuncVza.instance.b17KqmInitializeRiskControlWze(
        b17RqmRiskConfigWza,
      );
    }

    _b17PqnInitializeFacebookVze();

    final int b17KqmKoreanPushModeWze =
        _b17QxnRemoteConfigVza?.getInt('krsamsung_push_time') ?? 0;
    if (b17KqmKoreanPushModeWze > 0) {
      b17KqmKoreanPhoneNotificationWze = b17KqmKoreanPushModeWze == 1;
      B17PqnNoticeFuncVze.instance.b17QxnInitializeNotificationsVza();
    }
    _b17RqmParseSwitchConfigWza();

    var b17IskRemoteTimeoutTme =
        _b17QxnRemoteConfigVza?.getInt("isk_time") ?? 0;
    if (b17IskRemoteTimeoutTme > 0) {
      FlutterPdfAdPlugins.instance.updateAdRequestTimeoutSeconds(
        b17IskRemoteTimeoutTme,
      );
    }

    var cd_hot = _b17QxnRemoteConfigVza?.getInt("cd_hot")??0;
    if(cd_hot>0){
      B17FjeApplifeFuncIfj.instance.b17HotCd=cd_hot;
    }
    _b17GetAdShowClickConfig();
  }

  void _b17RqmParseSwitchConfigWza() {
    try {
      final String b17QxnSwitchConfigVza =
          _b17QxnRemoteConfigVza?.getString('switch_config') ?? '';
      if (b17QxnSwitchConfigVza.isNotEmpty) {
        B17VqnAdSwitchCacheTza.b17HqmSaveConfigWza(b17QxnSwitchConfigVza);
      }
    } catch (_) {}
  }

  void _b17GetAdShowClickConfig(){
    try{
      var ad_config = _b17QxnRemoteConfigVza?.getString("ad_config")??"";
      if(ad_config.isNotEmpty){
        var json = jsonDecode(ad_config);
        var ad_show = json["ad_show"];
        var ad_click = json["ad_click"];
        FlutterPdfAdPlugins.instance.setMaxShowAndClickNum(
          maxShowNum: ad_show,
          maxClickNum: ad_click,
        );
      }
    }catch(_){

    }
  }

  void b17HqmApplyAdCooldownConfigWza() {
    final int b17QxnRemoteCooldownVza = _b17QxnRemoteConfigVza?.getInt('kc_cd') ?? 0;
    if (b17QxnRemoteCooldownVza > 0) {
      b17PqnAdCooldownSecondsVze = b17QxnRemoteCooldownVza;
    }
    final int a_kc_cd = _b17QxnRemoteConfigVza?.getInt('a_kc_cd') ?? 0;
    if(a_kc_cd>0){
      aKcCd=a_kc_cd;
    }
  }

  Future<void> _b17PqnInitializeFacebookVze() async {
    if (_b17HqmFacebookInitializedWza) {
      return;
    }
    final String b17QxnFacebookConfigVza =
        _b17QxnRemoteConfigVza?.getString('pr_fb') ?? '';
    if (b17QxnFacebookConfigVza.isEmpty) {
      return;
    }
    try {
      final dynamic b17VqnFacebookJsonTza = jsonDecode(b17QxnFacebookConfigVza);
      final bool b17KqmInitializedWze = await FlutterCustomFacebook.instance
          .initFaceBook(
            facebookId: b17VqnFacebookJsonTza['app_id'],
            facebookToken: b17VqnFacebookJsonTza['token'],
            facebookAppName: B17FjeDeviceInfoIfj.b17QxnApplicationNameVza,
          );
      _b17HqmFacebookInitializedWza = b17KqmInitializedWze;
    } catch (_) {}
  }

  Future<void> b17KqmLogFacebookPurchaseWze(
    double b17QxnAmountVza,
    String b17VqnCurrencyTza,
  ) async {
    try {
      if (!_b17HqmFacebookInitializedWza) {
        return;
      }
      FlutterCustomFacebook.instance.logPurchase(
        amount: b17QxnAmountVza,
        currency: b17VqnCurrencyTza,
      );
    } catch (_) {}
  }

  Future<void> b17VqnLogAnalyticsEventTza({
    required String b17QxnNameVza,
    Map<String, Object>? b17KqmParametersWze,
  }) async {
    try {
      if (Firebase.apps.isEmpty) {
        await b17QxnInitializeFirebaseVza();
      }
      _b17VqnAnalyticsTza ??= FirebaseAnalytics.instance;
      await _b17VqnAnalyticsTza?.logEvent(
        name: b17QxnNameVza,
        parameters: b17KqmParametersWze,
      );
    } catch (_) {}
  }
}
