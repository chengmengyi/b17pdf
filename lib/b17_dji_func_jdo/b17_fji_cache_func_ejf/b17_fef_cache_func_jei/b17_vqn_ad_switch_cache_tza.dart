import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fje_cache_name_oif.dart';

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
