import 'dart:convert';
import 'dart:io';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fhi_signal_func_ejo/b17_fhi_signal_bean_feo.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fhi_signal_func_ejo/b17_qxm_signal_code_vza.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fhi_signal_func_ejo/b17_fji_signal_func_eji.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fje_device_info_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_notice_func_wdo/b17_jso_notice_func_wko.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fef_cache_func_jei/b17_jdi_referrer_config_wiw.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_jdw_metric_type_ijd.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_dji_analytics_func_wji.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_check_af_new/callback/request_callback.dart';
import 'package:flutter_check_af_new/flutter_check_af_new.dart';
import 'package:flutter_check_af_new/request_af/request_af_callback.dart';
import 'package:flutter_check_af_new/request_cloak/request_cloak_callback.dart';
import 'package:flutter_check_af_new/request_referrer/request_referrer_callback.dart';
import 'package:flutter_pdf_ad_plugins/flutter_pdf_ad_plugins.dart';
import 'package:flutter_pdf_risk_control_plugins/callbacks/flutter_pdf_risk_control_callback.dart';
import 'package:flutter_pdf_risk_control_plugins/flutter_pdf_risk_control_plugins.dart';
import 'package:flutter_pdf_risk_control_plugins/models/flutter_pdf_risk_control_ip_config.dart';
import 'package:flutter_pdf_risk_control_plugins/utils/flutter_pdf_risk_control_tag.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';

class B17QxnUserCheckFuncVza {
  B17QxnUserCheckFuncVza._();
  static final B17QxnUserCheckFuncVza instance = B17QxnUserCheckFuncVza._();

  bool _b17KqmIsEligibleUserWze = false;

  bool get b17VqnIsEligibleUserTza {
    if (kDebugMode) {
      return true;
    }
    return _b17KqmIsEligibleUserWze;
  }

  Future<void> b17HqmInitializeAttributionWza() async {
    b17PqnApplyReferrerConfigVze();
    b17VqnRefreshUserStateTza();
    final String b17QxnDistinctIdVza = await FlutterTbaInfo.instance
        .getDistinctId();
    FlutterCheckAf.instance.init(
      afKey: B17FjeDeviceInfoIfj.b17PqnAppsFlyerKeyVze,
      afAppId: "",
      distinctId: b17QxnDistinctIdVza,
      clockUrl: B17FjeDeviceInfoIfj.b17HqmClockEndpointWza,
      cloakWhiteKey: 'eurasia',
      cloakData: <String, dynamic>{
        'pershing': await FlutterTbaInfo.instance.getBundleId(),
        'span': Platform.isAndroid ? 'haggle' : 'not',
        'andersen': await FlutterTbaInfo.instance.getAppVersion(),
        'zagging': b17QxnDistinctIdVza,
        'prophecy': DateTime.now().millisecondsSinceEpoch,
      },
      requestCallback: RequestCallback(
        requestAfCallback: RequestAfCallback(
          startRequestAf: () {
            B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
              b17QxnPointTypeVza: B17JdwMetricTypeIjd.af_req,
            );
          },
          requestSuccess: (bool b12allIsBKqmvzr, String afStr) {
            B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
              b17QxnPointTypeVza: B17JdwMetricTypeIjd.af_suc,
              b17KqmParametersWze: {
                //adj_user：【0】【1】，对应【黑名单用户】【自然量用户】
                "af_user": b12allIsBKqmvzr ? 1 : 0,
                "af_info": afStr,
              },
            );
            FlutterPdfAdPlugins.instance.updateAdjustAttribution(
              network: afStr,
            );
            b17VqnRefreshUserStateTza();
          },
          firstRequestAfB: () {},
          startAfSuccess: () {
            B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
              b17QxnPointTypeVza: B17JdwMetricTypeIjd.start_af_suc,
            );
          },
          startAfFail: (int code, String msg) {
            B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
              b17QxnPointTypeVza: B17JdwMetricTypeIjd.start_af_fail,
              b17KqmParametersWze: {"code": code, "msg": msg},
            );
          },
        ),
        requestCloakCallback: RequestCloakCallback(
          startRequestCloak: () {
            B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
              b17QxnPointTypeVza: B17JdwMetricTypeIjd.cloak_req,
            );
          },
          requestSuccess: (bool b12allIsWhiteKqmvzr) {
            B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
              b17QxnPointTypeVza: B17JdwMetricTypeIjd.cloak_suc,
              b17KqmParametersWze: {
                //cloak_user：【0】【1】，对应【黑名单用户】【自然量用户】
                "cloak_user": b12allIsWhiteKqmvzr ? 1 : 0,
              },
            );
            b17VqnRefreshUserStateTza();
          },
        ),
        requestReferrerCallback: RequestReferrerCallback(
          startRequestReferrer: () {
            B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
              b17QxnPointTypeVza: B17JdwMetricTypeIjd.referrer_req,
            );
          },
          requestSuccess: (String b12allReferrerVmqxtr) {
            _b17SenUploadReferrerResultJit(b12allReferrerVmqxtr);
            FlutterPdfAdPlugins.instance.updateInstallReferrer(
              referrer: b12allReferrerVmqxtr,
            );
            b17VqnRefreshUserStateTza();
          },
        ),
      ),
    );
  }

  Future<void> b17KqmInitializeRiskControlWze(
    String b17QxnRiskConfigVza,
  ) async {
    FlutterPdfRiskControlPlugins.instance.initPdfRiskControl(
      riskConfigJson: b17QxnRiskConfigVza,
      ipConfig: FlutterPdfRiskControlIpConfig(
        requestUrl: 'https://ip-prod.pdfutilitydocforge.com/api/cduck',
        requestData: <String, String>{
          'abat': await FlutterTbaInfo.instance.getAndroidId(),
        },
        riskResultKey: 'bcat',
        decryptCode: 63,
      ),
      callback: FlutterPdfRiskControlCallback(
        onUploadSessionRisk: (Map<String, int> b12allRiskMapPqmvzr) {},
        onPdfRiskDetected: (FlutterPdfRiskControlTag b12allTagKqmvzr) {
          B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
            b17QxnPointTypeVza: B17JdwMetricTypeIjd.risk_control,
            //type：vpn、root、sim、simulator、googleplay、developer、ip
            b17KqmParametersWze: {"risk_type": b12allTagKqmvzr.name},
          );
          b17VqnRefreshUserStateTza();
        },
      ),
    );
  }

  Future<void> b17PqnApplyReferrerConfigVze() async {
    try {
      final String b17QxnConfigTextVza = await b17KqmLoadReferrerConfigWze();
      final dynamic b17VqnConfigJsonTza = jsonDecode(b17QxnConfigTextVza);
      final dynamic b17HqmReferrerValuesWza = b17VqnConfigJsonTza['ilve'];
      final List<String> b17PqnReferrerListVze = <String>[];
      if (b17HqmReferrerValuesWza is List) {
        for (final dynamic b17QxnValueVza in b17HqmReferrerValuesWza) {
          if (b17QxnValueVza is String) {
            b17PqnReferrerListVze.add(b17QxnValueVza);
          }
        }
      }
      FlutterCheckAf.instance.updateReferrerList(
        b17VqnConfigJsonTza['door'] == 0,
        b17PqnReferrerListVze,
      );
    } catch (_) {}
  }

  Future<String> b17KqmLoadReferrerConfigWze() async {
    final String b17QxnStoredConfigVza =
        B17JdiReferrerConfigWiw.b17VqmReadXpe();
    if (b17QxnStoredConfigVza.isNotEmpty) {
      return b17QxnStoredConfigVza;
    }
    return rootBundle.loadString(
      B17FjeDeviceInfoIfj.b17VqnLocalReferrerConfigTza,
    );
  }

  void b17VqnRefreshUserStateTza() {
    final bool b17QxnCheckResultVza = FlutterCheckAf.instance.checkUser();
    final bool b17KqmHasSavedRiskWze = FlutterPdfRiskControlPlugins.instance
        .hasSavedPdfRisk();
    if (kDebugMode) {
      debugPrint(
        'refresh_b_user_state checkUser:$b17QxnCheckResultVza '
        'hasSavedPdfRisk:$b17KqmHasSavedRiskWze',
      );
    }
    final bool b12allNewUserStatePqmvzr =
        b17QxnCheckResultVza && !b17KqmHasSavedRiskWze;
    B17DjiAnalyticsFuncWji.instance.addUserBV(b12allNewUserStatePqmvzr);
    if (_b17KqmIsEligibleUserWze == b12allNewUserStatePqmvzr) {
      return;
    }
    _b17KqmIsEligibleUserWze = b12allNewUserStatePqmvzr;
    B17FjiSignalFuncEji.instance.b17JijSendMsgFEio(
      B17FhiSignalBeanFeo(
        b17HfeEventCodeFMie: B17QxmSignalCodeVza.b17PqmRefreshBUserStateVzr,
        b17WjiBoolValuefJiw: b12allNewUserStatePqmvzr,
      ),
    );

    B17PqnNoticeFuncVze.instance.b17QxnInitializeNotificationsVza();
    B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17RqmLoadBPackageAdXza();
  }

  Future<void> _b17SenUploadReferrerResultJit(String referrer) async {
    try {
      final String configText = await b17KqmLoadReferrerConfigWze();
      final dynamic json = jsonDecode(configText);
      final dynamic ilve = json["ilve"];
      if (ilve is List) {
        int referrerUser = 0;
        for (final dynamic value in ilve) {
          if (value is String && referrer.contains(value)) {
            referrerUser = 1;
            break;
          }
        }
        B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
          b17QxnPointTypeVza: B17JdwMetricTypeIjd.reffer_suc,
          b17KqmParametersWze: {
            "reffer_info": referrer,
            "reffer_user": referrerUser,
          },
        );
      } else {
        B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
          b17QxnPointTypeVza: B17JdwMetricTypeIjd.reffer_suc,
          b17KqmParametersWze: {
            "reffer_info": referrer,
            "reffer_user": "list is empty",
          },
        );
      }
    } catch (e) {
      B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
        b17QxnPointTypeVza: B17JdwMetricTypeIjd.reffer_suc,
        b17KqmParametersWze: {"reffer_info": referrer, "reffer_user": "error"},
      );
    }
  }
}
