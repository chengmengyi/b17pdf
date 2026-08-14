import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fje_cache_name_oif.dart';

class B17FjiLocaleSelectedEfj {
  const B17FjiLocaleSelectedEfj._();

  static Future<void> b17DqnSaveLanguageVya(String b17KqmLanguageTagWze) async {
    await b17LpzGetStorageRau.write(
      B17FjeCacheNameOif.b17IfdLanguageSelectedfjJie,
      b17KqmLanguageTagWze,
    );
  }

  static String b17VqmReadLanguageXpe() {
    return b17LpzGetStorageRau.read<String>(
          B17FjeCacheNameOif.b17IfdLanguageSelectedfjJie,
        ) ??
        '';
  }
}
