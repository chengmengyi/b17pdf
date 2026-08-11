import 'package:b17pdf/b17_fje_pages_ifj/b17_hqm_process_waiting_wza/b17_pqn_process_waiting_controller_vze.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_qaz_root_page_mtr.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_image_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_ijo_lottie_widget_wok.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17RqmProcessWaitingPageXze
    extends B17QazRootPageMtr<B17PqnProcessWaitingControllerVze> {
  const B17RqmProcessWaitingPageXze({super.key});

  @override
  B17PqnProcessWaitingControllerVze b17AhdCreateControllerWks() {
    return B17PqnProcessWaitingControllerVze();
  }

  @override
  Widget b17RuzBuildContentNxe(
    BuildContext b17VqmContextWza,
    B17PqnProcessWaitingControllerVze b17KqmControllerXve,
  ) {
    return GetBuilder<B17PqnProcessWaitingControllerVze>(
      builder: (B17PqnProcessWaitingControllerVze b17VqnControllerTza) =>
          Column(
            children: [
              _b17HqmTitleWza(b17VqnControllerTza),
              SizedBox(height: 100.h),
              B17IjoLottieWidgetWok(
                name: "procss",
                width: 140.w,
                height: 140.w,
                repeat: true,
              ),
              SizedBox(height: 50.h),
              B17CxmLocalizedTextViewPra(
                'PDF Merging...'.tr,
                b17RvxFontSizeQle: 24.sp,
                b17DtkColorZma: Colors.black,
                b17HncFontWeightYsp: FontWeight.bold,
              ),
              SizedBox(height: 12.h),
              B17CxmLocalizedTextViewPra(
                'Please do not close the app.'.tr,
                b17RvxFontSizeQle: 14.sp,
                b17DtkColorZma: Color(0xff4B5156),
                b17HncFontWeightYsp: FontWeight.w500,
              ),
              B17CxmLocalizedTextViewPra(
                'Processed {current}/{total} images'.tr
                    .replaceAll(
                      '{current}',
                      '${b17VqnControllerTza.b17KqmProcessedCountWze}',
                    )
                    .replaceAll(
                      '{total}',
                      '${b17VqnControllerTza.b17QxnImagePathsVza.length}',
                    ),
                b17RvxFontSizeQle: 14.sp,
                b17DtkColorZma: Color(0xff4B5156),
                b17HncFontWeightYsp: FontWeight.w500,
              ),
              SizedBox(height: 50.h),
              Container(
                width: 236.w,
                height: 16.h,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                decoration: BoxDecoration(
                  color: const Color(0xffebebeb),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Container(
                  width: (232.w) * b17VqnControllerTza.b17VqnProgressTza,
                  height: 12.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    gradient: const LinearGradient(
                      colors: [Color(0xffff8e71), Color(0xffa77ff1)],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              B17CxmLocalizedTextViewPra(
                "${b17VqnControllerTza.b17PqnProgressPercentVze}%",
                b17RvxFontSizeQle: 14.sp,
                b17DtkColorZma: Color(0xffF4411F),
                b17HncFontWeightYsp: FontWeight.w500,
              ),
            ],
          ),
    );
  }

  Widget _b17HqmTitleWza(
    B17PqnProcessWaitingControllerVze b17KqmcontrollerXve,
  ) => Container(
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
                  child: B17PzrAssetImageViewXcu(
                    'b17_wjo_back_icon_mvj',
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
