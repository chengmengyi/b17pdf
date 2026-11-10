import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fje_cache_name_oif.dart';

abstract final class B17MediaUniqueConfigCacheWza {
  static int b17KqmReadConfigWze() {
    return b17LpzGetStorageRau.read<int>(
          B17FjeCacheNameOif.b17ObfMediaUniqueConfigIri,
        ) ??
        1;
  }

  static Future<void> b17VqnSaveConfigTza(int b17QxnConfigVza) {
    return b17LpzGetStorageRau.write(
      B17FjeCacheNameOif.b17ObfMediaUniqueConfigIri,
      b17QxnConfigVza,
    );
  }
}
