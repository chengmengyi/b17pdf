import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';

class B17JiwColdLauncherSourceHepJdo {
  static final B17JiwColdLauncherSourceHepJdo _b17JiwlauncherSourceHepJdo =
      B17JiwColdLauncherSourceHepJdo();
  static B17JiwColdLauncherSourceHepJdo get instance =>
      _b17JiwlauncherSourceHepJdo;

  String? notificationPayload;
  String? b17KqmQuickActionTypeWze;

  void b17QxnRecordQuickActionSourceVza(String b17VqnShortcutTypeTza) {
    b17KqmQuickActionTypeWze = b17VqnShortcutTypeTza;
  }

  Future<void> b17CchInitSourceQrc() async {
    await _b17CklB12allInitNotificationLaunchSourcePqmvzrRep();
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
