import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_kfm_startup_oqa/b17_pqn_open_ad_loading_controller_vze.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_qaz_base_page_mtr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17RqmOpenAdLoadingPageXza
    extends B17QazBasePageMtr<B17PqnOpenAdLoadingControllerVze> {
  B17RqmOpenAdLoadingPageXza({super.key})
    : _b17PqmControllerTagVzr =
          'b17_open_ad_loading_${_b17KqmNextControllerIdWze++}';

  static int _b17KqmNextControllerIdWze = 0;
  final String _b17PqmControllerTagVzr;

  @override
  String get b17HjrControllerTagXwa => _b17PqmControllerTagVzr;

  @override
  B17PqnOpenAdLoadingControllerVze b17AhdCreateControllerWks() =>
      B17PqnOpenAdLoadingControllerVze();

  @override
  Future<bool> b17YmeAllowRoutePopJcu(
    B17PqnOpenAdLoadingControllerVze b17TbnControllerYui,
  ) async => false;

  @override
  Widget b17RuzBuildContentNxe(
    BuildContext b17CmvContextQer,
    B17PqnOpenAdLoadingControllerVze b17TbnControllerYui,
  ) {
    return Column(
      children: <Widget>[
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
          b17DtkColorZma: const Color(0xff242C3C),
          b17HncFontWeightYsp: FontWeight.bold,
        ),
        const Spacer(),
        GetBuilder<B17PqnOpenAdLoadingControllerVze>(
          tag: b17HjrControllerTagXwa,
          id: B17PqnOpenAdLoadingControllerVze.b17RqmProgressUpdateIdXza,
          builder: (B17PqnOpenAdLoadingControllerVze b17PqmControllerVzr) =>
              _b17KqmBuildProgressWze(b17PqmControllerVzr.b17VqnProgressTza),
        ),
        SizedBox(height: 120.h),
      ],
    );
  }

  Widget _b17KqmBuildProgressWze(double b17VqnProgressTza) {
    final double b17PqmSafeProgressVzr = b17VqnProgressTza.clamp(0.0, 1.0);
    return Container(
      width: double.infinity,
      height: 12.h,
      margin: EdgeInsets.symmetric(horizontal: 50.w),
      child: LayoutBuilder(
        builder: (BuildContext b17VqnContextTza, BoxConstraints b17KqmBoxWze) {
          final double b17PqmTrackWidthVzr = b17KqmBoxWze.maxWidth - 4.w;
          return Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: const Color(0xffF5F7F9),
              borderRadius: BorderRadius.circular(6.w),
            ),
            child: AnimatedContainer(
              duration: B17PqnOpenAdLoadingControllerVze.b17KqmTickIntervalWze,
              width: b17PqmTrackWidthVzr * b17PqmSafeProgressVzr,
              height: 8.h,
              decoration: BoxDecoration(
                color: const Color(0xffD12629),
                borderRadius: BorderRadius.circular(4.w),
              ),
            ),
          );
        },
      ),
    );
  }
}
