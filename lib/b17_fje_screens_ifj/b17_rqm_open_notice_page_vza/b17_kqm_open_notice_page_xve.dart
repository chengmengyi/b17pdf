import 'package:b17pdf/b17_dji_func_jdo/b17_fje_device_info_ifj.dart';
import 'package:b17pdf/b17_fje_screens_ifj/b17_rqm_open_notice_page_vza/b17_hqv_open_notice_controller_wze.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_qaz_base_page_mtr.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_hqv_pulse_view_zna.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_fei_switch_view_fji.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class B17KqmOpenNoticePageXve
    extends B17QazBasePageMtr<B17HqvOpenNoticeControllerWze> {
  const B17KqmOpenNoticePageXve({super.key});

  @override
  B17HqvOpenNoticeControllerWze b17AhdCreateControllerWks() {
    return B17HqvOpenNoticeControllerWze();
  }

  @override
  Widget b17RuzBuildContentNxe(
    BuildContext b17VqmContextWza,
    B17HqvOpenNoticeControllerWze b17KqmControllerXve,
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
            SizedBox(height: 100.h),
            B17PzrAssetPictureViewXcu(
              "b17_fie_notice_top_pictures_asset_fjo",
              b17DtvWidthQpl: 145.w,
              b17RnxHeightKse: 150.h,
            ),
            SizedBox(height: 60.h),
            B17CxmLocalizedTextViewPra(
              "This app has an update".tr,
              b17RvxFontSizeQle: 24.sp,
              b17DtkColorZma: Colors.black,
              b17HncFontWeightYsp: FontWeight.bold,
            ),
            SizedBox(height: 10.h),
            B17CxmLocalizedTextViewPra(
              "Please upgrade to enjoy the latest functions.".tr,
              b17RvxFontSizeQle: 14.sp,
              b17DtkColorZma: Color(0xff4B5156),
              b17HncFontWeightYsp: FontWeight.w500,
            ),
            SizedBox(height: 40.h),
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        B17CxmLocalizedTextViewPra(
                          B17FjeDeviceInfoIfj.appName.tr,
                          b17RvxFontSizeQle: 16.sp,
                          b17DtkColorZma: Colors.black,
                          b17HncFontWeightYsp: FontWeight.bold,
                          b17FzrOverflowXke: TextOverflow.ellipsis,
                        ),
                        B17CxmLocalizedTextViewPra(
                          "All notifications".tr,
                          b17RvxFontSizeQle: 12.sp,
                          b17DtkColorZma: Color(0xff858C92),
                        ),
                      ],
                    ),
                  ),
                  const B17FeiSwitchViewFji(),
                ],
              ),
            ),
            Spacer(),
            B17HqvPulseViewZna(
              b17PxnChildVta: B17MfwTapGuardViewQke(
                b17JkcOnPressedXwu: () {
                  b17KqmControllerXve.b17HgrClickUpdateCla();
                },
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
                    'Update now'.tr,
                    b17RvxFontSizeQle: 18.sp,
                    b17DtkColorZma: Colors.white,
                    b17HncFontWeightYsp: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            B17MfwTapGuardViewQke(
              b17JkcOnPressedXwu: b17KqmControllerXve.b17RlsClickLaterJtt,
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
