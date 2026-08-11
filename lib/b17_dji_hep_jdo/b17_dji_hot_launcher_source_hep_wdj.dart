enum B17QxnHotLauncherSourceTypeVza { notification, quickAction }

class B17KqmHotLauncherSourceInfoWze {
  const B17KqmHotLauncherSourceInfoWze({
    required this.b17VqnTypeTza,
    this.b17PqnPayloadVze,
    this.b17HqmQuickActionTypeWza,
  });

  final B17QxnHotLauncherSourceTypeVza b17VqnTypeTza;
  final String? b17PqnPayloadVze;
  final String? b17HqmQuickActionTypeWza;
}

class B17DjiHotLauncherSourceHepWdj {
  B17DjiHotLauncherSourceHepWdj._();

  static final B17DjiHotLauncherSourceHepWdj _b17QxmInstanceVza =
      B17DjiHotLauncherSourceHepWdj._();
  static B17DjiHotLauncherSourceHepWdj get instance => _b17QxmInstanceVza;

  B17KqmHotLauncherSourceInfoWze? _b17VqnPendingSourceTza;

  void b17PqnRecordNotificationSourceVze(String b17KqmPayloadWze) {
    _b17VqnPendingSourceTza = B17KqmHotLauncherSourceInfoWze(
      b17VqnTypeTza: B17QxnHotLauncherSourceTypeVza.notification,
      b17PqnPayloadVze: b17KqmPayloadWze,
    );
  }

  void b17HqmRecordQuickActionSourceWza(String b17VqnShortcutTypeTza) {
    _b17VqnPendingSourceTza = B17KqmHotLauncherSourceInfoWze(
      b17VqnTypeTza: B17QxnHotLauncherSourceTypeVza.quickAction,
      b17HqmQuickActionTypeWza: b17VqnShortcutTypeTza,
    );
  }

  B17KqmHotLauncherSourceInfoWze? b17VqnConsumeSourceTza() {
    final B17KqmHotLauncherSourceInfoWze? b17QxnSourceVza =
        _b17VqnPendingSourceTza;
    _b17VqnPendingSourceTza = null;
    return b17QxnSourceVza;
  }

  removeHotLauncherSourceInfo() {
    _b17VqnPendingSourceTza = null;
  }
}
