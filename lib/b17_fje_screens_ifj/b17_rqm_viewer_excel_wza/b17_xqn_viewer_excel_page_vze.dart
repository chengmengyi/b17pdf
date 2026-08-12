import 'dart:io';

import 'package:b17pdf/b17_fje_screens_ifj/b17_rqm_viewer_excel_wza/b17_mqp_viewer_excel_controller_tza.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_qaz_base_page_mtr.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17XqnViewerExcelPageVze
    extends B17QazBasePageMtr<B17MqpViewerExcelControllerTza> {
  const B17XqnViewerExcelPageVze({super.key});
  @override
  B17MqpViewerExcelControllerTza b17AhdCreateControllerWks() =>
      B17MqpViewerExcelControllerTza();
  @override
  Color get b17LxqNavigationBarColorVbi => Colors.white;

  @override
  Future<bool> b17YmeAllowRoutePopJcu(
    B17MqpViewerExcelControllerTza b17TbnControllerYui,
  ) async {
    b17TbnControllerYui.b17UjfClickBackBzn();
    return false;
  }

  @override
  Widget b17RuzBuildContentNxe(
    BuildContext b17RqmContextWza,
    B17MqpViewerExcelControllerTza b17XqnControllerVze,
  ) => GetBuilder<B17MqpViewerExcelControllerTza>(
    init: b17XqnControllerVze,
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
    B17MqpViewerExcelControllerTza b17QxmControllerVza,
  ) => Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.all(8.w),
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
          : ExcelFileView(
              controller: b17QxmControllerVza.b17KqnExcelControllerVze,
              autoInitialize: false,
              loadingBuilder: (_) =>
                  const Center(child: CircularProgressIndicator()),
              messageBuilder: (_, b17PqmMessageXza) => Center(
                child: B17CxmLocalizedTextViewPra(
                  File(
                        b17QxmControllerVza.b17XqnFileInfoVze.path ?? '',
                      ).existsSync()
                      ? 'Preview unavailable'.tr
                      : 'File not found'.tr,
                ),
              ),
            ),
    ),
  );
  Widget _b17VqnBottomTza(B17MqpViewerExcelControllerTza b17QxmControllerVza) =>
      Padding(
        padding: EdgeInsets.all(8.w),
        child: Row(
          children: [
            Expanded(
              child: _b17PqmActionWza(
                text: b17QxmControllerVza.b17RqmIsSavingWza
                    ? 'Saving...'.tr
                    : (b17QxmControllerVza.b17QxmIsEditingVza
                          ? 'Cancel'.tr
                          : 'Edit'.tr),
                onTap: b17QxmControllerVza.b17AckClickEditEif,
                color: b17QxmControllerVza.b17QxmIsEditingVza
                    ? const Color(0xff858C92)
                    : const Color(0xffD12629),
              ),
            ),
            if (b17QxmControllerVza.b17QxmIsEditingVza) SizedBox(width: 8.w),
            if (b17QxmControllerVza.b17QxmIsEditingVza)
              Expanded(
                child: _b17PqmActionWza(
                  text: b17QxmControllerVza.b17RqmIsSavingWza
                      ? 'Saving...'.tr
                      : 'Save'.tr,
                  onTap: b17QxmControllerVza.b17IedClickSaveJkt,
                  color: const Color(0xffD12629),
                ),
              ),
          ],
        ),
      );
  Widget _b17PqmActionWza({
    required String text,
    required VoidCallback onTap,
    required Color color,
  }) => B17MfwTapGuardViewQke(
    b17JkcOnPressedXwu: onTap,
    b17HnqChildVsa: Container(
      height: 44.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(22.w),
      ),
      child: B17CxmLocalizedTextViewPra(
        text,
        b17RvxFontSizeQle: 16.sp,
        b17DtkColorZma: Colors.white,
        b17HncFontWeightYsp: FontWeight.bold,
      ),
    ),
  );
  Widget _b17HqmTitleWza(B17MqpViewerExcelControllerTza b17QxmControllerVza) =>
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
                      child: B17PzrAssetPictureViewXcu(
                        'b17_wjo_return_icon_asset_mvj',
                        b17DtvWidthQpl: 33.w,
                        b17RnxHeightKse: 33.w,
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 52.w),
                    child: B17CxmLocalizedTextViewPra(
                      b17QxmControllerVza.b17HqmFileNameWza,
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
}
