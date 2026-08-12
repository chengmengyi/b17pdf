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
    return Column(
      children: [
        SizedBox(height: 120.h),
        B17PzrAssetPictureViewXcu(
          "b17_fie_notice_top_pictures_asset_fjo",
          b17DtvWidthQpl: 256.w,
          b17RnxHeightKse: 208.h,
        ),
        Spacer(),
        B17CxmLocalizedTextViewPra(
          "This app has an update".tr,
          b17RvxFontSizeQle: 20.sp,
          b17DtkColorZma: Color(0xff242C3C),
          b17HncFontWeightYsp: FontWeight.bold,
        ),
        SizedBox(height: 10.h),
        B17CxmLocalizedTextViewPra(
          "Please upgrade to enjoy the latest functions.".tr,
          b17RvxFontSizeQle: 16.sp,
          b17DtkColorZma: Color(0xff555978),
          b17HncFontWeightYsp: FontWeight.w500,
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
                      B17FjeDeviceInfoIfj.b17QxnApplicationNameVza.tr,
                      b17RvxFontSizeQle: 14.sp,
                      b17DtkColorZma: Color(0xff242C3C),
                      b17HncFontWeightYsp: FontWeight.bold,
                      b17FzrOverflowXke: TextOverflow.ellipsis,
                    ),
                    B17CxmLocalizedTextViewPra(
                      "All notifications".tr,
                      b17RvxFontSizeQle: 12.sp,
                      b17DtkColorZma: Color(0xff9C9FAE),
                    ),
                  ],
                ),
              ),
              const B17FeiSwitchViewFji(),
            ],
          ),
        ),
        SizedBox(height: 30.h),
        B17HqvPulseViewZna(
          b17PxnChildVta: B17MfwTapGuardViewQke(
            b17JkcOnPressedXwu: () {
              b17KqmControllerXve.b17HgrClickUpdateCla();
            },
            b17HnqChildVsa: Container(
              width: double.infinity,
              height: 46.h,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Color(0xffD12629),
                borderRadius: BorderRadius.circular(42.w),
              ),
              child: B17CxmLocalizedTextViewPra(
                'Update now'.tr,
                b17RvxFontSizeQle: 16.sp,
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
