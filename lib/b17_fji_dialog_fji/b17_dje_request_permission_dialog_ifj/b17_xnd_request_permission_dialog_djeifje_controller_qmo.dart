import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_hep_ifj.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_fje_root_controller_sak.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

class B17DjeRequestPermissionDialogControllerIfj
    extends B17FjeRootControllerSak {
  final Permission permission;
  B17DjeRequestPermissionDialogControllerIfj({required this.permission});

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
      B17FjeRoutersHepIfj.b17FtyBackNwp<bool>(b17NcgResultKqe: true);

  void b17RlsClickLaterJtt() {
    B17FjeRoutersHepIfj.b17FtyBackNwp<bool>(b17NcgResultKqe: false);
  }
}
