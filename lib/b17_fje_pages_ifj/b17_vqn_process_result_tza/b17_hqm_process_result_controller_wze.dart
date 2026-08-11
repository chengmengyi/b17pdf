import 'dart:io';

import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_address_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_hep_ifj.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_fje_root_controller_sak.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:get/get.dart';

class B17HqmProcessResultControllerWze extends B17FjeRootControllerSak {
  final FileToolsFileInfo b17QxnFileInfoVza =
      Get.arguments['b17CorFileInfoVve'] as FileToolsFileInfo;

  String get b17VqnFileNameTza {
    final String b17KqmNameWze = b17QxnFileInfoVza.name ?? '';
    if (b17KqmNameWze.isNotEmpty) return b17KqmNameWze;
    return (b17QxnFileInfoVza.path ?? '').split(Platform.pathSeparator).last;
  }

  String get b17HqmFileDetailWza {
    final DateTime b17QxnDateVza = DateTime.fromMillisecondsSinceEpoch(
      b17QxnFileInfoVza.updateTime ?? DateTime.now().millisecondsSinceEpoch,
    );
    final String b17KqmDateTextWze =
        '${b17QxnDateVza.year}-${b17QxnDateVza.month.toString().padLeft(2, '0')}-${b17QxnDateVza.day.toString().padLeft(2, '0')}';
    final double b17VqnSizeTza = (b17QxnFileInfoVza.size ?? 0) / 1024 / 1024;
    return '$b17KqmDateTextWze | ${b17VqnSizeTza.toStringAsFixed(1)}M';
  }

  void b17UjfClickBackBzn() =>
      B17FjeRoutersHepIfj.b17PqnBackWithExitAdVze<void>();

  void b17OyxClickOpenWpt() {
    B17FjeRoutersHepIfj.b17ZxpReplaceNamedLrt<void>(
      b17YweRouteNameQpn: B17FjeRoutersAddressIfj.b17QxmPreviewPdfRouteVza,
      b17KstArgumentsJva: <String, dynamic>{'file': b17QxnFileInfoVza},
    );
  }
}
