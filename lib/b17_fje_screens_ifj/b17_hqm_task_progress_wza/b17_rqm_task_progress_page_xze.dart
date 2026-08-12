import 'package:b17pdf/b17_fje_screens_ifj/b17_hqm_task_progress_wza/b17_pqn_task_progress_controller_vze.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_qaz_base_page_mtr.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_ijo_lottie_widget_wok.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17RqmTaskProgressPageXze
    extends B17QazBasePageMtr<B17PqnTaskProgressControllerVze> {
  const B17RqmTaskProgressPageXze({super.key});

  @override
  B17PqnTaskProgressControllerVze b17AhdCreateControllerWks() {
    return B17PqnTaskProgressControllerVze();
  }

  @override
  Widget b17RuzBuildContentNxe(
    BuildContext b17VqmContextWza,
    B17PqnTaskProgressControllerVze b17KqmControllerXve,
  ) {
    return GetBuilder<B17PqnTaskProgressControllerVze>(
      builder: (B17PqnTaskProgressControllerVze b17VqnControllerTza) => Column(
        children: [
          _b17HqmTitleWza(b17VqnControllerTza),
          SizedBox(height: 100.h),
          B17PzrAssetPictureViewXcu("b17_process_icon_djiw",b17DtvWidthQpl: 114.w,b17RnxHeightKse: 114.w,),
          SizedBox(height: 20.h),
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
            b17DtkColorZma: Color(0xff555978),
            b17HncFontWeightYsp: FontWeight.w500,
          ),
          Spacer(),
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
          SizedBox(height: 12.h),
          Container(
            margin: EdgeInsets.only(left: 20.w,right: 20.w),
            child: LayoutBuilder(
              builder: (context,bc){
                var maxWidth = bc.maxWidth;
                return Container(
                  width: double.infinity,
                  height: 6.h,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Color(0xffD12629).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Container(
                    width: maxWidth * b17VqnControllerTza.b17VqnProgressTza,
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: Color(0xffD12629),
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 25.h),
          B17CxmLocalizedTextViewPra(
            "${b17VqnControllerTza.b17PqnProgressPercentVze}%",
            b17RvxFontSizeQle: 20.sp,
            b17DtkColorZma: Color(0xff242C3C),
            b17HncFontWeightYsp: FontWeight.bold,
          ),
          SizedBox(height: 68.h),
        ],
      ),
    );
  }

  Widget _b17HqmTitleWza(B17PqnTaskProgressControllerVze b17KqmcontrollerXve) =>
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
                        b17DtvWidthQpl: 33.w,
                        b17RnxHeightKse: 33.w,
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
