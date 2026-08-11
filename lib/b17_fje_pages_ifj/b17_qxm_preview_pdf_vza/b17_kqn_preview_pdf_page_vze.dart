import 'dart:typed_data';

import 'package:b17pdf/b17_fje_pages_ifj/b17_qxm_preview_pdf_vza/b17_hqm_preview_pdf_controller_wza.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_qaz_root_page_mtr.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_image_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17KqnPreviewPdfPageVze
    extends B17QazRootPageMtr<B17HqmPreviewPdfControllerWza> {
  const B17KqnPreviewPdfPageVze({super.key});
  @override
  B17HqmPreviewPdfControllerWza b17AhdCreateControllerWks() =>
      B17HqmPreviewPdfControllerWza();

  @override
  Color get b17LxqNavigationBarColorVbi => Colors.white;

  @override
  Future<bool> b17YmeAllowRoutePopJcu(
    B17HqmPreviewPdfControllerWza b17TbnControllerYui,
  ) async {
    b17TbnControllerYui.b17UjfClickBackBzn();
    return false;
  }

  @override
  Widget b17RuzBuildContentNxe(
    BuildContext b17QxmContextVza,
    B17HqmPreviewPdfControllerWza b17KqnControllerVze,
  ) => GetBuilder<B17HqmPreviewPdfControllerWza>(
    init: b17KqnControllerVze,
    global: false,
    builder: (b17QxmControllerVza) => Column(
      children: [
        _b17HqmTitleWza(b17QxmControllerVza),
        _b17KqnContentVze(b17QxmControllerVza),
        _b17VqnBottomTza(b17QxmControllerVza),
      ],
    ),
  );

  Widget _b17KqnContentVze(
    B17HqmPreviewPdfControllerWza b17QxmControllerVza,
  ) => Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 5,
            offset: const Offset(0, -0.5),
          ),
        ],
      ),
      child: !b17QxmControllerVza.b17VqnCanLoadViewerTza
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                PdfFileView(
                  filePath: b17QxmControllerVza.b17KqnFileInfoVze.path ?? '',
                  viewerKey: b17QxmControllerVza.b17QxmViewerKeyVza,
                  controller: b17QxmControllerVza.b17VqnViewerControllerTza,
                  undoController: b17QxmControllerVza.b17PqmUndoControllerWza,
                  canShowTextSelectionMenu: false,
                  pageLayoutMode: PdfPageLayoutMode.single,
                  onDocumentLoaded: b17QxmControllerVza.b17PqmDocumentLoadedWza,
                  onPageChanged: b17QxmControllerVza.b17HqmPageChangedWza,
                  loadingBuilder: (_) =>
                      const Center(child: CircularProgressIndicator()),
                  messageBuilder: (_, b17QxmMessageVza) => Center(
                    child: B17CxmLocalizedTextViewPra('Preview unavailable'.tr),
                  ),
                ),
                Positioned.fill(
                  child: LayoutBuilder(
                    builder: (b17KqnContextVze, b17VqnConstraintsTza) =>
                        IgnorePointer(
                          ignoring: !b17QxmControllerVza.b17KqnPenModeVze,
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onPanStart: (b17PqmDetailsWza) =>
                                b17QxmControllerVza.b17QxmStartPenVza(
                                  _b17HqmNormalizeWza(
                                    b17PqmDetailsWza.localPosition,
                                    b17VqnConstraintsTza.biggest,
                                  ),
                                ),
                            onPanUpdate: (b17PqmDetailsWza) =>
                                b17QxmControllerVza.b17VqnUpdatePenTza(
                                  _b17HqmNormalizeWza(
                                    b17PqmDetailsWza.localPosition,
                                    b17VqnConstraintsTza.biggest,
                                  ),
                                ),
                            onPanEnd: (_) =>
                                b17QxmControllerVza.b17PqmEndPenWza(),
                            child: CustomPaint(
                              painter: _B17KqnPdfPenPainterVze(
                                strokes: b17QxmControllerVza.b17HqmPenStrokesWza
                                    .where(
                                      (b17QxmStrokeVza) =>
                                          b17QxmStrokeVza.b17KqnPageNumberVze ==
                                          b17QxmControllerVza
                                              .b17VqmCurrentPageXza,
                                    )
                                    .toList(),
                                draft: b17QxmControllerVza.b17RqmDraftPointsWza,
                                draftColor:
                                    b17QxmControllerVza.b17QxmPenColorVza,
                                draftWidth:
                                    b17QxmControllerVza.b17VqnPenWidthTza,
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _b17PqmPenPanelWza(b17QxmControllerVza),
                ),
              ],
            ),
    ),
  );

  Offset _b17HqmNormalizeWza(Offset b17QxmPointVza, Size b17KqnSizeVze) =>
      Offset(
        (b17QxmPointVza.dx / b17KqnSizeVze.width).clamp(0, 1),
        (b17QxmPointVza.dy / b17KqnSizeVze.height).clamp(0, 1),
      );

  Widget _b17VqnBottomTza(
    B17HqmPreviewPdfControllerWza b17QxmControllerVza,
  ) => Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12.w),
        topRight: Radius.circular(12.w),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.2),
          blurRadius: 5,
          offset: const Offset(0, -0.5),
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 8.h),
        SizedBox(
          height: 88.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: b17QxmControllerVza.b17HqmPageCountWza,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, b17KqnIndexVze) {
              final b17VqnPageTza = b17KqnIndexVze + 1;
              final Uint8List? b17PqmBytesWza =
                  b17QxmControllerVza.b17KqnThumbnailsVze[b17VqnPageTza];
              return B17MfwTapGuardViewQke(
                b17JkcOnPressedXwu: () =>
                    b17QxmControllerVza.b17VqnJumpToPageTza(b17VqnPageTza),
                b17HnqChildVsa: Container(
                  width: 72.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffF3F5F7),
                    borderRadius: BorderRadius.circular(3.w),
                    border: Border.all(
                      width:
                          b17VqnPageTza ==
                              b17QxmControllerVza.b17VqmCurrentPageXza
                          ? 2.w
                          : 0.5.w,
                      color:
                          b17VqnPageTza ==
                              b17QxmControllerVza.b17VqmCurrentPageXza
                          ? const Color(0xff067BF2)
                          : const Color(0xffEBEBEB),
                    ),
                  ),
                  child: Stack(
                    children: [
                      if (b17PqmBytesWza != null)
                        Positioned.fill(
                          child: Padding(
                            padding: EdgeInsets.all(4.w),
                            child: Image.memory(
                              b17PqmBytesWza,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      Positioned(
                        right: 2.w,
                        bottom: 2.h,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 1.h,
                          ),
                          color: Colors.black54,
                          child: Text(
                            '$b17VqnPageTza',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (b17QxmContextVza, b17KqnIndexVze) =>
                SizedBox(width: 8.w),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            SizedBox(width: 16.w),
            B17MfwTapGuardViewQke(
              b17JkcOnPressedXwu: b17QxmControllerVza.b17EliClickUndoLmw,
              b17HnqChildVsa: B17PzrAssetImageViewXcu(
                'b17_fje_undo_icon_ifj',
                b17DtvWidthQpl: 24.w,
                b17RnxHeightKse: 24.w,
              ),
            ),
            SizedBox(width: 16.w),
            B17MfwTapGuardViewQke(
              b17JkcOnPressedXwu: b17QxmControllerVza.b17NirClickRedoQwq,
              b17HnqChildVsa: B17PzrAssetImageViewXcu(
                'b17_jij_redo_icon_fio',
                b17DtvWidthQpl: 24.w,
                b17RnxHeightKse: 24.w,
              ),
            ),
            const Spacer(),
            B17MfwTapGuardViewQke(
              b17JkcOnPressedXwu: b17QxmControllerVza.b17IedClickSaveJkt,
              b17HnqChildVsa: Container(
                width: 140.w,
                height: 44.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xff067BF2),
                  borderRadius: BorderRadius.circular(22.w),
                ),
                child: B17CxmLocalizedTextViewPra(
                  b17QxmControllerVza.b17PqmSavingWza
                      ? 'Saving...'.tr
                      : 'Save'.tr,
                  b17RvxFontSizeQle: 16.sp,
                  b17DtkColorZma: Colors.white,
                  b17HncFontWeightYsp: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 16.w),
          ],
        ),
        SizedBox(height: 8.h),
        const Divider(height: 0.5),
        SizedBox(height: 8.h),
        SizedBox(
          height: 44.h,
          child: Row(
            children: B17QakPdfEditTypeJlg.values.map((b17KqnTypeVze) {
              final b17VqnSelectedTza =
                  b17KqnTypeVze == b17QxmControllerVza.b17QxmSelectedTypeVza;
              return Expanded(
                child: B17MfwTapGuardViewQke(
                  b17JkcOnPressedXwu: () =>
                      b17QxmControllerVza.b17KqnSelectToolVze(b17KqnTypeVze),
                  b17HnqChildVsa: Container(
                    height: 44.h,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    padding: EdgeInsets.all(1.5.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22.w),
                      gradient: b17VqnSelectedTza
                          ? const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xffFF8E71), Color(0xffA77FF1)],
                            )
                          : null,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22.w),
                      ),
                      child: B17PzrAssetImageViewXcu(
                        b17KqnTypeVze.b17KqnIconVze,
                        b17DtvWidthQpl: 28.w,
                        b17RnxHeightKse: 28.w,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 8.h),
      ],
    ),
  );

  Widget _b17HqmTitleWza(B17HqmPreviewPdfControllerWza b17QxmControllerVza) =>
      Container(
        width: double.infinity,
        color: Colors.white,
        child: SafeArea(
          top: true,
          bottom: false,
          child: SizedBox(
            height: 44.h,
            child: Stack(
              children: [
                B17MfwTapGuardViewQke(
                  b17JkcOnPressedXwu: b17QxmControllerVza.b17UjfClickBackBzn,
                  b17HnqChildVsa: SizedBox(
                    width: 44.w,
                    height: 44.h,
                    child: Center(
                      child: B17PzrAssetImageViewXcu(
                        'b17_wjo_back_icon_mvj',
                        b17DtvWidthQpl: 24.w,
                        b17RnxHeightKse: 24.w,
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 52.w),
                    child: B17CxmLocalizedTextViewPra(
                      b17QxmControllerVza.b17RqmFileNameWza,
                      b17RvxFontSizeQle: 18.sp,
                      b17DtkColorZma: Colors.black,
                      b17HncFontWeightYsp: FontWeight.bold,
                      b17FzrOverflowXke: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _b17PqmPenPanelWza(
    B17HqmPreviewPdfControllerWza b17QxmControllerVza,
  ) => IgnorePointer(
    ignoring: !b17QxmControllerVza.b17KqnPenPanelVisibleVze,
    child: AnimatedOpacity(
      duration: const Duration(milliseconds: 260),
      opacity: b17QxmControllerVza.b17KqnPenPanelVisibleVze ? 1 : 0,
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 260),
        offset: b17QxmControllerVza.b17KqnPenPanelVisibleVze
            ? Offset.zero
            : const Offset(0, 0.12),
        child: Container(
          margin: EdgeInsets.fromLTRB(8.w, 0, 8.w, 8.h),
          padding: EdgeInsets.fromLTRB(14.w, 12.h, 14.w, 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.w),
            border: Border.all(color: const Color(0xffE7EAEB)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 18.w,
                offset: Offset(0, 6.h),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  B17CxmLocalizedTextViewPra(
                    'Color'.tr,
                    b17RvxFontSizeQle: 12.sp,
                    b17DtkColorZma: const Color(0xff1A1D22),
                    b17HncFontWeightYsp: FontWeight.bold,
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: b17QxmControllerVza.b17HqmPenColorsWza
                          .map(
                            (b17KqnColorVze) => B17MfwTapGuardViewQke(
                              b17JkcOnPressedXwu: () => b17QxmControllerVza
                                  .b17PqmChangePenColorWza(b17KqnColorVze),
                              b17HnqChildVsa: Container(
                                width: 24.w,
                                height: 24.w,
                                decoration: BoxDecoration(
                                  color: b17KqnColorVze,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width:
                                        b17KqnColorVze ==
                                            b17QxmControllerVza
                                                .b17QxmPenColorVza
                                        ? 3.w
                                        : 1.w,
                                    color:
                                        b17KqnColorVze ==
                                            b17QxmControllerVza
                                                .b17QxmPenColorVza
                                        ? const Color(0xff1A1D22)
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  B17CxmLocalizedTextViewPra(
                    'Width'.tr,
                    b17RvxFontSizeQle: 12.sp,
                    b17DtkColorZma: const Color(0xff1A1D22),
                    b17HncFontWeightYsp: FontWeight.bold,
                  ),
                  Expanded(
                    child: Slider(
                      value: b17QxmControllerVza.b17VqnPenWidthTza,
                      min: 2,
                      max: 30,
                      activeColor: b17QxmControllerVza.b17QxmPenColorVza,
                      onChanged: b17QxmControllerVza.b17HqmChangePenWidthWza,
                    ),
                  ),
                  SizedBox(
                    width: 26.w,
                    child: B17CxmLocalizedTextViewPra(
                      b17QxmControllerVza.b17VqnPenWidthTza.toStringAsFixed(0),
                      b17RvxFontSizeQle: 12.sp,
                      b17DtkColorZma: const Color(0xff858C92),
                      b17JkwTextAlignZdu: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class _B17KqnPdfPenPainterVze extends CustomPainter {
  final List<B17QxmPdfStrokeVza> strokes;
  final List<Offset> draft;
  final Color draftColor;
  final double draftWidth;
  const _B17KqnPdfPenPainterVze({
    required this.strokes,
    required this.draft,
    required this.draftColor,
    required this.draftWidth,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final b17QxmStrokeEntriesVza =
        <({List<Offset> points, Color color, double width})>[
          ...strokes.map(
            (b17VqnItemTza) => (
              points: b17VqnItemTza.b17VqnPointsTza,
              color: b17VqnItemTza.b17PqmColorWza,
              width: b17VqnItemTza.b17HqmWidthVza,
            ),
          ),
          (points: draft, color: draftColor, width: draftWidth),
        ];
    for (final b17KqnEntryVze in b17QxmStrokeEntriesVza) {
      final b17KqnStrokeVze = b17KqnEntryVze.points;
      if (b17KqnStrokeVze.length < 2) continue;
      final b17QxmPaintVza = Paint()
        ..color = b17KqnEntryVze.color
        ..strokeWidth = b17KqnEntryVze.width
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;
      final b17PqmPathWza = Path()
        ..moveTo(
          b17KqnStrokeVze.first.dx * size.width,
          b17KqnStrokeVze.first.dy * size.height,
        );
      for (final b17HqmPointWza in b17KqnStrokeVze.skip(1)) {
        b17PqmPathWza.lineTo(
          b17HqmPointWza.dx * size.width,
          b17HqmPointWza.dy * size.height,
        );
      }
      canvas.drawPath(b17PqmPathWza, b17QxmPaintVza);
    }
  }

  @override
  bool shouldRepaint(covariant _B17KqnPdfPenPainterVze oldDelegate) => true;
}
