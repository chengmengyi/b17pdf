import 'package:b17pdf/b17_dji_hep_jdo/b17_fji_storage_hep_ejf/b17_fje_storage_name_oif.dart';

class B17FjiNotificationTimeEfj {
  const B17FjiNotificationTimeEfj._();

  static Future<void> b17DqnSaveVya(String config) async {
    await b17LpzGetStorageRau.write(
      B17FjeStorageNameOif.b17OntNotificatiIme,
      config,
    );
  }

  static String b17VqmReadXpe() {
    return b17LpzGetStorageRau.read<String>(
          B17FjeStorageNameOif.b17OntNotificatiIme,
        ) ??
        '{"local_interval":1800,"action_interval":30,"battery_changed":600}';
  }
}
