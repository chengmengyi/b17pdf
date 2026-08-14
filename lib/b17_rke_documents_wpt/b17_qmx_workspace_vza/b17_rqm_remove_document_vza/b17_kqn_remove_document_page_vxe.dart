import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_rke_documents_wpt/b17_qmx_workspace_vza/b17_rqm_remove_document_vza/b17_hqm_remove_document_controller_wze.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_qaz_base_page_mtr.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_vny_media_padding_view_qsl.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:get/get.dart';

class B17KqnRemoveDocumentPageVxe
    extends B17QazBasePageMtr<B17HqmRemoveDocumentControllerWze> {
  const B17KqnRemoveDocumentPageVxe({super.key});

  @override
  B17HqmRemoveDocumentControllerWze b17AhdCreateControllerWks() {
    return B17HqmRemoveDocumentControllerWze();
  }

  @override
  Widget b17RuzBuildContentNxe(
    BuildContext b17VqmContextXza,
    B17HqmRemoveDocumentControllerWze b17PqmControllerWze,
  ) {
    return GetBuilder<B17HqmRemoveDocumentControllerWze>(
      init: b17PqmControllerWze,
      builder: (b17QxmControllerVza) => Column(
        children: [
          _b17KprTitleWidgetDnm(b17QxmControllerVza),
          _b17IpmContentWidgetRmp(b17QxmControllerVza),
        ],
      ),
    );
  }

  _b17IpmContentWidgetRmp(
    B17HqmRemoveDocumentControllerWze b17PqmcontrollerWze,
  ) => Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.only(top: 8.h),
      color: Colors.white,
      child: Column(
        children: [
          _listWidget(b17PqmcontrollerWze),
          _b17AgdBottomWidgetHkw(b17PqmcontrollerWze),
        ],
      ),
    ),
  );

  _listWidget(B17HqmRemoveDocumentControllerWze b17PqmcontrollerWze) =>
      Expanded(
        child: B17VnyMediaPaddingViewQsl(
          b17QzpChildMwa: ListView.separated(
            itemCount: b17PqmcontrollerWze.b17QxmFilesVza.length,
            itemBuilder: (context, index) {
              final b17QxmFileVza = b17PqmcontrollerWze.b17QxmFilesVza[index];
              return B17MfwTapGuardViewQke(
                b17JkcOnPressedXwu: () {
                  b17PqmcontrollerWze.b17OoeClickItemSmo(b17QxmFileVza);
                },
                b17HnqChildVsa: Container(
                  width: double.infinity,
                  height: 68.h,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 16.w, right: 16.w),
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        _b17QxnFileBackgroundColorVza(
                          b17QxmFileVza,
                        ).withOpacity(0.1),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      B17PzrAssetPictureViewXcu(
                        b17PqmcontrollerWze.b17VqmIsSelectedXza(b17QxmFileVza)
                            ? "b17_nmt_selected_icon_asset_zml"
                            : "b17_qug_unselected_icon_asset_jxa",
                        b17DtvWidthQpl: 24.w,
                        b17RnxHeightKse: 24.w,
                      ),
                      SizedBox(width: 12.w),
                      B17PzrAssetPictureViewXcu(
                        b17PqmcontrollerWze.b17KqnFileIconVze(b17QxmFileVza),
                        b17DtvWidthQpl: 40.w,
                        b17RnxHeightKse: 40.w,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            B17CxmLocalizedTextViewPra(
                              b17QxmFileVza.name ?? '',
                              b17RvxFontSizeQle: 14.sp,
                              b17DtkColorZma: Colors.black,
                              b17HncFontWeightYsp: FontWeight.bold,
                              b17FzrOverflowXke: TextOverflow.ellipsis,
                            ),
                            B17CxmLocalizedTextViewPra(
                              _b17PqmFileDetailWza(b17QxmFileVza),
                              b17RvxFontSizeQle: 10.sp,
                              b17DtkColorZma: Color(0xff9C9FAE),
                              b17HncFontWeightYsp: FontWeight.w500,
                              b17FzrOverflowXke: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: 6.h),
          ),
        ),
      );

  Color _b17QxnFileBackgroundColorVza(FileToolsFileInfo b17QxmFileVza) =>
      switch (b17QxmFileVza.type) {
        FileToolsDocumentType.word => const Color(0xff2C90FE),
        FileToolsDocumentType.excel => const Color(0xff01C87C),
        _ => const Color(0xffF85758),
      };

  String _b17PqmFileDetailWza(FileToolsFileInfo b17VqnFileTze) {
    final DateTime b17HqmDateWza = DateTime.fromMillisecondsSinceEpoch(
      b17VqnFileTze.updateTime ?? 0,
    );
    final String b17KqnDateTextVze =
        '${b17HqmDateWza.year}-${b17HqmDateWza.month.toString().padLeft(2, '0')}-${b17HqmDateWza.day.toString().padLeft(2, '0')}';
    final double b17PqmSizeXza = (b17VqnFileTze.size ?? 0) / 1024 / 1024;
    return '$b17KqnDateTextVze｜${b17PqmSizeXza.toStringAsFixed(1)}M';
  }

  _b17AgdBottomWidgetHkw(
    B17HqmRemoveDocumentControllerWze b17PqmcontrollerWze,
  ) => Container(
    width: double.infinity,
    height: 60.h,
    alignment: Alignment.center,
    padding: EdgeInsets.only(left: 16.w, right: 16.w),
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
    child: B17MfwTapGuardViewQke(
      b17JkcOnPressedXwu: () {
        b17PqmcontrollerWze.b17TatClickDeleteMsa();
      },
      b17HnqChildVsa: Container(
        width: double.infinity,
        height: 44.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xffD12629),
          borderRadius: BorderRadius.circular(22.w),
        ),
        child: B17CxmLocalizedTextViewPra(
          "Delete".tr,
          b17RvxFontSizeQle: 16.sp,
          b17DtkColorZma: Colors.white,
          b17HncFontWeightYsp: FontWeight.bold,
        ),
      ),
    ),
  );

  _b17KprTitleWidgetDnm(
    B17HqmRemoveDocumentControllerWze b17PqmcontrollerWze,
  ) => Container(
    width: double.infinity,
    color: Colors.white,
    child: SafeArea(
      top: true,
      bottom: false,
      child: Container(
        width: double.infinity,
        height: 44.h,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Row(
          children: [
            B17MfwTapGuardViewQke(
              b17JkcOnPressedXwu: b17PqmcontrollerWze.b17PqmClickSelectAllWza,
              b17HnqChildVsa: B17CxmLocalizedTextViewPra(
                "Select All".tr,
                b17RvxFontSizeQle: 14.sp,
                b17DtkColorZma: Color(0xffD12629),
                b17HncFontWeightYsp: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Center(
                child: B17CxmLocalizedTextViewPra(
                  '{n} Selected'.tr.replaceAll(
                    '{n}',
                    b17PqmcontrollerWze.b17KqnSelectedPathsVze.length
                        .toString(),
                  ),
                  b17RvxFontSizeQle: 16.sp,
                  b17DtkColorZma: Color(0xff242C3C),
                  b17HncFontWeightYsp: FontWeight.bold,
                ),
              ),
            ),
            B17MfwTapGuardViewQke(
              b17JkcOnPressedXwu: () {
                B17FjeNavigationFuncIfj.b17PqnBackWithExitAdVze<void>();
              },
              b17HnqChildVsa: B17CxmLocalizedTextViewPra(
                "Cancel".tr,
                b17RvxFontSizeQle: 14.sp,
                b17DtkColorZma: Color(0xff9C9FAE),
                b17HncFontWeightYsp: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
