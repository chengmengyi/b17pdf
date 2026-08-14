import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_kfm_startup_oqa/b17_fji_startup_controller_fje.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_qaz_base_page_mtr.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_cxm_localized_text_view_pra.dart';
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
          b17DtkColorZma: Color(0xff242C3C),
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
        SizedBox(height: 100.h),
      ],
    );
  }

  Widget b17PqnProgressWidgetVxe(double b17VqmProgressWza) {
    final double b17TqnSafeProgressVxa = b17VqmProgressWza.clamp(0.0, 1.0);
    final int b17KqnProgressPercentVze = (b17TqnSafeProgressVxa * 100).round();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          height: 6.h,
          margin: EdgeInsets.symmetric(horizontal: 32.w),
          child: LayoutBuilder(
            builder:
                (BuildContext b17HqmContextXve, BoxConstraints b17KqvBoxWza) {
                  final double b17PqmTrackWidthXre =
                      b17KqvBoxWza.maxWidth - 4.w;
                  return Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: const Color(0xffCAD5E0),
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    child: Container(
                      width: b17PqmTrackWidthXre * b17TqnSafeProgressVxa,
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
        SizedBox(height: 10.h),
        B17CxmLocalizedTextViewPra(
          '$b17KqnProgressPercentVze%',
          b17RvxFontSizeQle: 16.sp,
          b17DtkColorZma: Color(0xff242C3C),
          b17HncFontWeightYsp: FontWeight.bold,
        ),
      ],
    );
  }
}
