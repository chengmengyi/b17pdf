import 'package:b17pdf/b17_dji_hep_jdo/b17_qzm_permission_hep_xva/b17_kqn_permission_hep_vze.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_address_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_hep_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_jdw_point_type_ijd.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_dji_tba_hep_wji.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_qxn_images_result_vza/b17_kqm_images_result_controller_wze.dart';
import 'package:doc_scan_flutter/doc_scan.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

final class B17KqmImagesHepWze {
  B17KqmImagesHepWze._();

  static final B17KqmImagesHepWze instance = B17KqmImagesHepWze._();

  Future<List<String>> b17BonToScanZjx({
    bool b17QxnOpenResultVza = true,
  }) async {
    if (b17QxnOpenResultVza) {
      B17DjiTbaHepWji.instance.b17KqnUploadPointVxe(
        b17QxnPointTypeVza: B17JdwPointTypeIjd.tool_scan,
      );
    }
    if (!await Permission.camera.isGranted) {
      final B17VqmPermissionResultXze b17QxnPermissionResultVza =
          await B17KqnPermissionHepVze.instance.requestPermission(
            b17QxmPermissionVza: Permission.camera,
          );
      if (!b17QxnPermissionResultVza.b17HqmIsGrantedWza) {
        return const <String>[];
      }
    }

    final List<String>? b17PqmScanPathListVzr = await DocumentScanner.scan(
      format: DocScanFormat.jpeg,
    );
    final List<String> b17VqnPathsTza = _b17HqmValidPathsWza(
      b17PqmScanPathListVzr,
    );
    if (b17QxnOpenResultVza) {
      _b17VqnOpenImagesResultTza(b17VqnPathsTza, B17SouImagesResultRce.scan);
    }
    return b17VqnPathsTza;
  }

  Future<List<String>> b17McvChooseImagesXri({
    bool b17QxnOpenResultVza = true,
  }) async {
    if (b17QxnOpenResultVza) {
      B17DjiTbaHepWji.instance.b17KqnUploadPointVxe(
        b17QxnPointTypeVza: B17JdwPointTypeIjd.tool_image_to_pdf,
      );
    }
    final List<XFile> b17KqmImageListVzr = await ImagePicker().pickMultiImage();
    final List<String> b17VqnPathsTza = _b17HqmValidPathsWza(
      b17KqmImageListVzr.map((XFile b17QxnImageVza) => b17QxnImageVza.path),
    );
    if (b17QxnOpenResultVza) {
      _b17VqnOpenImagesResultTza(b17VqnPathsTza, B17SouImagesResultRce.choose);
    }
    return b17VqnPathsTza;
  }

  List<String> _b17HqmValidPathsWza(Iterable<String>? b17HqmImagePathsWza) {
    return b17HqmImagePathsWza
            ?.where((String b17KqmPathWze) => b17KqmPathWze.isNotEmpty)
            .toList(growable: false) ??
        const <String>[];
  }

  void _b17VqnOpenImagesResultTza(
    List<String> b17PqnValidPathsVze,
    B17SouImagesResultRce b17KqmSourceWze,
  ) {
    if (b17PqnValidPathsVze.isEmpty) return;

    B17FjeRoutersHepIfj.b17HkqPushNamedVpa<void>(
      b17McfRouteNameZsq: B17FjeRoutersAddressIfj.b17VqnImagesResultRouteTza,
      b17XveArgumentsDlu: <String, dynamic>{
        'b17EpaImagThs': b17PqnValidPathsVze,
        'b17HreSourceKaq': b17KqmSourceWze,
      },
    );
  }
}
