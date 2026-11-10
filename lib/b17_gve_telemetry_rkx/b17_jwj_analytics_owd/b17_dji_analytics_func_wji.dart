import 'dart:io';

import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_fje_device_info_ifj.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_qxn_upload_install_signal_cache_vza.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_jdw_metric_type_ijd.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pdf_ad_plugins/bean/ad_info_bean.dart';
import 'package:flutter_tba_info_new/flutter_tba_info_new.dart';

class B17DjiAnalyticsFuncWji {
  B17DjiAnalyticsFuncWji._();

  static final B17DjiAnalyticsFuncWji _b17QxnInstanceVza =
      B17DjiAnalyticsFuncWji._();
  static B17DjiAnalyticsFuncWji get instance => _b17QxnInstanceVza;

  final Dio _b17KqmDioClientWze = Dio();
  Future<void>? _b17QxnInstallUploadFutureVza;

  Future<void> b17QxnUploadInstallVza() async {
    if (!B17QxnUploadInstallSignalCacheVza.b17KqmReadEnabledWze()) {
      return;
    }
    final Future<void>? b17KqmRunningFutureWze = _b17QxnInstallUploadFutureVza;
    if (b17KqmRunningFutureWze != null) {
      return b17KqmRunningFutureWze;
    }

    final Future<void> b17VqnUploadFutureTza =
        _b17HqmUploadInstallInternalWza();
    _b17QxnInstallUploadFutureVza = b17VqnUploadFutureTza;
    try {
      await b17VqnUploadFutureTza;
    } finally {
      if (identical(_b17QxnInstallUploadFutureVza, b17VqnUploadFutureTza)) {
        _b17QxnInstallUploadFutureVza = null;
      }
    }
  }

  Future<void> _b17HqmUploadInstallInternalWza() async {
    b17QgrAddLifeTimePjg();

    final Map<String, dynamic> b17VqnRequestBodyTza =
        await _b17HqmCreateCommonBodyWza();
    final Map<dynamic, dynamic> b17PqnReferrerDataVze = await FlutterTbaInfoNew
        .instance
        .getReferrerMap();
    b17VqnRequestBodyTza['newfound'] = <String, dynamic>{
      'boo': b17PqnReferrerDataVze['build'],
      'inertia': b17PqnReferrerDataVze['referrer_url'],
      'scot': b17PqnReferrerDataVze['install_version'],
      'ellipsis': b17PqnReferrerDataVze['user_agent'],
      'awaken': 'dunbar',
      'isabella': b17PqnReferrerDataVze['referrer_click_timestamp_seconds'],
      'senile': b17PqnReferrerDataVze['install_begin_timestamp_seconds'],
      'diploma':
          b17PqnReferrerDataVze['referrer_click_timestamp_server_seconds'],
      'pogrom': b17PqnReferrerDataVze['install_begin_timestamp_server_seconds'],
      'cossack': b17PqnReferrerDataVze['install_first_seconds'],
      'satin': b17PqnReferrerDataVze['last_update_seconds'],
      'degas': b17PqnReferrerDataVze['google_play_instant'],
    };

    final bool b17KqnUploadedVxe = await _b17PqmPostWithRetryXza(
      b17HqmBodyWze: b17VqnRequestBodyTza,
      b17KqmEventTypeWze: 'install',
      b17VqnEventNameTza: 'install',
    );
    if (b17KqnUploadedVxe) {
      await B17QxnUploadInstallSignalCacheVza.b17VqnSaveEnabledTza(false);
    }
  }

  Future<void> b17VqnUploadSessionTza() async {
    final Map<String, dynamic> b17HqmRequestBodyWza =
        await _b17HqmCreateCommonBodyWza();
    b17HqmRequestBodyWza['threaten'] = "moser";
    await _b17PqmPostWithRetryXza(
      b17HqmBodyWze: b17HqmRequestBodyWza,
      b17KqmEventTypeWze: 'session',
      b17VqnEventNameTza: 'session',
    );
  }

  Future<void> b17HqmUploadAdWza({
    required AdInfoBean b17QxnAdInfoVza,
    required B17EipAdSceneUkg b17KqmAdSceneWze,
    required B17JkwPosidKos? b17VqnPositionIdTza,
    required double b17HqmRevenueWza,
    required String b17PqnCurrencyVze,
    required String b17KqnAdNetworkVxe,
    required String b17PqmPrecisionXza,
  }) async {
    final Map<String, dynamic> b17VqnRequestBodyTze =
        await _b17HqmCreateCommonBodyWza();
    b17VqnRequestBodyTze['nutrient'] = <String, dynamic>{
      'crystal': b17HqmRevenueWza * 1000000,
      'demurred': b17PqnCurrencyVze,
      'furrow': b17KqnAdNetworkVxe,
      'chapman': b17QxnAdInfoVza.adPlat ?? '',
      'allen': b17QxnAdInfoVza.adId ?? '',
      'deportee': b17VqnPositionIdTza?.name ?? '',
      'blitz': b17KqmAdSceneWze.name,
      'reflect': b17PqmPrecisionXza,
      'dionysus': b17QxnAdInfoVza.adType,
    };
    await _b17PqmPostWithRetryXza(
      b17HqmBodyWze: b17VqnRequestBodyTze,
      b17KqmEventTypeWze: 'ad',
      b17VqnEventNameTza: b17KqmAdSceneWze.name,
    );
  }

  Future<void> b17KqnUploadPointVxe({
    required B17JdwMetricTypeIjd b17QxnPointTypeVza,
    Map<String, dynamic>? b17KqmParametersWze,
    Map<String, dynamic>? b17VqnUserGroupTza,
  }) async {
    var b17HqmRequestBodyWze = await b17GetPointMapBody(
      b17QxnPointTypeVza: b17QxnPointTypeVza,
      b17KqmParametersWze: b17KqmParametersWze,
      b17VqnUserGroupTza: b17VqnUserGroupTza,
    );
    await _b17PqmPostWithRetryXza(
      b17HqmBodyWze: b17HqmRequestBodyWze,
      b17KqmEventTypeWze: 'point',
      b17VqnEventNameTza: b17QxnPointTypeVza.name,
    );
  }

  Future<Map<String, dynamic>> b17GetPointMapBody({
    required B17JdwMetricTypeIjd b17QxnPointTypeVza,
    Map<String, dynamic>? b17KqmParametersWze,
    Map<String, dynamic>? b17VqnUserGroupTza,
  }) async {
    final Map<String, dynamic> b17HqmRequestBodyWze =
        await _b17HqmCreateCommonBodyWza();
    b17HqmRequestBodyWze['threaten'] = b17QxnPointTypeVza.name;
    b17KqmParametersWze?.forEach((String b17PqnKeyVze, dynamic b17KqnValueVxe) {
      b17HqmRequestBodyWze['$b17PqnKeyVze~glory'] = b17KqnValueVxe;
    });
    if (null != b17VqnUserGroupTza) {
      b17HqmRequestBodyWze["bequeath"] = b17VqnUserGroupTza;
    }
    return b17HqmRequestBodyWze;
  }

  Future<bool> _b17PqmPostWithRetryXza({
    required Map<String, dynamic> b17HqmBodyWze,
    required String b17KqmEventTypeWze,
    required String b17VqnEventNameTza,
  }) async {
    final Map<String, dynamic> b17VqnHeadersTza =
        await b17KqnCreateHeadersVxe();
    final String b17PqnRequestUrlVze = await b17VqnCreateUrlTza();

    for (int b17QxnAttemptVza = 1; b17QxnAttemptVza <= 5; b17QxnAttemptVza++) {
      try {
        debugPrint(
          'tba-$b17KqmEventTypeWze-$b17VqnEventNameTza-'
          '请求前-$b17HqmBodyWze-',
        );
        final Response<dynamic> b17KqmResponseWze = await _b17KqmDioClientWze
            .post<dynamic>(
              b17PqnRequestUrlVze,
              data: b17HqmBodyWze,
              options: Options(
                headers: b17VqnHeadersTza,
                contentType: Headers.jsonContentType,
              ),
            );
        final int? b17VqnStatusCodeTza = b17KqmResponseWze.statusCode;
        if (b17VqnStatusCodeTza != null &&
            b17VqnStatusCodeTza >= 200 &&
            b17VqnStatusCodeTza < 300) {
          debugPrint(
            'tba-$b17KqmEventTypeWze-$b17VqnEventNameTza-'
            '请求结果-true-$b17HqmBodyWze-${b17KqmResponseWze.data}',
          );
          return true;
        }
        debugPrint(
          'tba-$b17KqmEventTypeWze-$b17VqnEventNameTza-'
          '请求结果-false-$b17HqmBodyWze-${b17KqmResponseWze.data}',
        );
      } catch (b17PqnRequestErrorVze) {
        debugPrint(
          'tba-$b17KqmEventTypeWze-$b17VqnEventNameTza-'
          '请求结果-false-$b17HqmBodyWze-$b17PqnRequestErrorVze',
        );
      }

      if (b17QxnAttemptVza < 5) {
        await Future<void>.delayed(const Duration(seconds: 1));
      }
    }
    return false;
  }

  Future<Map<String, dynamic>> _b17HqmCreateCommonBodyWza() async {
    return <String, dynamic>{
      'harlem': <String, dynamic>{
        'pershing': await FlutterTbaInfoNew.instance.getBundleId(),
        'andersen': await FlutterTbaInfoNew.instance.getAppVersion(),
        'zagging': await FlutterTbaInfoNew.instance.getDistinctId(),
        "prophecy": DateTime.now().millisecondsSinceEpoch,
        "quicken": await FlutterTbaInfoNew.instance.getBrand(),
        "midrange": await FlutterTbaInfoNew.instance.getDeviceModel(),
        "carnal": await FlutterTbaInfoNew.instance.getOsVersion(),
        "decisive": await FlutterTbaInfoNew.instance.getSystemLanguage(),
        "bondage": await FlutterTbaInfoNew.instance.getIdfa(),
        "archae": await FlutterTbaInfoNew.instance.getIdfv(),
        "europa": await FlutterTbaInfoNew.instance.getGaid(),
      },
      'mandamus': <String, dynamic>{
        'span': Platform.isAndroid ? "haggle" : "not",
        "bahama": await FlutterTbaInfoNew.instance.getLogId(),
        "typology": await FlutterTbaInfoNew.instance.getManufacturer(),
        "defector": await FlutterTbaInfoNew.instance.getOperator(),
        "ring": await FlutterTbaInfoNew.instance.getAndroidId(),
        "tipple": await FlutterTbaInfoNew.instance.getOsCountry(),
      },
    };
  }

  Future<Map<String, String>> b17KqnCreateHeadersVxe() async {
    return <String, String>{
      'defector': await FlutterTbaInfoNew.instance.getOperator(),
    };
  }

  Future<String> b17VqnCreateUrlTza() async {
    final String s = await FlutterTbaInfoNew.instance.getSystemLanguage();
    return '${B17FjeDeviceInfoIfj.b17KqmTbaEndpointWze}?decisive=$s';
  }

  addUserGroup(int userGroup) async {
    b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.quad,
      b17KqmParametersWze: {
        "zagging": await FlutterTbaInfoNew.instance.getDistinctId(),
      },
      b17VqnUserGroupTza: {"user_group": userGroup},
    );
  }

  addUserBV(bool b12allNewUserStatePqmvzr) async {
    b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.quad,
      b17KqmParametersWze: {
        "zagging": await FlutterTbaInfoNew.instance.getDistinctId(),
      },
      b17VqnUserGroupTza: {"user_bv": b12allNewUserStatePqmvzr ? 1 : 0},
    );
  }

  Future<void> b17QgrAddLifeTimePjg() async {
    final Map<dynamic, dynamic> referrerMap = await FlutterTbaInfoNew.instance
        .getReferrerMap();
    final dynamic installFirstSeconds = referrerMap["install_first_seconds"];
    final int? b17KqmInstallTimestampWze = int.tryParse('$installFirstSeconds');
    bool b17VqnIsInstalledTodayTza = false;
    if (b17KqmInstallTimestampWze != null && b17KqmInstallTimestampWze > 0) {
      final int b17QxnInstallMillisecondsVza =
          b17KqmInstallTimestampWze < 100000000000
          ? b17KqmInstallTimestampWze * 1000
          : b17KqmInstallTimestampWze;
      final DateTime b17PqnInstallDateVze = DateTime.fromMillisecondsSinceEpoch(
        b17QxnInstallMillisecondsVza,
      );
      final DateTime b17HqmNowWza = DateTime.now();
      b17VqnIsInstalledTodayTza =
          b17PqnInstallDateVze.year == b17HqmNowWza.year &&
          b17PqnInstallDateVze.month == b17HqmNowWza.month &&
          b17PqnInstallDateVze.day == b17HqmNowWza.day;
    }
    b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.quad,
      b17KqmParametersWze: {
        "zagging": await FlutterTbaInfoNew.instance.getDistinctId(),
      },
      b17VqnUserGroupTza: {
        "life_time": b17VqnIsInstalledTodayTza ? "d0" : "d1",
      },
    );
  }
}
