import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_fje_base_controller_sak.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

class B17DjeRequestAccessPopupControllerIfj extends B17FjeBaseControllerSak {
  final Permission permission;
  B17DjeRequestAccessPopupControllerIfj({required this.permission});

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
