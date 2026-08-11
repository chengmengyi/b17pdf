import 'dart:io';

import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_address_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_fje_base_controller_sak.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:get/get.dart';

class B17PqnTaskProgressControllerVze extends B17FjeBaseControllerSak {
  final List<String> b17QxnImagePathsVza = List<String>.from(
    (Get.arguments?['b17EpaImagThs'] as List?)?.whereType<String>() ??
        const <String>[],
  );
  double b17VqnProgressTza = 0;
  bool b17HqmGeneratingWza = false;

  int get b17KqmProcessedCountWze {
    if (b17QxnImagePathsVza.isEmpty) return 0;
    return (b17VqnProgressTza * b17QxnImagePathsVza.length).ceil().clamp(
      0,
      b17QxnImagePathsVza.length,
    );
  }

  int get b17PqnProgressPercentVze => (b17VqnProgressTza * 100).round();

  void b17UjfClickBackBzn() => B17FjeNavigationFuncIfj.b17FtyBackNwp();

  @override
  void onReady() {
    super.onReady();
    _b17KqmGeneratePdfWze();
  }

  Future<void> _b17KqmGeneratePdfWze() async {
    if (b17HqmGeneratingWza || b17QxnImagePathsVza.isEmpty) return;
    b17HqmGeneratingWza = true;
    final List<FileToolsFileInfo> b17VqnImagesTza = <FileToolsFileInfo>[];
    for (final String b17QxnPathVza in b17QxnImagePathsVza) {
      final File b17HqmFileWza = File(b17QxnPathVza);
      final FileStat b17KqmStatWze = await b17HqmFileWza.stat();
      b17VqnImagesTza.add(
        FileToolsFileInfo(
          name: b17QxnPathVza.split(Platform.pathSeparator).last,
          path: b17QxnPathVza,
          size: b17KqmStatWze.size,
          updateTime: b17KqmStatWze.modified.millisecondsSinceEpoch,
        ),
      );
    }
    final FileToolsFileInfo b17PqnResultVze =
        await FlutterPreviewFile.generatePdfFromImages(
          imageList: b17VqnImagesTza,
          onProgress: (double b17KqmValueWze) {
            b17VqnProgressTza = b17KqmValueWze.clamp(0, 1);
            update();
          },
        );
    b17VqnProgressTza = 1;
    update();
    B17FjeNavigationFuncIfj.b17ZxpReplaceNamedLrt<void>(
      b17YweRouteNameQpn:
          B17FjeNavigationAddressIfj.b17PqnProcessResultRouteVze,
      b17KstArgumentsJva: <String, dynamic>{
        'b17CorFileInfoVve': b17PqnResultVze,
      },
    );
  }
}
