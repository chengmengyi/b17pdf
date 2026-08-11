import 'package:b17pdf/b17_dji_hep_jdo/b17_fji_storage_hep_ejf/b17_fje_storage_name_oif.dart';

abstract final class B17HqmFirebaseAdConfigStorageWza {
  static String b17KqnReadConfigVxe() {
    return b17LpzGetStorageRau.read<String>(
          B17FjeStorageNameOif.b17VqnFirebaseAdConfigTza,
        ) ??
        '';
  }

  static Future<void> b17PqmSaveConfigXza(String b17VqnConfigTze) {
    return b17LpzGetStorageRau.write(
      B17FjeStorageNameOif.b17VqnFirebaseAdConfigTza,
      b17VqnConfigTze,
    );
  }
}
