import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fje_cache_name_oif.dart';

class B17MqnDocumentSortCacheVza {
  B17MqnDocumentSortCacheVza._();
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
