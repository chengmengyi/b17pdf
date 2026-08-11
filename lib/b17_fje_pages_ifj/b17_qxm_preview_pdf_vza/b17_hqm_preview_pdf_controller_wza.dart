import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jiw_ad_hep_djo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_hep_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_jdw_point_type_ijd.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_dji_tba_hep_wji.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_fje_root_controller_sak.dart';
import 'package:flutter/material.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

enum B17QakPdfEditTypeJlg {
  highlight('b17_fji_highlight_icon_eji'),
  underline('b17_fji_underline_icon_efj'),
  strikeThrough('b17_fhi_strike_through_icon_ejf'),
  pen('b17_fji_pen_icon_efj');

  final String b17KqnIconVze;
  const B17QakPdfEditTypeJlg(this.b17KqnIconVze);
}

class B17QxmPdfStrokeVza {
  final int b17KqnPageNumberVze;
  final List<Offset> b17VqnPointsTza;
  final Color b17PqmColorWza;
  final double b17HqmWidthVza;
  const B17QxmPdfStrokeVza({
    required this.b17KqnPageNumberVze,
    required this.b17VqnPointsTza,
    required this.b17PqmColorWza,
    required this.b17HqmWidthVza,
  });
}

class B17HqmPreviewPdfControllerWza extends B17FjeRootControllerSak {
  final FileToolsFileInfo b17KqnFileInfoVze =
      Get.arguments['file'] as FileToolsFileInfo;
  final GlobalKey<SfPdfViewerState> b17QxmViewerKeyVza =
      GlobalKey<SfPdfViewerState>();
  final PdfViewerController b17VqnViewerControllerTza = PdfViewerController();
  final UndoHistoryController b17PqmUndoControllerWza = UndoHistoryController();
  final Map<int, Uint8List?> b17KqnThumbnailsVze = <int, Uint8List?>{};
  final Map<int, Size> b17VqmPageSizesXza = <int, Size>{};
  final List<B17QxmPdfStrokeVza> b17HqmPenStrokesWza = <B17QxmPdfStrokeVza>[];
  final List<B17QxmPdfStrokeVza> b17PqnRedoStrokesVze = <B17QxmPdfStrokeVza>[];
  List<Offset> b17RqmDraftPointsWza = <Offset>[];
  B17QakPdfEditTypeJlg? b17QxmSelectedTypeVza;
  bool b17VqnCanLoadViewerTza = false;
  bool b17KqnDocumentLoadedVze = false;
  bool b17PqmSavingWza = false;
  bool b17KqnPenPanelVisibleVze = false;
  int b17HqmPageCountWza = 0;
  int b17VqmCurrentPageXza = 1;
  Color b17QxmPenColorVza = const Color(0xff067BF2);
  double b17VqnPenWidthTza = 8;
  Timer? b17PqmPenPanelTimerWza;
  final List<Color> b17HqmPenColorsWza = const [
    Color(0xffF4411F),
    Color(0xff1A1D22),
    Color(0xff067BF2),
    Color(0xff23A55A),
    Color(0xffF4C542),
  ];

  String get b17RqmFileNameWza {
    if ((b17KqnFileInfoVze.name ?? '').isNotEmpty) {
      return b17KqnFileInfoVze.name!;
    }
    return (b17KqnFileInfoVze.path ?? '').split(Platform.pathSeparator).last;
  }

  bool get b17KqnPenModeVze =>
      b17QxmSelectedTypeVza == B17QakPdfEditTypeJlg.pen;

  @override
  void onInit() {
    super.onInit();
    b17PqmUndoControllerWza.addListener(_b17QxmChangedVza);
  }

  @override
  void onReady() {
    super.onReady();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future<void>.delayed(const Duration(milliseconds: 120));
      b17VqnCanLoadViewerTza = true;
      update();
    });
  }

  void _b17QxmChangedVza() => update();
  void b17PqmDocumentLoadedWza(PdfDocumentLoadedDetails b17QxmDetailsVza) {
    b17KqnDocumentLoadedVze = true;
    b17HqmPageCountWza = b17QxmDetailsVza.document.pages.count;
    b17VqmPageSizesXza.clear();
    for (
      var b17KqnIndexVze = 0;
      b17KqnIndexVze < b17HqmPageCountWza;
      b17KqnIndexVze++
    ) {
      b17VqmPageSizesXza[b17KqnIndexVze + 1] =
          b17QxmDetailsVza.document.pages[b17KqnIndexVze].size;
    }
    update();
    _b17VqmLoadThumbnailsXza();
  }

  void b17HqmPageChangedWza(PdfPageChangedDetails b17QxmDetailsVza) {
    b17VqmCurrentPageXza = b17QxmDetailsVza.newPageNumber;
    update();
  }

  void b17KqnSelectToolVze(B17QakPdfEditTypeJlg b17QxmTypeVza) {
    if (b17QxmTypeVza == B17QakPdfEditTypeJlg.pen) {
      b17RqmClickPenWza();
      return;
    }
    b17KqnHidePenPanelVze();
    b17RqmDraftPointsWza = <Offset>[];
    b17QxmSelectedTypeVza = b17QxmSelectedTypeVza == b17QxmTypeVza
        ? null
        : b17QxmTypeVza;
    b17VqnViewerControllerTza.annotationMode = switch (b17QxmSelectedTypeVza) {
      B17QakPdfEditTypeJlg.highlight => PdfAnnotationMode.highlight,
      B17QakPdfEditTypeJlg.underline => PdfAnnotationMode.underline,
      B17QakPdfEditTypeJlg.strikeThrough => PdfAnnotationMode.strikethrough,
      _ => PdfAnnotationMode.none,
    };
    b17VqnViewerControllerTza.clearSelection();
    update();
  }

  void b17RqmClickPenWza() {
    if (!b17KqnDocumentLoadedVze || b17PqmSavingWza) return;
    final b17QxmEnablePenVza = !b17KqnPenModeVze;
    b17QxmSelectedTypeVza = b17QxmEnablePenVza
        ? B17QakPdfEditTypeJlg.pen
        : null;
    b17RqmDraftPointsWza = <Offset>[];
    b17VqnViewerControllerTza.annotationMode = PdfAnnotationMode.none;
    b17VqnViewerControllerTza.clearSelection();
    if (b17QxmEnablePenVza) {
      b17VqnShowPenPanelTza();
    } else {
      b17KqnHidePenPanelVze();
    }
    update();
  }

  void b17VqnShowPenPanelTza() {
    b17PqmPenPanelTimerWza?.cancel();
    b17KqnPenPanelVisibleVze = true;
    update();
    b17PqmPenPanelTimerWza = Timer(const Duration(seconds: 3), () {
      b17KqnPenPanelVisibleVze = false;
      update();
    });
  }

  void b17KqnHidePenPanelVze() {
    b17PqmPenPanelTimerWza?.cancel();
    b17PqmPenPanelTimerWza = null;
    b17KqnPenPanelVisibleVze = false;
  }

  void b17PqmChangePenColorWza(Color b17QxmColorVza) {
    b17QxmPenColorVza = b17QxmColorVza;
    b17VqnShowPenPanelTza();
  }

  void b17HqmChangePenWidthWza(double b17QxmWidthVza) {
    b17VqnPenWidthTza = b17QxmWidthVza;
    b17VqnShowPenPanelTza();
  }

  void b17VqnJumpToPageTza(int b17KqnPageNumberVze) {
    b17VqnViewerControllerTza.jumpToPage(b17KqnPageNumberVze);
    b17VqmCurrentPageXza = b17KqnPageNumberVze;
    update();
  }

  void b17QxmStartPenVza(Offset b17KqnPointVze) {
    if (!b17KqnPenModeVze || b17PqmSavingWza) return;
    b17RqmDraftPointsWza = <Offset>[b17KqnPointVze];
    update();
  }

  void b17VqnUpdatePenTza(Offset b17KqnPointVze) {
    if (b17RqmDraftPointsWza.isEmpty || !b17KqnPenModeVze) return;
    b17RqmDraftPointsWza.add(b17KqnPointVze);
    update();
  }

  void b17PqmEndPenWza() {
    if (b17RqmDraftPointsWza.isEmpty) return;
    b17HqmPenStrokesWza.add(
      B17QxmPdfStrokeVza(
        b17KqnPageNumberVze: b17VqmCurrentPageXza,
        b17VqnPointsTza: List<Offset>.from(b17RqmDraftPointsWza),
        b17PqmColorWza: b17QxmPenColorVza,
        b17HqmWidthVza: b17VqnPenWidthTza,
      ),
    );
    b17PqnRedoStrokesVze.clear();
    b17RqmDraftPointsWza = <Offset>[];
    update();
  }

  void b17EliClickUndoLmw() {
    if (b17HqmPenStrokesWza.isNotEmpty) {
      b17PqnRedoStrokesVze.add(b17HqmPenStrokesWza.removeLast());
    } else {
      b17PqmUndoControllerWza.undo();
    }
    update();
  }

  void b17NirClickRedoQwq() {
    if (b17PqnRedoStrokesVze.isNotEmpty) {
      b17HqmPenStrokesWza.add(b17PqnRedoStrokesVze.removeLast());
    } else {
      b17PqmUndoControllerWza.redo();
    }
    update();
  }

  Future<void> b17IedClickSaveJkt() async {
    if (!b17KqnDocumentLoadedVze || b17PqmSavingWza) return;
    b17PqmSavingWza = true;
    update();
    try {
      B17DjiTbaHepWji.instance.b17KqnUploadPointVxe(
        b17QxnPointTypeVza: B17JdwPointTypeIjd.editor_save_click,
      );
      List<int> b17QxmBytesVza = await b17VqnViewerControllerTza.saveDocument();
      if (b17HqmPenStrokesWza.isNotEmpty) {
        final b17KqnDocumentVze = PdfDocument(inputBytes: b17QxmBytesVza);
        for (final b17VqnStrokeTza in b17HqmPenStrokesWza) {
          if (b17VqnStrokeTza.b17KqnPageNumberVze >
              b17KqnDocumentVze.pages.count) {
            continue;
          }
          final dynamic b17PqmPageWza =
              b17KqnDocumentVze.pages[b17VqnStrokeTza.b17KqnPageNumberVze - 1];
          final Size b17HqmSizeWza = b17PqmPageWza.size as Size;
          final b17RqmPathWza = PdfPath();
          for (
            var b17QxmIndexVza = 1;
            b17QxmIndexVza < b17VqnStrokeTza.b17VqnPointsTza.length;
            b17QxmIndexVza++
          ) {
            final b17KqnFromVze =
                b17VqnStrokeTza.b17VqnPointsTza[b17QxmIndexVza - 1];
            final b17VqnToTza = b17VqnStrokeTza.b17VqnPointsTza[b17QxmIndexVza];
            b17RqmPathWza.addLine(
              Offset(
                b17KqnFromVze.dx * b17HqmSizeWza.width,
                b17KqnFromVze.dy * b17HqmSizeWza.height,
              ),
              Offset(
                b17VqnToTza.dx * b17HqmSizeWza.width,
                b17VqnToTza.dy * b17HqmSizeWza.height,
              ),
            );
          }
          b17PqmPageWza.graphics.drawPath(
            b17RqmPathWza,
            pen: PdfPen(
              PdfColor(
                (b17VqnStrokeTza.b17PqmColorWza.r * 255).round(),
                (b17VqnStrokeTza.b17PqmColorWza.g * 255).round(),
                (b17VqnStrokeTza.b17PqmColorWza.b * 255).round(),
              ),
              width:
                  (b17VqnStrokeTza.b17HqmWidthVza / 800) * b17HqmSizeWza.width,
            ),
          );
        }
        b17QxmBytesVza = await b17KqnDocumentVze.save();
        b17KqnDocumentVze.dispose();
      }
      await File(
        b17KqnFileInfoVze.path!,
      ).writeAsBytes(b17QxmBytesVza, flush: true);
      b17HqmPenStrokesWza.clear();
      b17PqnRedoStrokesVze.clear();
      Fluttertoast.showToast(msg: 'Saved successfully'.tr);
    } catch (b17KqnErrorVze) {
      Fluttertoast.showToast(msg: '$b17KqnErrorVze');
    } finally {
      b17PqmSavingWza = false;
      update();
    }
  }

  Future<void> _b17VqmLoadThumbnailsXza() async {
    for (
      var b17KqnPageVze = 1;
      b17KqnPageVze <= b17HqmPageCountWza;
      b17KqnPageVze++
    ) {
      try {
        b17KqnThumbnailsVze[b17KqnPageVze] =
            await FlutterPreviewFile.renderPdfPageToImageBytes(
              pdfPath: b17KqnFileInfoVze.path!,
              pageIndex: b17KqnPageVze - 1,
              width: 160,
            );
        update();
      } catch (_) {
        b17KqnThumbnailsVze[b17KqnPageVze] = null;
      }
    }
  }

  void b17UjfClickBackBzn() {
    B17FjeRoutersHepIfj.b17FtyBackNwp();
    if (B17QxnUserCheckHepVza.instance.b17VqnIsEligibleUserTza) {
      B17JiwAdHepDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
        b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_exit,
        b17KqmAdPosIdVzr: B17JkwPosidKos.pr_readback,
      );
    }
  }

  @override
  void onClose() {
    b17PqmPenPanelTimerWza?.cancel();
    b17PqmUndoControllerWza.removeListener(_b17QxmChangedVza);
    b17PqmUndoControllerWza.dispose();
    b17VqnViewerControllerTza.dispose();
    super.onClose();
  }
}
