import 'package:flutter_boom_notification_plugins/flutter_boom_notification_plugins.dart';

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

  Future<void> b17CchInitSourceQrc() async {
    await _b17CklB12allInitNotificationLaunchSourcePqmvzrRep();
    b17QxnTimerOverlayClickEventVza = await FlutterBoomNotificationPlugins
        .instance
        .consumeTimerOverlayClickEvent();
  }

  Future<void> _b17CklB12allInitNotificationLaunchSourcePqmvzrRep() async {
    var localNotificationAppLaunchDetails = await FlutterBoomNotificationPlugins
        .instance
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
