import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fje_cache_name_oif.dart';

abstract final class B17AppExitCacheWza {
  static int b17KqmReadTimeWze() {
    return b17LpzGetStorageRau.read<int>(B17FjeCacheNameOif.b17AppExit) ?? 60;
  }

  static Future<void> b17VqnSaveTimeTza(int b17QxnSecondsVza) {
    return b17LpzGetStorageRau.write(
      B17FjeCacheNameOif.b17AppExit,
      b17QxnSecondsVza,
    );
  }
}
