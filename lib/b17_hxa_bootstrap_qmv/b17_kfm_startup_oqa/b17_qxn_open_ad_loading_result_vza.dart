import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_ynx_ad_scene_ige.dart';

enum B17QxnOpenAdLoadingStatusVza { b17VqnCacheReadyTza, b17KqmCancelledWze }

class B17QxnOpenAdLoadingResultVza {
  const B17QxnOpenAdLoadingResultVza.ready({
    required this.b17QxnSessionIdVza,
    required this.b17KqmAdSceneWze,
    required this.b17VqnAdPosIdTza,
  }) : b17PqnStatusVze = B17QxnOpenAdLoadingStatusVza.b17VqnCacheReadyTza,
       b17HqmReasonWza = 'cache_ready';

  const B17QxnOpenAdLoadingResultVza.cancelled({
    required this.b17QxnSessionIdVza,
    required this.b17HqmReasonWza,
    this.b17KqmAdSceneWze,
    this.b17VqnAdPosIdTza,
  }) : b17PqnStatusVze = B17QxnOpenAdLoadingStatusVza.b17KqmCancelledWze;

  final int b17QxnSessionIdVza;
  final B17QxnOpenAdLoadingStatusVza b17PqnStatusVze;
  final B17EipAdSceneUkg? b17KqmAdSceneWze;
  final B17JkwPosidKos? b17VqnAdPosIdTza;
  final String b17HqmReasonWza;

  bool get b17VqnCacheReadyTza =>
      b17PqnStatusVze == B17QxnOpenAdLoadingStatusVza.b17VqnCacheReadyTza;
}
