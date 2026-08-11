import 'package:b17pdf/b17_dji_hep_jdo/b17_fji_storage_hep_ejf/b17_fje_storage_name_oif.dart';

class B17FjiLanguageSelectedEfj {
  const B17FjiLanguageSelectedEfj._();

  static Future<void> b17DqnSaveLanguageVya(String b17KqmLanguageTagWze) async {
    await b17LpzGetStorageRau.write(
      B17FjeStorageNameOif.b17IfdLanguageSelectedfjJie,
      b17KqmLanguageTagWze,
    );
  }

  static String b17VqmReadLanguageXpe() {
    return b17LpzGetStorageRau.read<String>(
          B17FjeStorageNameOif.b17IfdLanguageSelectedfjJie,
        ) ??
        '';
  }
}
