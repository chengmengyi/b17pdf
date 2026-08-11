import 'dart:async';

import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jiw_ad_hep_djo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fhi_event_hep_ejo/b17_fhi_event_bean_feo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fhi_event_hep_ejo/b17_qxm_event_code_vza.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fhi_event_hep_ejo/b17_fji_event_hep_eji.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_hot_launcher_source_hep_wdj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_notification_hep_wdo/b17_jso_notification_hep_wko.dart';
import 'package:flutter_app_lifecycle/app_state_observer.dart';
import 'package:flutter_app_lifecycle/flutter_app_lifecycle.dart';
import 'package:flutter_pdf_ad_plugins/flutter_pdf_ad_plugins.dart';

class B17FjeApplifeHepIfj {
  B17FjeApplifeHepIfj._();

  static final B17FjeApplifeHepIfj instance = B17FjeApplifeHepIfj._();
  bool b17HqmObserverStartedXwe = false, _b17StaAppIsBackTus = false;
  bool _b17QxnSuppressNextHotLaunchVza = false;

  bool get b17QxnShouldSuppressClickHotLaunchVza => _b17StaAppIsBackTus;

  void b17QxnSuppressNextHotLaunchVza() {
    _b17QxnSuppressNextHotLaunchVza = true;
    _b17StaAppIsBackTus = false;
  }

  bool _b17QxnConsumeSuppressedHotLaunchVza() {
    if (!_b17QxnSuppressNextHotLaunchVza) {
      return false;
    }
    _b17QxnSuppressNextHotLaunchVza = false;
    _b17StaAppIsBackTus = false;
    B17DjiHotLauncherSourceHepWdj.instance.removeHotLauncherSourceInfo();
    return true;
  }

  void b17KpvStartObserverNza() {
    if (b17HqmObserverStartedXwe) {
      return;
    }
    b17HqmObserverStartedXwe = true;
    FlutterAppLifecycle.instance.setCallObserver(
      AppStateObserver(
        call: (bool b17VqmInBackgroundWxe) {
          B17FjiEventHepEji.instance.b17JijSendMsgFEio(
            B17FhiEventBeanFeo(
              b17HfeEventCodeFMie: B17QxmEventCodeVza.b17KqmAppLifecycleWze,
              b17DjiIntValueJie: b17VqmInBackgroundWxe ? 1 : 0,
            ),
          );
          if (b17VqmInBackgroundWxe) {
            _b17NplAppBackIkd();
          } else {
            unawaited(_b17WchAppFrontYze());
          }
        },
      ),
    );
  }

  void _b17NplAppBackIkd() {
    _b17StaAppIsBackTus = true;
  }

  Future<void> _b17WchAppFrontYze() async {
    unawaited(
      B17PqnNotificationHepVze.instance
          .b17TqnUploadPendingNotificationEventsVze(),
    );
    if (!_b17StaAppIsBackTus && !_b17QxnSuppressNextHotLaunchVza) {
      return;
    }
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (_b17QxnConsumeSuppressedHotLaunchVza()) {
      return;
    }
    if (!_b17StaAppIsBackTus) {
      return;
    }
    _b17StaAppIsBackTus = false;
    final B17KqmHotLauncherSourceInfoWze? b17PqnSourceVze =
        B17DjiHotLauncherSourceHepWdj.instance.b17VqnConsumeSourceTza();
    if (b17PqnSourceVze == null) {
      b17YyxShowAdTwt(B17EipAdSceneUkg.pr_launch, B17JkwPosidKos.pr_open_hot);
      return;
    }
    switch (b17PqnSourceVze.b17VqnTypeTza) {
      case B17QxnHotLauncherSourceTypeVza.notification:
        return;
      case B17QxnHotLauncherSourceTypeVza.quickAction:
        b17YyxShowAdTwt(B17EipAdSceneUkg.pr_exit, B17JkwPosidKos.unload_1);
    }
  }

  Future<void> b17YyxShowAdTwt(
    B17EipAdSceneUkg b17QxnAdSceneVza,
    B17JkwPosidKos b17VqnPositionIdTza,
  ) async {
    await FlutterPdfAdPlugins.instance.closeFullScreenAdAndWait();
    B17JiwAdHepDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
      b17PqmAdSceneVzr: b17QxnAdSceneVza,
      b17KqmAdPosIdVzr: b17VqnPositionIdTza,
    );
  }
}
