import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_fje_device_info_ifj.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_kxm_overlay_access_qva/b17_hvx_open_overlay_access_controller_pra.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_qaz_base_page_mtr.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_hqv_pulse_view_zna.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_fei_switch_view_fji.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17ZqtOpenOverlayAccessPageWne
    extends B17QazBasePageMtr<B17HvxOpenOverlayAccessControllerPra> {
  const B17ZqtOpenOverlayAccessPageWne({super.key});

  @override
  B17HvxOpenOverlayAccessControllerPra b17AhdCreateControllerWks() {
    return B17HvxOpenOverlayAccessControllerPra();
  }

  @override
  Widget b17RuzBuildContentNxe(
    BuildContext b17HqmContextXva,
    B17HvxOpenOverlayAccessControllerPra b17KqvControllerWze,
  ) {
    return Column(
      children: [
        SizedBox(height: 120.h),
        B17PzrAssetPictureViewXcu(
          'b17_fhu_floating_access_top_pictures_asset_efj',
          b17DtvWidthQpl: double.infinity,
          b17RnxHeightKse: 220.h,
        ),
        const Spacer(),
        B17CxmLocalizedTextViewPra(
          'Unlock Full PDF Potential'.tr,
          b17RvxFontSizeQle: 20.sp,
          b17DtkColorZma: Color(0xff242C3C),
          b17HncFontWeightYsp: FontWeight.bold,
        ),
        SizedBox(height: 10.h),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            B17CxmLocalizedTextViewPra(
              'Step 1: find PDF flow in the list below.'.tr,
              b17RvxFontSizeQle: 16.sp,
              b17DtkColorZma: const Color(0xff555978),
              b17HncFontWeightYsp: FontWeight.w500,
            ),
            B17CxmLocalizedTextViewPra(
              'Step 2: toggle the switch to ON.'.tr,
              b17RvxFontSizeQle: 16.sp,
              b17DtkColorZma: const Color(0xff555978),
              b17HncFontWeightYsp: FontWeight.w500,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12.w),
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            color: Color(0xffF3F3F4),
          ),
          child: Row(
            children: [
              B17PzrAssetPictureViewXcu(
                'b17_fhu_logo_asset_efh',
                b17DtvWidthQpl: 50.w,
                b17RnxHeightKse: 50.w,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: B17CxmLocalizedTextViewPra(
                  B17FjeDeviceInfoIfj.b17QxnApplicationNameVza.tr,
                  b17RvxFontSizeQle: 14.sp,
                  b17DtkColorZma: Color(0xff242C3C),
                  b17HncFontWeightYsp: FontWeight.bold,
                  b17FzrOverflowXke: TextOverflow.ellipsis,
                ),
              ),
              const B17FeiSwitchViewFji(),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        B17HqvPulseViewZna(
          b17PxnChildVta: B17MfwTapGuardViewQke(
            b17JkcOnPressedXwu: b17KqvControllerWze.b17HqmClickContinueWze,
            b17HnqChildVsa: Container(
              width: double.infinity,
              height: 45.h,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Color(0xffD12629),
                borderRadius: BorderRadius.circular(24.w),
              ),
              child: B17CxmLocalizedTextViewPra(
                'Continue'.tr,
                b17RvxFontSizeQle: 16.sp,
                b17DtkColorZma: Colors.white,
                b17HncFontWeightYsp: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        B17MfwTapGuardViewQke(
          b17JkcOnPressedXwu: b17KqvControllerWze.b17VqmClickLaterXze,
          b17HnqChildVsa: B17CxmLocalizedTextViewPra(
            'Later'.tr,
            b17RvxFontSizeQle: 14.sp,
            b17DtkColorZma: const Color(0xff555978),
            b17FefDecorationJie: TextDecoration.underline,
            b17HncFontWeightYsp: FontWeight.bold,
          ),
        ),
        SizedBox(height: 25.h),
      ],
    );
  }
}
