import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fje_cache_name_oif.dart';

abstract final class B17PqnLastAdShowTimeCacheVze {
  static int b17KqmReadTimeWze(String b17QxnSceneKeyVza) {
    return b17LpzGetStorageRau.read<int>(
          '${B17FjeCacheNameOif.b17HqmLastAdShowTimeWza}_$b17QxnSceneKeyVza',
        ) ??
        0;
  }

  static Future<void> b17VqnSaveTimeTza({
    required String b17HqmSceneKeyWza,
    required int b17PqnTimestampVze,
  }) {
    return b17LpzGetStorageRau.write(
      '${B17FjeCacheNameOif.b17HqmLastAdShowTimeWza}_$b17HqmSceneKeyWza',
      b17PqnTimestampVze,
    );
  }
}
