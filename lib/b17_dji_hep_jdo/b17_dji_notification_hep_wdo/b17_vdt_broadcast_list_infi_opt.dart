import 'dart:convert';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fji_storage_hep_ejf/b17_fef_storage_hep_jei/b17_fji_notification_time_efj.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';

class B17VqnBroadcastConfigHepTza {
  const B17VqnBroadcastConfigHepTza._();

  static List<BroadcastNotificationConfig> b17KqmBuildConfigsWze() {
    int b17QxnActionIntervalVza = 30;
    int b17VqnBatteryIntervalTza = 600;
    try {
      final String b17QxnConfigTextVza =
          B17FjiNotificationTimeEfj.b17VqmReadXpe();
      final dynamic b17KqmConfigJsonWze = jsonDecode(b17QxnConfigTextVza);
      final int b17VqnActionSecondsTza =
          b17KqmConfigJsonWze['action_interval'] as int;
      if (b17VqnActionSecondsTza > 0) {
        b17QxnActionIntervalVza = b17VqnActionSecondsTza;
      }
      final int b17PqnBatterySecondsVze =
          b17KqmConfigJsonWze['battery_changed'] as int;
      if (b17PqnBatterySecondsVze > 0) {
        b17VqnBatteryIntervalTza = b17PqnBatterySecondsVze;
      }
    } catch (_) {}
    return <BroadcastNotificationConfig>[
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.userPresent,
        interval: Duration(seconds: 1),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.actionPowerConnected,
        interval: Duration(seconds: b17QxnActionIntervalVza),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.actionPowerDisconnected,
        interval: Duration(seconds: b17QxnActionIntervalVza),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.batteryChanged,
        interval: Duration(seconds: b17VqnBatteryIntervalTza),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.screenOn,
        interval: Duration(seconds: b17QxnActionIntervalVza),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.screenOff,
        interval: Duration(seconds: b17QxnActionIntervalVza),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.packageAdded,
        interval: Duration(seconds: b17QxnActionIntervalVza),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.packageRemoved,
        interval: Duration(seconds: b17QxnActionIntervalVza),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.packageReplaced,
        interval: Duration(seconds: b17QxnActionIntervalVza),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.closeSystemDialogs,
        interval: Duration(seconds: b17QxnActionIntervalVza),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.configurationChanged,
        interval: Duration(seconds: b17QxnActionIntervalVza),
      ),
    ];
  }
}
