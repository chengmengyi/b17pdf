enum B17QxnActiveStartupSourceTypeVza { notification, quickAction }

class B17KqmActiveStartupSourceInfoWze {
  const B17KqmActiveStartupSourceInfoWze({
    required this.b17VqnTypeTza,
    this.b17PqnPayloadVze,
    this.b17HqmQuickActionTypeWza,
  });

  final B17QxnActiveStartupSourceTypeVza b17VqnTypeTza;
  final String? b17PqnPayloadVze;
  final String? b17HqmQuickActionTypeWza;
}

class B17DjiActiveStartupSourceFuncWdj {
  B17DjiActiveStartupSourceFuncWdj._();

  static final B17DjiActiveStartupSourceFuncWdj _b17QxmInstanceVza =
      B17DjiActiveStartupSourceFuncWdj._();
  static B17DjiActiveStartupSourceFuncWdj get instance => _b17QxmInstanceVza;

  B17KqmActiveStartupSourceInfoWze? _b17VqnPendingSourceTza;

  void b17PqnRecordNotificationSourceVze(String b17KqmPayloadWze) {
    _b17VqnPendingSourceTza = B17KqmActiveStartupSourceInfoWze(
      b17VqnTypeTza: B17QxnActiveStartupSourceTypeVza.notification,
      b17PqnPayloadVze: b17KqmPayloadWze,
    );
  }

  void b17HqmRecordQuickActionSourceWza(String b17VqnShortcutTypeTza) {
    _b17VqnPendingSourceTza = B17KqmActiveStartupSourceInfoWze(
      b17VqnTypeTza: B17QxnActiveStartupSourceTypeVza.quickAction,
      b17HqmQuickActionTypeWza: b17VqnShortcutTypeTza,
    );
  }

  B17KqmActiveStartupSourceInfoWze? b17VqnConsumeSourceTza() {
    final B17KqmActiveStartupSourceInfoWze? b17QxnSourceVza =
        _b17VqnPendingSourceTza;
    _b17VqnPendingSourceTza = null;
    return b17QxnSourceVza;
  }

  void b17KqmClearQuickActionSourceWze() {
    if (_b17VqnPendingSourceTza?.b17VqnTypeTza ==
        B17QxnActiveStartupSourceTypeVza.quickAction) {
      _b17VqnPendingSourceTza = null;
    }
  }

  void removeHotLauncherSourceInfo() {
    _b17VqnPendingSourceTza = null;
  }
}
