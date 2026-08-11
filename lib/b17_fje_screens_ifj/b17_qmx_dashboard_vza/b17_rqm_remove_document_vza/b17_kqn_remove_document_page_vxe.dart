import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_fje_screens_ifj/b17_qmx_dashboard_vza/b17_rqm_remove_document_vza/b17_hqm_remove_document_controller_wze.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_qaz_base_page_mtr.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_vny_media_padding_view_qsl.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          b17QzpChildMwa: ListView.builder(
            itemCount: b17PqmcontrollerWze.b17QxmFilesVza.length,
            itemBuilder: (context, index) {
              final b17QxmFileVza = b17PqmcontrollerWze.b17QxmFilesVza[index];
              return B17MfwTapGuardViewQke(
                b17JkcOnPressedXwu: () {
                  b17PqmcontrollerWze.b17OoeClickItemSmo(b17QxmFileVza);
                },
                b17HnqChildVsa: Container(
                  width: double.infinity,
                  height: 72.h,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
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
                        b17DtvWidthQpl: 32.w,
                        b17RnxHeightKse: 32.w,
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
                              "2026-01-06｜1.2M",
                              b17RvxFontSizeQle: 12.sp,
                              b17DtkColorZma: Color(0xff858C92),
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
          ),
        ),
      );

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
          color: Color(0xffF4411F),
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
              b17JkcOnPressedXwu: () {
                B17FjeNavigationFuncIfj.b17PqnBackWithExitAdVze<void>();
              },
              b17HnqChildVsa: B17CxmLocalizedTextViewPra(
                "Cancel".tr,
                b17RvxFontSizeQle: 16.sp,
                b17DtkColorZma: Color(0xff4B5156),
                b17HncFontWeightYsp: FontWeight.w500,
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: B17CxmLocalizedTextViewPra(
                '{n} Selected'.tr.replaceAll(
                  '{n}',
                  b17PqmcontrollerWze.b17KqnSelectedPathsVze.length.toString(),
                ),
                b17RvxFontSizeQle: 18.sp,
                b17DtkColorZma: Color(0xff060E23),
                b17HncFontWeightYsp: FontWeight.bold,
              ),
            ),
            B17MfwTapGuardViewQke(
              b17JkcOnPressedXwu: b17PqmcontrollerWze.b17PqmClickSelectAllWza,
              b17HnqChildVsa: B17CxmLocalizedTextViewPra(
                "Select All".tr,
                b17RvxFontSizeQle: 16.sp,
                b17DtkColorZma: Color(0xff067BF2),
                b17HncFontWeightYsp: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
