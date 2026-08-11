import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_jkw_posid_kos.dart';

class B17QxnStartupClickGateFuncVza {
  B17QxnStartupClickGateFuncVza._();

  static final B17QxnStartupClickGateFuncVza instance =
      B17QxnStartupClickGateFuncVza._();

  bool _b17KqmLauncherAliveWze = true;
  bool _b17VqnLauncherAdShownTza = false;
  B17EipAdSceneUkg? _b17PqnPendingAdSceneVze;
  B17JkwPosidKos? _b17HqmPendingAdPosIdWza;

  bool get b17KqnCanHandleNotificationClickVxe =>
      !_b17KqmLauncherAliveWze || _b17VqnLauncherAdShownTza;

  void b17QxnMarkLauncherStartedVza() {
    _b17KqmLauncherAliveWze = true;
    _b17VqnLauncherAdShownTza = false;
    _b17RqmClearPendingAdWza();
  }

  void b17VqnMarkLauncherAdWaitingTza({
    required B17EipAdSceneUkg b17PqnAdSceneVze,
    required B17JkwPosidKos b17KqmAdPosIdWze,
  }) {
    _b17VqnLauncherAdShownTza = false;
    _b17PqnPendingAdSceneVze = b17PqnAdSceneVze;
    _b17HqmPendingAdPosIdWza = b17KqmAdPosIdWze;
  }

  void b17HqmMarkLauncherAdShownIfMatchedWza({
    required B17EipAdSceneUkg b17PqnAdSceneVze,
    required B17JkwPosidKos b17KqmAdPosIdWze,
  }) {
    if (!_b17KqmLauncherAliveWze ||
        _b17PqnPendingAdSceneVze != b17PqnAdSceneVze ||
        _b17HqmPendingAdPosIdWza != b17KqmAdPosIdWze) {
      return;
    }
    _b17VqnLauncherAdShownTza = true;
    _b17RqmClearPendingAdWza();
  }

  void b17PqnMarkLauncherAdNotShownVze() {
    _b17VqnLauncherAdShownTza = false;
    _b17RqmClearPendingAdWza();
  }

  void b17KqmMarkLauncherClosedWze() {
    _b17KqmLauncherAliveWze = false;
    _b17RqmClearPendingAdWza();
  }

  void _b17RqmClearPendingAdWza() {
    _b17PqnPendingAdSceneVze = null;
    _b17HqmPendingAdPosIdWza = null;
  }
}
