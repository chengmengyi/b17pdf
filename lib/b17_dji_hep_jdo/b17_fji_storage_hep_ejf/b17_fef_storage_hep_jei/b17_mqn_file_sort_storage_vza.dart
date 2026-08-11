import 'package:b17pdf/b17_dji_hep_jdo/b17_fji_storage_hep_ejf/b17_fje_storage_name_oif.dart';

class B17MqnFileSortStorageVza {
  B17MqnFileSortStorageVza._();
  static String b17HqmReadSortNameWze(String b17KqnTabNameVxe) =>
      b17LpzGetStorageRau.read<String>('b16_sort_$b17KqnTabNameVxe') ??
      'dateNew';
  static Future<void> b17PqmWriteSortNameXza({
    required String b17VqnTabNameTze,
    required String b17HqmSortNameWza,
  }) => b17LpzGetStorageRau.write(
    'b16_sort_$b17VqnTabNameTze',
    b17HqmSortNameWza,
  );
}
