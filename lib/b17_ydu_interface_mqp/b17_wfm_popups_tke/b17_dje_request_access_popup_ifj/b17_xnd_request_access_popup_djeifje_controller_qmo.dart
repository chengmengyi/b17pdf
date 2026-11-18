import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_dji_analytics_func_wji.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_jdw_metric_type_ijd.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_fje_base_controller_sak.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

class B17DjeRequestAccessPopupControllerIfj extends B17FjeBaseControllerSak {
  final Permission permission;
  B17DjeRequestAccessPopupControllerIfj({required this.permission});

  @override
  void onInit() {
    super.onInit();
    if (permission == Permission.storage || permission == Permission.manageExternalStorage) {
      B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
        b17QxnPointTypeVza: B17JdwMetricTypeIjd.storage_auth_view,
      );
    }
  }

  String b17PnmPermissionMessageMfk() {
    if (permission == Permission.storage ||
        permission == Permission.manageExternalStorage) {
      return 'Please allow storage access to continue.'.tr;
    }
    if (permission == Permission.camera) {
      return 'Please allow camera access to continue.'.tr;
    }
    return 'Please allow access to continue.'.tr;
  }

  void b17LiaClickAllowKev() =>
      B17FjeNavigationFuncIfj.b17FtyBackNwp<bool>(b17NcgResultKqe: true);

  void b17RlsClickLaterJtt() {
    B17FjeNavigationFuncIfj.b17FtyBackNwp<bool>(b17NcgResultKqe: false);
  }
}
