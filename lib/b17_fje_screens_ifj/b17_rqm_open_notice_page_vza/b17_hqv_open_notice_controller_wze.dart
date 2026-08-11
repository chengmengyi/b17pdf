import 'package:b17pdf/b17_dji_func_jdo/b17_jfi_first_user_func_ejf.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fhi_signal_func_ejo/b17_fhi_signal_bean_feo.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fhi_signal_func_ejo/b17_qxm_signal_code_vza.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_jdw_metric_type_ijd.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_dji_analytics_func_wji.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_fje_base_controller_sak.dart';
import 'package:app_settings/app_settings.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class B17HqvOpenNoticeControllerWze extends B17FjeBaseControllerSak {
  bool _b17QxnWaitingSettingsVza = false;
  bool _b17KqmEnteredBackgroundWze = false;
  bool _b17VqnCheckingPermissionTza = false;

  @override
  void onInit() {
    super.onInit();
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.push_guide_view,
      b17KqmParametersWze: {"show_type": "secondary"},
    );
  }

  Future<void> b17HgrClickUpdateCla() async {
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.push_guide_click,
      b17KqmParametersWze: {"state": "turn_on"},
    );
    _b17QxnWaitingSettingsVza = true;
    _b17KqmEnteredBackgroundWze = false;
    await AppSettings.openAppSettings(type: AppSettingsType.notification);
  }

  void b17RlsClickLaterJtt() {
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.push_guide_click,
      b17KqmParametersWze: {"state": "later"},
    );
    _toNextPage();
  }

  @override
  bool b17FeiRegisterEventJif() => true;

  @override
  void b17RifHandleEventhJei(B17FhiSignalBeanFeo b17QzmEventXva) {
    if (b17QzmEventXva.b17HfeEventCodeFMie !=
            B17QxmSignalCodeVza.b17KqmAppLifecycleWze ||
        !_b17QxnWaitingSettingsVza) {
      return;
    }

    if (b17QzmEventXva.b17DjiIntValueJie == 1) {
      _b17KqmEnteredBackgroundWze = true;
      return;
    }

    if (b17QzmEventXva.b17DjiIntValueJie == 0 &&
        _b17KqmEnteredBackgroundWze &&
        !_b17VqnCheckingPermissionTza) {
      _b17HqmCheckNotificationPermissionWza();
    }
  }

  Future<void> _b17HqmCheckNotificationPermissionWza() async {
    _b17VqnCheckingPermissionTza = true;
    await Future<void>.delayed(const Duration(milliseconds: 200));
    final PermissionStatus b17PqnPermissionStatusVze =
        await Permission.notification.status;
    final bool b17KqnPermissionGrantedVxe =
        b17PqnPermissionStatusVze.isGranted ||
        b17PqnPermissionStatusVze.isLimited;

    _b17QxnWaitingSettingsVza = false;
    _b17KqmEnteredBackgroundWze = false;
    _b17VqnCheckingPermissionTza = false;
    if (b17KqnPermissionGrantedVxe) {
      _toNextPage();
    }
  }

  _toNextPage() {
    var fromHome =
        B17FjeNavigationFuncIfj.b17NtbGetParamsYpi()["fromHome"] ?? false;
    if (fromHome) {
      B17FjeNavigationFuncIfj.b17FtyBackNwp();
    } else {
      B17JfiFirstUserFuncEjf.instance.toHome();
    }
  }
}
