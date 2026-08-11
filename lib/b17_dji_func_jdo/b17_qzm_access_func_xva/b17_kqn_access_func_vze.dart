import 'package:b17pdf/b17_fji_popup_fji/b17_dje_request_access_popup_ifj/b17_dje_request_access_popup_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fje_applife_func_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:permission_handler/permission_handler.dart';

class B17VqmAccessOutputXze {
  final bool b17HqmIsGrantedWza;
  final bool b17PqnIsShowPermissionAdVxe;
  const B17VqmAccessOutputXze({
    required this.b17HqmIsGrantedWza,
    required this.b17PqnIsShowPermissionAdVxe,
  });
}

class B17KqnAccessFuncVze {
  B17KqnAccessFuncVze._();
  static final B17KqnAccessFuncVze instance = B17KqnAccessFuncVze._();

  Future<B17VqmAccessOutputXze> requestPermission({
    required Permission b17QxmPermissionVza,
  }) async {
    if (await b17QxmPermissionVza.isGranted) {
      return const B17VqmAccessOutputXze(
        b17HqmIsGrantedWza: true,
        b17PqnIsShowPermissionAdVxe: false,
      );
    }
    final b17VqnShouldRequestTza =
        await B17FjeNavigationFuncIfj.b17CtmShowDialogXqe<bool>(
          b17WvpChildRka: B17DjeRequestAccessPopupIfj(
            permission: b17QxmPermissionVza,
          ),
        ) ??
        false;
    if (!b17VqnShouldRequestTza) {
      return const B17VqmAccessOutputXze(
        b17HqmIsGrantedWza: false,
        b17PqnIsShowPermissionAdVxe: true,
      );
    }
    B17FjeApplifeFuncIfj.instance.b17QxnSuppressNextHotLaunchVza();
    final b17KpnStatusYra = await b17QxmPermissionVza.request();
    return B17VqmAccessOutputXze(
      b17HqmIsGrantedWza: b17KpnStatusYra.isGranted,
      b17PqnIsShowPermissionAdVxe: true,
    );
  }
}
