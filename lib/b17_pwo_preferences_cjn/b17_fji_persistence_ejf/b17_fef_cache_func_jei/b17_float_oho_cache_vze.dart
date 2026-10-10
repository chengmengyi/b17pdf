import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fje_cache_name_oif.dart';

abstract final class B17FloatOhoCacheVze {
  static int b17KqmReadTimeWze() {
    return b17LpzGetStorageRau.read<int>(
          B17FjeCacheNameOif.b17FloatOho,
        ) ??
        50;
  }

  static Future<void> b17VqnSaveTimeTza({required int b17PqnTimestampVze}) {
    return b17LpzGetStorageRau.write(
      B17FjeCacheNameOif.b17FloatOho,
      b17PqnTimestampVze,
    );
  }
}
