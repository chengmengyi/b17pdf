import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fje_cache_name_oif.dart';

abstract final class B17HqmFirebaseAdConfigCacheWza {
  static String b17KqnReadConfigVxe() {
    return b17LpzGetStorageRau.read<String>(
          B17FjeCacheNameOif.b17VqnFirebaseAdConfigTza,
        ) ??
        '';
  }

  static Future<void> b17PqmSaveConfigXza(String b17VqnConfigTze) {
    return b17LpzGetStorageRau.write(
      B17FjeCacheNameOif.b17VqnFirebaseAdConfigTza,
      b17VqnConfigTze,
    );
  }
}
