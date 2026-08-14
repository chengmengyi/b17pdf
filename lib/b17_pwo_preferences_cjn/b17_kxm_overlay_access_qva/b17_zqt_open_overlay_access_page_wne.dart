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
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        B17PzrAssetPictureViewXcu(
          'b17_fje_floating_access_top_background_asset_ifj',
          b17DtvWidthQpl: double.infinity,
          b17RnxHeightKse: 180.h,
        ),
        Column(
          children: [
            SafeArea(
              top: true,
              bottom: false,
              child: B17PzrAssetPictureViewXcu(
                'b17_fhu_floating_access_top_pictures_asset_efj',
                b17DtvWidthQpl: double.infinity,
                b17RnxHeightKse: 272.h,
              ),
            ),
            SizedBox(height: 24.h),
            B17CxmLocalizedTextViewPra(
              'Unlock Full PDF Potential'.tr,
              b17RvxFontSizeQle: 24.sp,
              b17DtkColorZma: Colors.black,
              b17HncFontWeightYsp: FontWeight.bold,
            ),
            SizedBox(height: 24.h),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                B17CxmLocalizedTextViewPra(
                  'Step 1: find PDF flow in the list below.'.tr,
                  b17RvxFontSizeQle: 14.sp,
                  b17DtkColorZma: const Color(0xff4b5156),
                  b17HncFontWeightYsp: FontWeight.w500,
                ),
                B17CxmLocalizedTextViewPra(
                  'Step 2: toggle the switch to ON.'.tr,
                  b17RvxFontSizeQle: 14.sp,
                  b17DtkColorZma: const Color(0xff4b5156),
                  b17HncFontWeightYsp: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(height: 56.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.w),
              margin: EdgeInsets.symmetric(horizontal: 40.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                border: Border.all(
                  width: 0.5.w,
                  color: const Color(0xff000000).withValues(alpha: 0.1),
                ),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  B17PzrAssetPictureViewXcu(
                    'b17_fhu_logo_asset_efh',
                    b17DtvWidthQpl: 48.w,
                    b17RnxHeightKse: 48.w,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: B17CxmLocalizedTextViewPra(
                      B17FjeDeviceInfoIfj.b17QxnApplicationNameVza.tr,
                      b17RvxFontSizeQle: 16.sp,
                      b17DtkColorZma: Colors.black,
                      b17HncFontWeightYsp: FontWeight.bold,
                      b17FzrOverflowXke: TextOverflow.ellipsis,
                    ),
                  ),
                  const B17FeiSwitchViewFji(),
                ],
              ),
            ),
            const Spacer(),
            B17HqvPulseViewZna(
              b17PxnChildVta: B17MfwTapGuardViewQke(
                b17JkcOnPressedXwu: b17KqvControllerWze.b17HqmClickContinueWze,
                b17HnqChildVsa: Container(
                  width: double.infinity,
                  height: 48.h,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.w),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff06B3F2), Color(0xff002DF6)],
                    ),
                  ),
                  child: B17CxmLocalizedTextViewPra(
                    'Continue'.tr,
                    b17RvxFontSizeQle: 18.sp,
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
                b17RvxFontSizeQle: 16.sp,
                b17DtkColorZma: const Color(0xff4b5156),
                b17FefDecorationJie: TextDecoration.underline,
                b17HncFontWeightYsp: FontWeight.bold,
              ),
            ),
            SizedBox(height: 36.h),
          ],
        ),
      ],
    );
  }
}
