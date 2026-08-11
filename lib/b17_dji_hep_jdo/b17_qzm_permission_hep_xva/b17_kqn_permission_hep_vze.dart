import 'package:b17pdf/b17_fji_dialog_fji/b17_dje_request_permission_dialog_ifj/b17_dje_request_permission_dialog_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fje_applife_hep_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_hep_ifj.dart';
import 'package:permission_handler/permission_handler.dart';

class B17VqmPermissionResultXze {
  final bool b17HqmIsGrantedWza;
  final bool b17PqnIsShowPermissionAdVxe;
  const B17VqmPermissionResultXze({
    required this.b17HqmIsGrantedWza,
    required this.b17PqnIsShowPermissionAdVxe,
  });
}

class B17KqnPermissionHepVze {
  B17KqnPermissionHepVze._();
  static final B17KqnPermissionHepVze instance = B17KqnPermissionHepVze._();

  Future<B17VqmPermissionResultXze> requestPermission({
    required Permission b17QxmPermissionVza,
  }) async {
    if (await b17QxmPermissionVza.isGranted) {
      return const B17VqmPermissionResultXze(
        b17HqmIsGrantedWza: true,
        b17PqnIsShowPermissionAdVxe: false,
      );
    }
    final b17VqnShouldRequestTza =
        await B17FjeRoutersHepIfj.b17CtmShowDialogXqe<bool>(
          b17WvpChildRka: B17DjeRequestPermissionDialogIfj(
            permission: b17QxmPermissionVza,
          ),
        ) ??
        false;
    if (!b17VqnShouldRequestTza) {
      return const B17VqmPermissionResultXze(
        b17HqmIsGrantedWza: false,
        b17PqnIsShowPermissionAdVxe: true,
      );
    }
    B17FjeApplifeHepIfj.instance.b17QxnSuppressNextHotLaunchVza();
    final b17KpnStatusYra = await b17QxmPermissionVza.request();
    return B17VqmPermissionResultXze(
      b17HqmIsGrantedWza: b17KpnStatusYra.isGranted,
      b17PqnIsShowPermissionAdVxe: true,
    );
  }
}
