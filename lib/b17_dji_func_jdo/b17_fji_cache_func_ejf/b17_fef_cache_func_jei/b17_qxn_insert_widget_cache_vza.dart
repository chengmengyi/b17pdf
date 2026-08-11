import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fje_cache_name_oif.dart';

abstract final class B17QxnInsertWidgetCacheVza {
  static bool b17KqmReadAddedWze() {
    return b17LpzGetStorageRau.read<bool>(
          B17FjeCacheNameOif.b17QxnAddWidgetVza,
        ) ??
        false;
  }

  static Future<void> b17VqnSaveAddedTza(bool b17HqmAddedWza) {
    return b17LpzGetStorageRau.write(
      B17FjeCacheNameOif.b17QxnAddWidgetVza,
      b17HqmAddedWza,
    );
  }
}
