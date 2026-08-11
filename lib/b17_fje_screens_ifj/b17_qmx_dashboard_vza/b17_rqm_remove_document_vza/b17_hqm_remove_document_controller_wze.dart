import 'package:b17pdf/b17_dji_func_jdo/b17_fhi_signal_func_ejo/b17_fhi_signal_bean_feo.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fhi_signal_func_ejo/b17_qxm_signal_code_vza.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fhi_signal_func_ejo/b17_fji_signal_func_eji.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_fje_base_controller_sak.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:get/get.dart';

class B17HqmRemoveDocumentControllerWze extends B17FjeBaseControllerSak {
  final List<FileToolsFileInfo> b17QxmFilesVza = List<FileToolsFileInfo>.from(
    (Get.arguments?['files'] as List?) ?? const [],
  );
  final Set<String> b17KqnSelectedPathsVze = <String>{};
  bool b17VqmIsSelectedXza(FileToolsFileInfo b17PqnFileVze) =>
      b17KqnSelectedPathsVze.contains(b17PqnFileVze.path);
  void b17OoeClickItemSmo(FileToolsFileInfo b17HqmFileWza) {
    final b17QxmPathVza = b17HqmFileWza.path;
    if (b17QxmPathVza == null) return;
    b17KqnSelectedPathsVze.contains(b17QxmPathVza)
        ? b17KqnSelectedPathsVze.remove(b17QxmPathVza)
        : b17KqnSelectedPathsVze.add(b17QxmPathVza);
    update();
  }

  void b17PqmClickSelectAllWza() {
    if (b17KqnSelectedPathsVze.length == b17QxmFilesVza.length) {
      b17KqnSelectedPathsVze.clear();
    } else {
      b17KqnSelectedPathsVze.addAll(
        b17QxmFilesVza
            .map((b17VqnFileTze) => b17VqnFileTze.path)
            .whereType<String>(),
      );
    }
    update();
  }

  Future<void> b17TatClickDeleteMsa() async {
    if (b17KqnSelectedPathsVze.isEmpty) return;
    for (final b17HqmPathWza in b17KqnSelectedPathsVze) {
      await FlutterPreviewFile.deleteFile(b17HqmPathWza);
    }
    B17FjiSignalFuncEji.instance.b17JijSendMsgFEio(
      B17FhiSignalBeanFeo(
        b17HfeEventCodeFMie: B17QxmSignalCodeVza.b17HqmFileListRefreshWza,
      ),
    );
    B17FjeNavigationFuncIfj.b17FtyBackNwp();
  }

  String b17KqnFileIconVze(FileToolsFileInfo b17QxmFileVza) =>
      switch (b17QxmFileVza.type) {
        FileToolsDocumentType.pdf => 'b17_gpf_pdf_logo_asset_tpd',
        FileToolsDocumentType.excel => 'b17_qlt_excel_logo_asset_ouw',
        _ => 'b17_ouq_word_logo_asset_auf',
      };
}
