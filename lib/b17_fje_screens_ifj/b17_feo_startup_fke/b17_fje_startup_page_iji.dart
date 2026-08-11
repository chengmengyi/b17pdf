import 'package:b17pdf/b17_fje_screens_ifj/b17_feo_startup_fke/b17_fji_startup_controller_fje.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_qaz_base_page_mtr.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17FjeStartupPageIji
    extends B17QazBasePageMtr<B17FjiStartupControllerFje> {
  const B17FjeStartupPageIji({super.key});

  @override
  B17FjiStartupControllerFje b17AhdCreateControllerWks() {
    return B17FjiStartupControllerFje();
  }

  @override
  Widget b17RuzBuildContentNxe(
    BuildContext b17CmvContextQer,
    B17FjiStartupControllerFje b17TbnControllerYui,
  ) {
    return Column(
      children: [
        SizedBox(height: 160.h),
        B17PzrAssetPictureViewXcu(
          'b17_fhu_logo_asset_efh',
          b17DtvWidthQpl: 88.w,
          b17RnxHeightKse: 88.w,
        ),
        SizedBox(height: 20.h),
        B17CxmLocalizedTextViewPra(
          'Your pocket file pro'.tr,
          b17RvxFontSizeQle: 16.sp,
          b17DtkColorZma: Colors.black,
          b17HncFontWeightYsp: FontWeight.bold,
        ),
        const Spacer(),
        GetBuilder<B17FjiStartupControllerFje>(
          id: B17FjiStartupControllerFje.b17QmxProgressUpdateIdVza,
          builder: (B17FjiStartupControllerFje b17KqmControllerVza) {
            return b17PqnProgressWidgetVxe(
              b17KqmControllerVza.b17PqmProgressValueXra,
            );
          },
        ),
        SizedBox(height: 142.h),
      ],
    );
  }

  Widget b17PqnProgressWidgetVxe(double b17VqmProgressWza) {
    return Container(
      width: double.infinity,
      height: 16.h,
      margin: EdgeInsets.symmetric(horizontal: 62.w),
      child: LayoutBuilder(
        builder: (BuildContext b17HqmContextXve, BoxConstraints b17KqvBoxWza) {
          final double b17PqmTrackWidthXre = b17KqvBoxWza.maxWidth - 4.w;
          final double b17TqnSafeProgressVxa = b17VqmProgressWza.clamp(
            0.0,
            1.0,
          );
          return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            decoration: BoxDecoration(
              color: const Color(0xffebebeb),
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Container(
              width: b17PqmTrackWidthXre * b17TqnSafeProgressVxa,
              height: 12.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                gradient: const LinearGradient(
                  colors: [Color(0xffff8e71), Color(0xffa77ff1)],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
