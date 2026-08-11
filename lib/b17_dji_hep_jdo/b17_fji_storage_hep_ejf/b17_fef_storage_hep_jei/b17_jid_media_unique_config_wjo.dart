import 'package:b17pdf/b17_dji_hep_jdo/b17_fji_storage_hep_ejf/b17_fje_storage_name_oif.dart';

class B17JidMediaUniqueConfigWjo {
  const B17JidMediaUniqueConfigWjo._();

  static Future<void> b17DqnSaveVya(int config) async {
    await b17LpzGetStorageRau.write(
      B17FjeStorageNameOif.b17ObfMediaUniqueConfigIri,
      config,
    );
  }

  static int b17VqmReadXpe() {
    return b17LpzGetStorageRau.read<int>(
          B17FjeStorageNameOif.b17ObfMediaUniqueConfigIri,
        ) ??
        1;
  }
}
