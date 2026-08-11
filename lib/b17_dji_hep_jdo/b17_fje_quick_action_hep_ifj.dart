import 'dart:async';

import 'package:b17pdf/b17_dji_hep_jdo/b17_fje_language_hep_ifj/b17_kqm_language_hep_vza.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jiw_cold_launcher_source_hep_jdo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_hot_launcher_source_hep_wdj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_address_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_hep_ifj.dart';
import 'package:flutter_add_widget_plugins/flutter_add_widget_plugins.dart';

class B17FjeQuickActionHepIfj {
  static final B17FjeQuickActionHepIfj _actionHepFjeifjiw =
      B17FjeQuickActionHepIfj();
  static B17FjeQuickActionHepIfj get instance => _actionHepFjeifjiw;

  static const String b17QxnUninstallTypeVza = 'uninstall';

  final QuickActions _quickActions = const QuickActions();
  Future<void>? _b17KqmInitializeFutureWze;
  String? _b17VqnPendingTypeTza;
  bool _b17QxnInitializedVza = false;
  bool _b17HqmLauncherFinishedWza = false;

  Future<void> init() {
    _b17KqmInitializeFutureWze ??= _b17PqnInitializeInternalVze();
    return _b17KqmInitializeFutureWze!;
  }

  Future<void> _b17PqnInitializeInternalVze() async {
    if (_b17QxnInitializedVza) {
      return;
    }
    _b17QxnInitializedVza = true;
    await _quickActions.initialize((String b17KqnShortcutTypeVxe) {
      if (!_b17HqmLauncherFinishedWza) {
        _b17VqnPendingTypeTza = b17KqnShortcutTypeVxe;
        B17JiwColdLauncherSourceHepJdo.instance
            .b17QxnRecordQuickActionSourceVza(b17KqnShortcutTypeVxe);
        return;
      }
      B17DjiHotLauncherSourceHepWdj.instance.b17HqmRecordQuickActionSourceWza(
        b17KqnShortcutTypeVxe,
      );
      unawaited(
        _b17HqmHandleShortcutWza(
          b17KqnShortcutTypeVxe,
          b17PqmFromColdStartXza: false,
        ),
      );
    });
    await b17ModSetShortcutItemsTqy();
  }

  Future<bool> b17VqnConsumeColdStartActionTza() async {
    await init();
    _b17HqmLauncherFinishedWza = true;
    final String? b17QxnShortcutTypeVza = _b17VqnPendingTypeTza;
    _b17VqnPendingTypeTza = null;
    if (b17QxnShortcutTypeVza == null || b17QxnShortcutTypeVza.isEmpty) {
      return false;
    }
    return _b17HqmHandleShortcutWza(
      b17QxnShortcutTypeVza,
      b17PqmFromColdStartXza: true,
    );
  }

  Future<bool> _b17HqmHandleShortcutWza(
    String b17PqnShortcutTypeVze, {
    required bool b17PqmFromColdStartXza,
  }) async {
    if (b17PqnShortcutTypeVze != b17QxnUninstallTypeVza) {
      return false;
    }
    if (b17PqmFromColdStartXza) {
      B17JiwColdLauncherSourceHepJdo.instance.b17QxnRecordQuickActionSourceVza(
        b17PqnShortcutTypeVze,
      );
      await B17FjeRoutersHepIfj.b17ZxpReplaceNamedLrt(
        b17YweRouteNameQpn: B17FjeRoutersAddressIfj.b17KqmUnstallRouteWze,
      );
    } else {
      await B17FjeRoutersHepIfj.b17HkqPushNamedVpa(
        b17McfRouteNameZsq: B17FjeRoutersAddressIfj.b17KqmUnstallRouteWze,
      );
    }
    return true;
  }

  Future<void> b17ModSetShortcutItemsTqy() async {
    final b17QxmLocaleVza =
        B17KqmLanguageHepVza.b17RmqResolveInitialLocaleXve();
    final b17VqnLocaleKeyTza = b17QxmLocaleVza.toString();
    final b17HqmUninstallTitleWza =
        B17KqmLanguageHepVza().keys[b17VqnLocaleKeyTza]?['Uninstall'] ??
        'Uninstall';
    await _quickActions.setShortcutItems(<ShortcutItem>[
      ShortcutItem(
        type: b17QxnUninstallTypeVza,
        localizedTitle: b17HqmUninstallTitleWza,
        icon: "b17_fji_uninstall_icon_eoj",
      ),
    ]);
  }
}
