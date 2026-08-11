import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fje_cache_name_oif.dart';

class B17FjiNoticeTimeEfj {
  const B17FjiNoticeTimeEfj._();

  static Future<void> b17DqnSaveVya(String config) async {
    await b17LpzGetStorageRau.write(
      B17FjeCacheNameOif.b17OntNotificatiIme,
      config,
    );
  }

  static String b17VqmReadXpe() {
    return b17LpzGetStorageRau.read<String>(
          B17FjeCacheNameOif.b17OntNotificatiIme,
        ) ??
        '{"local_interval":1800,"action_interval":30,"battery_changed":600}';
  }
}
