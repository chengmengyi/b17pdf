import 'package:b17pdf/b17_pwo_preferences_cjn/b17_qzm_permissions_xva/b17_kqn_access_func_vze.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_address_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_jdw_metric_type_ijd.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_dji_analytics_func_wji.dart';
import 'package:b17pdf/b17_ncu_conversion_fsz/b17_ejw_workflow_oeo/b17_qxn_pictures_output_vza/b17_kqm_pictures_output_controller_wze.dart';
import 'package:doc_scan_flutter/doc_scan.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

final class B17KqmPicturesFuncWze {
  B17KqmPicturesFuncWze._();

  static final B17KqmPicturesFuncWze instance = B17KqmPicturesFuncWze._();

  Future<List<String>> b17BonToScanZjx({
    bool b17QxnOpenResultVza = true,
  }) async {
    if (b17QxnOpenResultVza) {
      B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
        b17QxnPointTypeVza: B17JdwMetricTypeIjd.tool_scan,
      );
    }
    if (!await Permission.camera.isGranted) {
      final B17VqmAccessOutputXze b17QxnPermissionResultVza =
          await B17KqnAccessFuncVze.instance.requestPermission(
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
      _b17VqnOpenImagesResultTza(b17VqnPathsTza, B17SouPicturesOutputRce.scan);
    }
    return b17VqnPathsTza;
  }

  Future<List<String>> b17McvChooseImagesXri({
    bool b17QxnOpenResultVza = true,
  }) async {
    if (b17QxnOpenResultVza) {
      B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
        b17QxnPointTypeVza: B17JdwMetricTypeIjd.tool_image_to_pdf,
      );
    }
    final List<XFile> b17KqmImageListVzr = await ImagePicker().pickMultiImage();
    final List<String> b17VqnPathsTza = _b17HqmValidPathsWza(
      b17KqmImageListVzr.map((XFile b17QxnImageVza) => b17QxnImageVza.path),
    );
    if (b17QxnOpenResultVza) {
      _b17VqnOpenImagesResultTza(
        b17VqnPathsTza,
        B17SouPicturesOutputRce.choose,
      );
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
    B17SouPicturesOutputRce b17KqmSourceWze,
  ) {
    if (b17PqnValidPathsVze.isEmpty) return;

    B17FjeNavigationFuncIfj.b17HkqPushNamedVpa<void>(
      b17McfRouteNameZsq: B17FjeNavigationAddressIfj.b17VqnImagesResultRouteTza,
      b17XveArgumentsDlu: <String, dynamic>{
        'b17EpaImagThs': b17PqnValidPathsVze,
        'b17HreSourceKaq': b17KqmSourceWze,
      },
    );
  }
}
