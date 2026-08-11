import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fje_cache_name_oif.dart';

abstract final class B17QxnUploadInstallSignalCacheVza {
  static bool b17KqmReadEnabledWze() {
    return b17LpzGetStorageRau.read<bool>(
          B17FjeCacheNameOif.b17QxnUploadInstallEventVza,
        ) ??
        true;
  }

  static Future<void> b17VqnSaveEnabledTza(bool b17HqmEnabledWza) {
    return b17LpzGetStorageRau.write(
      B17FjeCacheNameOif.b17QxnUploadInstallEventVza,
      b17HqmEnabledWza,
    );
  }
}
