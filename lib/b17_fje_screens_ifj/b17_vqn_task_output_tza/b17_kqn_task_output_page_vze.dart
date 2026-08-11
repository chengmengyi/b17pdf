import 'package:b17pdf/b17_fje_screens_ifj/b17_vqn_task_output_tza/b17_hqm_task_output_controller_wze.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_qaz_base_page_mtr.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17KqnTaskOutputPageVze
    extends B17QazBasePageMtr<B17HqmTaskOutputControllerWze> {
  const B17KqnTaskOutputPageVze({super.key});

  @override
  B17HqmTaskOutputControllerWze b17AhdCreateControllerWks() {
    return B17HqmTaskOutputControllerWze();
  }

  @override
  Color get b17LxqNavigationBarColorVbi => Colors.white;

  @override
  Widget b17RuzBuildContentNxe(
    BuildContext b17VqmContextWza,
    B17HqmTaskOutputControllerWze b17KqmControllerXve,
  ) {
    return Column(
      children: [
        _b17HqmTitleWza(b17KqmControllerXve),
        SizedBox(height: 100.h),
        B17PzrAssetPictureViewXcu(
          "b17_ejw_task_result_top_asset_oeo",
          b17DtvWidthQpl: 80.w,
          b17RnxHeightKse: 80.w,
        ),
        SizedBox(height: 20.h),
        B17CxmLocalizedTextViewPra(
          'Success!'.tr,
          b17RvxFontSizeQle: 24.sp,
          b17DtkColorZma: Colors.black,
          b17HncFontWeightYsp: FontWeight.bold,
        ),
        SizedBox(height: 8.h),
        B17CxmLocalizedTextViewPra(
          'Your file is ready'.tr,
          b17RvxFontSizeQle: 14.sp,
          b17DtkColorZma: Color(0xff4B5156),
          b17HncFontWeightYsp: FontWeight.w500,
        ),
        SizedBox(height: 50.h),
        _b17WqsInfoWidgetVoz(b17KqmControllerXve),
        Spacer(),
        _b17AgdBottomWidgetHkw(b17KqmControllerXve),
      ],
    );
  }

  Widget _b17AgdBottomWidgetHkw(
    B17HqmTaskOutputControllerWze b17KqmcontrollerXve,
  ) => B17MfwTapGuardViewQke(
    b17JkcOnPressedXwu: b17KqmcontrollerXve.b17OyxClickOpenWpt,
    b17HnqChildVsa: Container(
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
      child: Container(
        width: double.infinity,
        height: 44.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.w),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xffFF8E71), Color(0xffA77FF1)],
          ),
        ),
        child: B17CxmLocalizedTextViewPra(
          "Open".tr,
          b17RvxFontSizeQle: 16.sp,
          b17DtkColorZma: Colors.white,
          b17HncFontWeightYsp: FontWeight.bold,
        ),
      ),
    ),
  );

  Widget _b17WqsInfoWidgetVoz(
    B17HqmTaskOutputControllerWze b17KqmcontrollerXve,
  ) => Container(
    width: double.infinity,
    height: 72.h,
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(left: 16.w, right: 16.w),
    margin: EdgeInsets.only(left: 40.w, right: 40.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.w),
      border: Border.all(width: 0.5.w, color: Color(0xffEBEBEB)),
    ),
    child: Row(
      children: [
        B17PzrAssetPictureViewXcu(
          "b17_gpf_pdf_logo_asset_tpd",
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
                b17KqmcontrollerXve.b17VqnFileNameTza,
                b17RvxFontSizeQle: 14.sp,
                b17DtkColorZma: Colors.black,
                b17HncFontWeightYsp: FontWeight.bold,
                b17FzrOverflowXke: TextOverflow.ellipsis,
              ),
              B17CxmLocalizedTextViewPra(
                b17KqmcontrollerXve.b17HqmFileDetailWza,
                b17RvxFontSizeQle: 12.sp,
                b17DtkColorZma: Color(0xff858C92),
                b17HncFontWeightYsp: FontWeight.w500,
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _b17HqmTitleWza(B17HqmTaskOutputControllerWze b17KqmcontrollerXve) =>
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
                  b17JkcOnPressedXwu: b17KqmcontrollerXve.b17UjfClickBackBzn,
                  b17HnqChildVsa: SizedBox(
                    width: 44.w,
                    height: 44.h,
                    child: Center(
                      child: B17PzrAssetPictureViewXcu(
                        'b17_wjo_return_icon_asset_mvj',
                        b17DtvWidthQpl: 24.w,
                        b17RnxHeightKse: 24.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
