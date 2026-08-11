import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fje_cache_name_oif.dart';

class B17JidMediaUniqueConfigWjo {
  const B17JidMediaUniqueConfigWjo._();

  static Future<void> b17DqnSaveVya(int config) async {
    await b17LpzGetStorageRau.write(
      B17FjeCacheNameOif.b17ObfMediaUniqueConfigIri,
      config,
    );
  }

  static int b17VqmReadXpe() {
    return b17LpzGetStorageRau.read<int>(
          B17FjeCacheNameOif.b17ObfMediaUniqueConfigIri,
        ) ??
        1;
  }
}
