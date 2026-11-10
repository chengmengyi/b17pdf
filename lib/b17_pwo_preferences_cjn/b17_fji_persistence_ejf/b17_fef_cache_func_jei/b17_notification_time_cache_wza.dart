import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fje_cache_name_oif.dart';

abstract final class B17NotificationTimeCacheWza {
  static const String _b17QxnDefaultConfigVza =
      '{"all_push_cd":60,"local_interval":3600,"action_interval":600,"battery_changed":1200,"push_max_time":30,"push_max_broadcast":20,"push_refresh_1":2,"push_refresh_2":30,"push_clean":1,"push_clean_time":600}';

  static String b17KqmReadConfigWze() {
    return b17LpzGetStorageRau.read<String>(
          B17FjeCacheNameOif.b17OntNotificatiIme,
        ) ??
        _b17QxnDefaultConfigVza;
  }

  static Future<void> b17VqnSaveConfigTza(String b17QxnConfigVza) {
    return b17LpzGetStorageRau.write(
      B17FjeCacheNameOif.b17OntNotificatiIme,
      b17QxnConfigVza,
    );
  }
}
