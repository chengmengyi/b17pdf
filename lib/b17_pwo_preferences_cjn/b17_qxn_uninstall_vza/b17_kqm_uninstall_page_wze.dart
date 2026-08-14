import 'dart:async';

import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_qxn_uninstall_vza/b17_vqn_uninstall_controller_tza.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_qaz_base_page_mtr.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_vny_media_padding_view_qsl.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17KqmUninstallPageWze
    extends B17QazBasePageMtr<B17VqnUninstallControllerTza> {
  const B17KqmUninstallPageWze({super.key});

  @override
  B17VqnUninstallControllerTza b17AhdCreateControllerWks() {
    return B17VqnUninstallControllerTza();
  }

  @override
  Color get b17LxqNavigationBarColorVbi => Colors.white;

  @override
  Widget b17RuzBuildContentNxe(
    BuildContext b17VqmContextWza,
    B17VqnUninstallControllerTza b17KqmControllerXve,
  ) {
    return Column(
      children: [
        _b17KprTitleWidgetDnm(b17KqmControllerXve),
        SizedBox(height: 8.h),
        _b17IpmContentWidgetRmp(b17KqmControllerXve),
        _b17AgdBottomWidgetHkw(b17KqmControllerXve),
        _b17PqnNativeAdWidgetVze(),
      ],
    );
  }

  Widget _b17PqnNativeAdWidgetVze() {
    if (!B17QxnUserCheckFuncVza.instance.b17VqnIsEligibleUserTza) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 14.h),
      child: const _B17VqmUninstallNativeAdWza(),
    );
  }

  Widget _b17IpmContentWidgetRmp(
    B17VqnUninstallControllerTza b17KqmcontrollerXve,
  ) => Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GetBuilder<B17VqnUninstallControllerTza>(
              id: B17VqnUninstallControllerTza.b17QxnReasonBuilderIdVza,
              builder: (b17QxmBuilderVza) => B17VnyMediaPaddingViewQsl(
                b17QzpChildMwa: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: b17QxmBuilderVza.reasonList.length,
                  itemBuilder: (context, index) {
                    final bool b17VqnSelectedTza =
                        b17QxmBuilderVza.b17KqmSelectedReasonIndexWze == index;
                    return B17MfwTapGuardViewQke(
                      b17JkcOnPressedXwu: () {
                        b17QxmBuilderVza.b17VqnClickReasonTza(index);
                      },
                      b17HnqChildVsa: Container(
                        width: double.infinity,
                        height: 48.h,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 16.w, right: 16.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: B17CxmLocalizedTextViewPra(
                                b17QxmBuilderVza.reasonList[index].tr,
                                b17RvxFontSizeQle: 14.sp,
                                b17DtkColorZma: Colors.black,
                                b17HncFontWeightYsp: FontWeight.bold,
                                b17FzrOverflowXke: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 16.w),
                            B17PzrAssetPictureViewXcu(
                              b17VqnSelectedTza
                                  ? "b17_nmt_selected_icon_asset_zml"
                                  : "b17_qug_unselected_icon_asset_jxa",
                              b17DtvWidthQpl: 24.w,
                              b17RnxHeightKse: 24.w,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(
                        width: double.infinity,
                        height: 0.5.h,
                        color: Color(0xffEBEBEB),
                      ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 120.h,
              padding: EdgeInsets.all(16.w),
              margin: EdgeInsets.only(left: 16.w, right: 16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                border: Border.all(width: 0.5.w, color: Color(0xffEBEBEB)),
              ),
              child: TextField(
                textAlign: TextAlign.start,
                enabled: true,
                controller: b17KqmcontrollerXve.textEditingController,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF1A1D22),
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  isCollapsed: true,
                  hintText:
                      'Please enter the reason for uninstalling All PDF'.tr,
                  hintStyle: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFFB2B2B2),
                    fontWeight: FontWeight.w500,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _b17AgdBottomWidgetHkw(
    B17VqnUninstallControllerTza b17KqmcontrollerXve,
  ) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      B17MfwTapGuardViewQke(
        b17JkcOnPressedXwu: b17KqmcontrollerXve.b17HqmClickNoUninstallWza,
        b17HnqChildVsa: Container(
          width: double.infinity,
          height: 50.h,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 34.w, right: 34.w),
          decoration: BoxDecoration(
            color: Color(0xffDF2019),
            borderRadius: BorderRadius.circular(22.w),
          ),
          child: B17CxmLocalizedTextViewPra(
            "Don't uninstall for now".tr,
            b17RvxFontSizeQle: 16.sp,
            b17DtkColorZma: Colors.white,
            b17HncFontWeightYsp: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(height: 14.h),
      B17MfwTapGuardViewQke(
        b17JkcOnPressedXwu: () {
          b17KqmcontrollerXve.b17OzhClickUninstallMzk();
        },
        b17HnqChildVsa: B17CxmLocalizedTextViewPra(
          "Uninstall".tr,
          b17RvxFontSizeQle: 16.sp,
          b17DtkColorZma: Color(0xff8C8E9C),
          b17HncFontWeightYsp: FontWeight.bold,
        ),
      ),
    ],
  );

  Widget _b17KprTitleWidgetDnm(
    B17VqnUninstallControllerTza b17QxmControllerVza,
  ) => Container(
    width: double.infinity,
    color: Colors.white,
    child: SafeArea(
      top: true,
      bottom: false,
      child: SizedBox(
        width: double.infinity,
        height: 44.h,
        child: Stack(
          children: [
            B17MfwTapGuardViewQke(
              b17JkcOnPressedXwu: b17QxmControllerVza.b17HqmClickNoUninstallWza,
              b17HnqChildVsa: Container(
                width: 44.w,
                height: 44.h,
                alignment: Alignment.center,
                child: B17PzrAssetPictureViewXcu(
                  "b17_oje_dismiss_icon_asset_bnl",
                  b17DtvWidthQpl: 24.w,
                  b17RnxHeightKse: 24.w,
                ),
              ),
            ),
            Align(
              child: Container(
                margin: EdgeInsets.only(left: 44.w, right: 44.w),
                child: B17CxmLocalizedTextViewPra(
                  "Uninstall reason".tr,
                  b17RvxFontSizeQle: 18.sp,
                  b17DtkColorZma: Colors.black,
                  b17HncFontWeightYsp: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _B17VqmUninstallNativeAdWza extends StatefulWidget {
  const _B17VqmUninstallNativeAdWza();

  @override
  State<_B17VqmUninstallNativeAdWza> createState() =>
      _B17KqnUninstallNativeAdStateVze();
}

class _B17KqnUninstallNativeAdStateVze
    extends State<_B17VqmUninstallNativeAdWza> {
  static const Duration _b17QxmRetryDurationVza = Duration(milliseconds: 500);

  Timer? _b17PqnRetryTimerVze;
  Widget? _b17VqnAdWidgetTza;
  bool _b17HqmCheckingAdWza = false;
  bool _b17VqnCanShowAdTza = false;

  @override
  void initState() {
    super.initState();
    unawaited(_b17QxmInitializeNativeAdVza());
  }

  Future<void> _b17QxmInitializeNativeAdVza() async {
    final B17JiwAdFuncDjo b17KqmAdHepWze =
        B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr;
    final bool b17PqnCanShowAdVze = await b17KqmAdHepWze
        .b17VqnCanShowAdBySwitchTza(B17JkwPosidKos.unload_nat1);
    if (!mounted || !b17PqnCanShowAdVze) return;
    setState(() => _b17VqnCanShowAdTza = true);
    b17KqmAdHepWze.b17KqnUploadAdChanceVxe(
      b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_ban2,
      b17KqmAdPosIdVzr: B17JkwPosidKos.unload_nat1,
    );
    unawaited(_b17KqmTryBuildAdWidgetWze());
    _b17PqnRetryTimerVze = Timer.periodic(
      _b17QxmRetryDurationVza,
      (_) => unawaited(_b17KqmTryBuildAdWidgetWze()),
    );
  }

  Future<void> _b17KqmTryBuildAdWidgetWze() async {
    if (_b17VqnAdWidgetTza != null || _b17HqmCheckingAdWza) {
      return;
    }
    _b17HqmCheckingAdWza = true;
    try {
      final Widget? b17PqmAdWidgetXza = await B17JiwAdFuncDjo
          .b17KqmAdUtilsInstanceVzr
          .b17PqmBuildCachedNativeAdWidgetVzr(
            b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_ban2,
            b17KqmAdPosIdVzr: B17JkwPosidKos.unload_nat1,
          );
      if (!mounted || b17PqmAdWidgetXza == null) {
        return;
      }
      _b17PqnRetryTimerVze?.cancel();
      _b17PqnRetryTimerVze = null;
      setState(() => _b17VqnAdWidgetTza = b17PqmAdWidgetXza);
    } finally {
      _b17HqmCheckingAdWza = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_b17VqnCanShowAdTza) return const SizedBox.shrink();
    return SizedBox(
      width: double.infinity,
      height: 56.h,
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
    _b17PqnRetryTimerVze?.cancel();
    _b17PqnRetryTimerVze = null;
    super.dispose();
  }
}
