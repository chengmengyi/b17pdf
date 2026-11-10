import 'dart:async';

import 'package:b17pdf/b17_pwo_preferences_cjn/b17_pqn_guide_vze/b17_hqm_guide_controller_wza.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_mfw_tap_guard_view_qke.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_qaz_base_page_mtr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class B17KqnGuidePageVze extends B17QazBasePageMtr<B17HqmGuideControllerWza> {
  const B17KqnGuidePageVze({super.key});

  @override
  B17HqmGuideControllerWza b17AhdCreateControllerWks() =>
      B17HqmGuideControllerWza();

  @override
  Widget b17RuzBuildContentNxe(
    BuildContext b17QxnContextVza,
    B17HqmGuideControllerWza b17KqmControllerWze,
  ) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 120.h),
          Expanded(
            child: GetBuilder<B17HqmGuideControllerWza>(
              init: b17KqmControllerWze,
              global: false,
              id: B17HqmGuideControllerWza.b17QxnNativeAdEligibilityUpdateIdVza,
              builder: (B17HqmGuideControllerWza b17QxnControllerVza) =>
                  PageView(
                    controller: b17QxnControllerVza.b17QxnPageControllerVza,
                    onPageChanged: (int b17QxnPageIndexVza) =>
                        b17QxnControllerVza.b17RqmOnPageChangedWza(
                          b17QxnPageIndexVza,
                          b17QxnContextVza,
                        ),
                    children: <Widget>[
                      _b17VqnGuideOneWidgetTza(
                        b17QxnControllerVza.b17RqmCanShowNativeAdWza,
                      ),
                      _b17KqmGuideTwoWidgetWze(
                        b17QxnControllerVza.b17RqmCanShowNativeAdWza,
                      ),
                    ],
                  ),
            ),
          ),
          SizedBox(height: 20.h),
          _indicatorWidget(b17KqmControllerWze),
          SizedBox(height: 20.h),
          _b17PqnBottomWidgetVze(b17KqmControllerWze, b17QxnContextVza),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _indicatorWidget(B17HqmGuideControllerWza b17QxnControllerVza) {
    return SmoothPageIndicator(
      controller: b17QxnControllerVza.b17QxnPageControllerVza,
      count: 2,
      effect: ExpandingDotsEffect(
        dotWidth: 8.w,
        dotHeight: 8.w,
        spacing: 8.w,
        expansionFactor: 2,
        dotColor: const Color(0xffCAD5E0),
        activeDotColor: const Color(0xff2897F3),
      ),
    );
  }

  Widget _b17VqnGuideOneWidgetTza(bool b17QxnCanShowNativeAdVza) => Column(
    children: <Widget>[
      B17PzrAssetPictureViewXcu(
        'b17_fji_capture_to_pdf_asset_efo',
        b17DtvWidthQpl: 272.w,
        b17RnxHeightKse: 272.w,
      ),
      SizedBox(height: 20.h),
      B17CxmLocalizedTextViewPra(
        'Scan Anything',
        b17VnhTranslateXre: true,
        b17RvxFontSizeQle: 18.sp,
        b17DtkColorZma: const Color(0xff242C3C),
        b17HncFontWeightYsp: FontWeight.bold,
      ),
      SizedBox(height: 20.h),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 32.w),
        child: B17CxmLocalizedTextViewPra(
          'Turn physical contracts, receipts, and notes into crystal-clear PDFs in seconds.',
          b17VnhTranslateXre: true,
          b17RvxFontSizeQle: 14.sp,
          b17DtkColorZma: const Color(0xff555978),
          b17HncFontWeightYsp: FontWeight.w500,
          b17JkwTextAlignZdu: TextAlign.center,
        ),
      ),
      SizedBox(height: 20.h),
      if (b17QxnCanShowNativeAdVza)
        const _B17QxnGuideNativeAdVza(
          key: ValueKey<String>('b17_guide_native_ad_1'),
          b17QxnAdSceneVza: B17EipAdSceneUkg.pr_ban1,
          b17VqnAdPosIdTza: B17JkwPosidKos.pr_guide1,
        ),
    ],
  );

  Widget _b17KqmGuideTwoWidgetWze(bool b17QxnCanShowNativeAdVza) => Column(
    children: <Widget>[
      B17PzrAssetPictureViewXcu(
        'b17_gpf_pdf_logo_asset_tpd',
        b17DtvWidthQpl: 272.w,
        b17RnxHeightKse: 272.w,
      ),
      SizedBox(height: 20.h),
      B17CxmLocalizedTextViewPra(
        'Edit & Sign',
        b17VnhTranslateXre: true,
        b17RvxFontSizeQle: 18.sp,
        b17DtkColorZma: const Color(0xff242C3C),
        b17HncFontWeightYsp: FontWeight.bold,
      ),
      SizedBox(height: 20.h),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 32.w),
        child: B17CxmLocalizedTextViewPra(
          'Annotate documents, add your signature, and fill out forms directly on your device.',
          b17VnhTranslateXre: true,
          b17RvxFontSizeQle: 14.sp,
          b17DtkColorZma: const Color(0xff555978),
          b17HncFontWeightYsp: FontWeight.w500,
          b17JkwTextAlignZdu: TextAlign.center,
        ),
      ),
      SizedBox(height: 20.h),
      if (b17QxnCanShowNativeAdVza)
        const _B17QxnGuideNativeAdVza(
          key: ValueKey<String>('b17_guide_native_ad_2'),
          b17QxnAdSceneVza: B17EipAdSceneUkg.pr_ban2,
          b17VqnAdPosIdTza: B17JkwPosidKos.pr_guide2,
        ),
    ],
  );

  Widget _b17PqnBottomWidgetVze(
    B17HqmGuideControllerWza b17QxnControllerVza,
    BuildContext b17QxnContextVza,
  ) {
    return B17MfwTapGuardViewQke(
      b17JkcOnPressedXwu: () =>
          b17QxnControllerVza.b17VqnClickBottomTza(b17QxnContextVza),
      b17HnqChildVsa: Container(
        width: 240.w,
        height: 46.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xffD12629),
          borderRadius: BorderRadius.circular(26.w),
        ),
        child: B17CxmLocalizedTextViewPra(
          'Next',
          b17VnhTranslateXre: true,
          b17RvxFontSizeQle: 18.sp,
          b17DtkColorZma: Colors.white,
          b17HncFontWeightYsp: FontWeight.bold,
        ),
      ),
    );
  }
}

class _B17QxnGuideNativeAdVza extends StatefulWidget {
  const _B17QxnGuideNativeAdVza({
    super.key,
    required this.b17QxnAdSceneVza,
    required this.b17VqnAdPosIdTza,
  });

  final B17EipAdSceneUkg b17QxnAdSceneVza;
  final B17JkwPosidKos b17VqnAdPosIdTza;

  @override
  State<_B17QxnGuideNativeAdVza> createState() =>
      _B17VqnGuideNativeAdStateTza();
}

class _B17VqnGuideNativeAdStateTza extends State<_B17QxnGuideNativeAdVza>
    with AutomaticKeepAliveClientMixin<_B17QxnGuideNativeAdVza> {
  static const Duration _b17QxnRetryDurationVza = Duration(milliseconds: 500);

  Timer? _b17KqmRetryTimerWze;
  Widget? _b17VqnAdWidgetTza;
  bool _b17HqmCheckingAdWza = false;
  bool _b17VqnCanShowAdTza = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    unawaited(_b17QxnInitializeNativeAdVza());
  }

  Future<void> _b17QxnInitializeNativeAdVza() async {
    final B17JiwAdFuncDjo b17KqmAdFuncWze =
        B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr;
    final bool b17PqnCanShowAdVze = await b17KqmAdFuncWze
        .b17VqnCanShowAdBySwitchTza(widget.b17VqnAdPosIdTza);
    if (!mounted || !b17PqnCanShowAdVze) return;
    setState(() => _b17VqnCanShowAdTza = true);
    b17KqmAdFuncWze.b17KqnUploadAdChanceVxe(
      b17PqmAdSceneVzr: widget.b17QxnAdSceneVza,
      b17KqmAdPosIdVzr: widget.b17VqnAdPosIdTza,
    );
    unawaited(_b17KqmTryBuildAdWidgetWze());
    _b17KqmRetryTimerWze = Timer.periodic(
      _b17QxnRetryDurationVza,
      (_) => unawaited(_b17KqmTryBuildAdWidgetWze()),
    );
  }

  Future<void> _b17KqmTryBuildAdWidgetWze() async {
    if (_b17VqnAdWidgetTza != null || _b17HqmCheckingAdWza) return;
    _b17HqmCheckingAdWza = true;
    try {
      final Widget? b17QxnAdWidgetVza = await B17JiwAdFuncDjo
          .b17KqmAdUtilsInstanceVzr
          .b17PqmTakeCachedNativeAdWidgetVzr(
            b17PqmAdSceneVzr: widget.b17QxnAdSceneVza,
            b17KqmAdPosIdVzr: widget.b17VqnAdPosIdTza,
            b17PqmReloadAfterTakeVzr: true,
          );
      if (!mounted || b17QxnAdWidgetVza == null) return;
      _b17KqmRetryTimerWze?.cancel();
      _b17KqmRetryTimerWze = null;
      setState(() => _b17VqnAdWidgetTza = b17QxnAdWidgetVza);
    } finally {
      _b17HqmCheckingAdWza = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (!_b17VqnCanShowAdTza) return const SizedBox.shrink();
    return SizedBox(
      width: double.infinity,
      height: 58.h,
      child:
          _b17VqnAdWidgetTza ??
          const B17PzrAssetPictureViewXcu(
            'b17_kqn_native_advert_cover_asset_vze',
            b17DtvWidthQpl: double.infinity,
          ),
    );
  }

  @override
  void dispose() {
    _b17KqmRetryTimerWze?.cancel();
    _b17KqmRetryTimerWze = null;
    super.dispose();
  }
}
