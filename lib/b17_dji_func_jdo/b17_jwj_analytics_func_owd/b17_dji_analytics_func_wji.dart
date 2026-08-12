import 'dart:io';

import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fje_device_info_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fef_cache_func_jei/b17_qxn_upload_install_signal_cache_vza.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_jdw_metric_type_ijd.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pdf_ad_plugins/bean/ad_info_bean.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';

class B17DjiAnalyticsFuncWji {
  B17DjiAnalyticsFuncWji._();

  static final B17DjiAnalyticsFuncWji _b17QxnInstanceVza =
      B17DjiAnalyticsFuncWji._();
  static B17DjiAnalyticsFuncWji get instance => _b17QxnInstanceVza;

  final Dio _b17KqmDioClientWze = Dio();

  Future<void> b17QxnUploadInstallVza() async {
    b17QgrAddLifeTimePjg();
    b17VqnUploadSessionTza();
    if (!B17QxnUploadInstallSignalCacheVza.b17KqmReadEnabledWze()) {
      return;
    }

    final Map<String, dynamic> b17VqnRequestBodyTza =
        await _b17HqmCreateCommonBodyWza();
    final Map<dynamic, dynamic> b17PqnReferrerDataVze = await FlutterTbaInfo
        .instance
        .getReferrerMap();
    b17VqnRequestBodyTza['incant'] = <String, dynamic>{
      'annul': b17PqnReferrerDataVze['build'],
      'gambol': b17PqnReferrerDataVze['referrer_url'],
      'aunt': b17PqnReferrerDataVze['install_version'],
      'iodide': b17PqnReferrerDataVze['user_agent'],
      'mayapple': 'starr',
      'drama': b17PqnReferrerDataVze['referrer_click_timestamp_seconds'],
      'moderate': b17PqnReferrerDataVze['install_begin_timestamp_seconds'],
      'ne': b17PqnReferrerDataVze['referrer_click_timestamp_server_seconds'],
      'cindy': b17PqnReferrerDataVze['install_begin_timestamp_server_seconds'],
      'emerson': b17PqnReferrerDataVze['install_first_seconds'],
      'junctor': b17PqnReferrerDataVze['last_update_seconds'],
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
    b17HqmRequestBodyWza['gorilla'] = <String, dynamic>{};
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
    b17VqnRequestBodyTze['jug'] = <String, dynamic>{
      'amtrak': b17HqmRevenueWza * 1000000,
      'culpable': b17PqnCurrencyVze,
      'cushion': b17KqnAdNetworkVxe,
      'criss': b17QxnAdInfoVza.adPlat ?? '',
      'standard': b17QxnAdInfoVza.adId ?? '',
      'rant': b17VqnPositionIdTza?.name ?? '',
      'sinology': b17KqmAdSceneWze.name,
      'lord': b17PqmPrecisionXza,
      'ideate': b17QxnAdInfoVza.adType,
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
    final Map<String, dynamic> b17HqmRequestBodyWze =
        await _b17HqmCreateCommonBodyWza();
    b17HqmRequestBodyWze['rove'] = b17QxnPointTypeVza.name;
    b17KqmParametersWze?.forEach((String b17PqnKeyVze, dynamic b17KqnValueVxe) {
      b17HqmRequestBodyWze['vaccine~$b17PqnKeyVze'] = b17KqnValueVxe;
    });
    if (null != b17VqnUserGroupTza) {
      b17HqmRequestBodyWze["decouple"] = b17VqnUserGroupTza;
    }
    await _b17PqmPostWithRetryXza(
      b17HqmBodyWze: b17HqmRequestBodyWze,
      b17KqmEventTypeWze: 'point',
      b17VqnEventNameTza: b17QxnPointTypeVza.name,
    );
  }

  Future<Map<String, dynamic>> b17RytGetPushPointBodyFjb() async {
    final Map<String, dynamic> b17HqmRequestBodyWze =
        await _b17HqmCreateCommonBodyWza();
    b17HqmRequestBodyWze['rove'] = B17JdwMetricTypeIjd.push.name;
    b17HqmRequestBodyWze['vaccine~sourse'] = "local";
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
      'weco': <String, dynamic>{
        'baggage': await FlutterTbaInfo.instance.getBundleId(),
        'proper': Platform.isAndroid ? 'hotelman' : 'octoroon',
        'germinal': DateTime.now().millisecondsSinceEpoch,
        'tardy': await FlutterTbaInfo.instance.getNetworkType(),
        'vivaldi': await FlutterTbaInfo.instance.getIdfa(),
      },
      'cannibal': <String, dynamic>{
        'braille': await FlutterTbaInfo.instance.getAppVersion(),
        'fall': await FlutterTbaInfo.instance.getBrand(),
        'awkward': await FlutterTbaInfo.instance.getDeviceModel(),
        'modulus': await FlutterTbaInfo.instance.getOperator(),
        'cornish': await FlutterTbaInfo.instance.getSystemLanguage(),
        'aurelius': await FlutterTbaInfo.instance.getAndroidId(),
      },
      'yew': <String, dynamic>{
        'secular': await FlutterTbaInfo.instance.getDistinctId(),
        'sorority': await FlutterTbaInfo.instance.getLogId(),
        'moreover': await FlutterTbaInfo.instance.getManufacturer(),
        'gao': await FlutterTbaInfo.instance.getOsVersion(),
        'ogre': await FlutterTbaInfo.instance.getIdfv(),
        'dana': await FlutterTbaInfo.instance.getGaid(),
        'anderson': await FlutterTbaInfo.instance.getOsCountry(),
      },
    };
  }

  Future<Map<String, String>> b17KqnCreateHeadersVxe() async {
    return <String, String>{
      'ogre': await FlutterTbaInfo.instance.getIdfv(),
      'baggage': await FlutterTbaInfo.instance.getBundleId(),
    };
  }

  Future<String> b17VqnCreateUrlTza() async {
    final String b17QxnBundleIdVza = await FlutterTbaInfo.instance
        .getBundleId();
    final String b17KqmBrandWze = await FlutterTbaInfo.instance.getBrand();
    return '${B17FjeDeviceInfoIfj.b17KqmTbaEndpointWze}?baggage=$b17QxnBundleIdVza&fall=$b17KqmBrandWze';
  }

  addUserGroup(int userGroup) async {
    b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.alterate,
      b17KqmParametersWze: {
        "secular": await FlutterTbaInfo.instance.getDistinctId(),
      },
      b17VqnUserGroupTza: {"user_group": userGroup},
    );
  }

  addUserBV(bool b12allNewUserStatePqmvzr) async {
    b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.alterate,
      b17KqmParametersWze: {
        "secular": await FlutterTbaInfo.instance.getDistinctId(),
      },
      b17VqnUserGroupTza: {"user_bv": b12allNewUserStatePqmvzr ? 1 : 0},
    );
  }

  Future<void> b17QgrAddLifeTimePjg() async {
    final Map<dynamic, dynamic> referrerMap = await FlutterTbaInfo.instance
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
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.alterate,
      b17KqmParametersWze: {
        "secular": await FlutterTbaInfo.instance.getDistinctId(),
      },
      b17VqnUserGroupTza: {
        "life_time": b17VqnIsInstalledTodayTza ? "d0" : "d1",
      },
    );
  }
}
