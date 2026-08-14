import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fje_cache_name_oif.dart';

abstract final class B17VqnAdSwitchCacheTza {
  static String b17KqmReadConfigWze() {
    return b17LpzGetStorageRau.read<String>(
          B17FjeCacheNameOif.b17PqnAdSwitchVze,
        ) ??
        '';
  }

  static Future<void> b17HqmSaveConfigWza(String b17QxnConfigVza) {
    return b17LpzGetStorageRau.write(
      B17FjeCacheNameOif.b17PqnAdSwitchVze,
      b17QxnConfigVza,
    );
  }
}
