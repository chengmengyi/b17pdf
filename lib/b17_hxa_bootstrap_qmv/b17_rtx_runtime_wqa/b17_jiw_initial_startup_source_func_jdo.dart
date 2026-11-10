import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';

class B17JiwInitialStartupSourceFuncJdo {
  static final B17JiwInitialStartupSourceFuncJdo _b17JiwlauncherSourceHepJdo =
      B17JiwInitialStartupSourceFuncJdo();
  static B17JiwInitialStartupSourceFuncJdo get instance =>
      _b17JiwlauncherSourceHepJdo;

  String? notificationPayload;
  TimerOverlayClickEvent? b17QxnTimerOverlayClickEventVza;
  String? b17KqmQuickActionTypeWze;

  bool get b17VqnFromTimerOverlayTza => b17QxnTimerOverlayClickEventVza != null;

  void b17QxnRecordQuickActionSourceVza(String b17VqnShortcutTypeTza) {
    b17KqmQuickActionTypeWze = b17VqnShortcutTypeTza;
  }

  void b17VqnClearQuickActionSourceTza() {
    b17KqmQuickActionTypeWze = null;
  }

  Future<void> b17CchInitSourceQrc() async {
    await _b17CklB12allInitNotificationLaunchSourcePqmvzrRep();
    b17QxnTimerOverlayClickEventVza = await FlutterLocalNotificationPlugins
        .instance
        .consumeTimerOverlayClickEvent();
  }

  Future<void> _b17CklB12allInitNotificationLaunchSourcePqmvzrRep() async {
    var localNotificationAppLaunchDetails =
        await FlutterLocalNotificationPlugins.instance
            .getNotificationAppLaunchDetails();
    if (localNotificationAppLaunchDetails.didNotificationLaunchApp == true) {
      notificationPayload =
          localNotificationAppLaunchDetails.notificationResponse?.payload ??
          localNotificationAppLaunchDetails
              .notificationResponse
              ?.payloadType
              ?.name;
    }
  }
}
