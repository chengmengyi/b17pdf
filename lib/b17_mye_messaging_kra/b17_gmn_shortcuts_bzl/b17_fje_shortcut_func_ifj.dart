import 'dart:async';

import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fje_localization_ifj/b17_kqm_locale_func_vza.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_jiw_initial_startup_source_func_jdo.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_dji_active_startup_source_func_wdj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_address_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:flutter_add_widget_plugins/flutter_add_widget_plugins.dart';

class B17FjeShortcutFuncIfj {
  static final B17FjeShortcutFuncIfj _actionHepFjeifjiw =
      B17FjeShortcutFuncIfj();
  static B17FjeShortcutFuncIfj get instance => _actionHepFjeifjiw;

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
        B17JiwInitialStartupSourceFuncJdo.instance
            .b17QxnRecordQuickActionSourceVza(b17KqnShortcutTypeVxe);
        return;
      }
      B17DjiActiveStartupSourceFuncWdj.instance
          .b17HqmRecordQuickActionSourceWza(b17KqnShortcutTypeVxe);
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
      B17JiwInitialStartupSourceFuncJdo.instance
          .b17QxnRecordQuickActionSourceVza(b17PqnShortcutTypeVze);
      await B17FjeNavigationFuncIfj.b17ZxpReplaceNamedLrt(
        b17YweRouteNameQpn: B17FjeNavigationAddressIfj.b17KqmUnstallRouteWze,
      );
    } else {
      await B17FjeNavigationFuncIfj.b17HkqPushNamedVpa(
        b17McfRouteNameZsq: B17FjeNavigationAddressIfj.b17KqmUnstallRouteWze,
      );
    }
    return true;
  }

  Future<void> b17ModSetShortcutItemsTqy() async {
    final b17QxmLocaleVza = B17KqmLocaleFuncVza.b17RmqResolveInitialLocaleXve();
    final b17VqnLocaleKeyTza = b17QxmLocaleVza.toString();
    final b17HqmUninstallTitleWza =
        B17KqmLocaleFuncVza().keys[b17VqnLocaleKeyTza]?['Uninstall'] ??
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
