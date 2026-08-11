import 'package:b17pdf/b17_dji_hep_jdo/b17_fji_storage_hep_ejf/b17_fje_storage_name_oif.dart';

abstract final class B17PqnLastAdShowTimeStorageVze {
  static int b17KqmReadTimeWze(String b17QxnSceneKeyVza) {
    return b17LpzGetStorageRau.read<int>(
          '${B17FjeStorageNameOif.b17HqmLastAdShowTimeWza}_$b17QxnSceneKeyVza',
        ) ??
        0;
  }

  static Future<void> b17VqnSaveTimeTza({
    required String b17HqmSceneKeyWza,
    required int b17PqnTimestampVze,
  }) {
    return b17LpzGetStorageRau.write(
      '${B17FjeStorageNameOif.b17HqmLastAdShowTimeWza}_$b17HqmSceneKeyWza',
      b17PqnTimestampVze,
    );
  }
}
