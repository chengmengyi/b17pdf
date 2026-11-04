import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fje_cache_name_oif.dart';

abstract final class B17QxnGuideCompletedCacheVza {
  static bool b17KqmReadCompletedWze() {
    return b17LpzGetStorageRau.read<bool>(
          B17FjeCacheNameOif.b17QxnGuideCompletedVza,
        ) ??
        false;
  }

  static Future<void> b17VqnSaveCompletedTza(bool b17QxnCompletedVza) {
    return b17LpzGetStorageRau.write(
      B17FjeCacheNameOif.b17QxnGuideCompletedVza,
      b17QxnCompletedVza,
    );
  }
}
