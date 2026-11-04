import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fje_cache_name_oif.dart';

abstract final class B17QxnOverlayPermissionOpenDateCacheVza {
  static String b17KqmReadDateWze() {
    return b17LpzGetStorageRau.read<String>(
          B17FjeCacheNameOif.b17QxnOverlayPermissionOpenDateVza,
        ) ??
        '';
  }

  static Future<void> b17VqnSaveDateTza(String b17QxnDateVza) {
    return b17LpzGetStorageRau.write(
      B17FjeCacheNameOif.b17QxnOverlayPermissionOpenDateVza,
      b17QxnDateVza,
    );
  }
}
