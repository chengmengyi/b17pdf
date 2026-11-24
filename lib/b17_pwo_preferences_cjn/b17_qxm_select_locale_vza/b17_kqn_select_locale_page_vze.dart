import 'dart:async';

import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fje_localization_ifj/b17_fie_locale_utilities_ife.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_qxm_select_locale_vza/b17_hqm_select_locale_controller_wza.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_qaz_base_page_mtr.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_vny_media_padding_view_qsl.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17KqnSelectLocalePageVze
    extends B17QazBasePageMtr<B17HqmSelectLocaleControllerWza> {
  const B17KqnSelectLocalePageVze({super.key});
  @override
  B17HqmSelectLocaleControllerWza b17AhdCreateControllerWks() =>
      B17HqmSelectLocaleControllerWza();

  @override
  Widget b17RuzBuildContentNxe(
    BuildContext b17QxmContextVza,
    B17HqmSelectLocaleControllerWza b17KqnControllerVze,
  ) => Stack(
    alignment: Alignment.topCenter,
    children: [
      B17PzrAssetPictureViewXcu(
        "b17_choose_locale_top_bg_dhi",
        b17DtvWidthQpl: double.infinity,
        b17RnxHeightKse: 264.h,
      ),
      GetBuilder<B17HqmSelectLocaleControllerWza>(
        init: b17KqnControllerVze,
        global: false,
        builder: (b17QxmControllerVza) => Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SafeArea(
            top: true,
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _b17HqmTopWidgetWza(),
                SizedBox(height: 10.h),
                _b17KqnListWidgetVze(b17QxmControllerVza),
                SizedBox(height: 10.h),
                _b17VqnBottomWidgetTza(b17QxmControllerVza, b17QxmContextVza),
                SizedBox(height: 16.h),
                _b17VvdNativeAdWidgetWdp(),
              ],
            ),
          ),
        ),
      ),
    ],
  );

  Widget _b17KqnListWidgetVze(
    B17HqmSelectLocaleControllerWza b17QxmControllerVza,
  ) => Expanded(
    child: B17VnyMediaPaddingViewQsl(
      b17QzpChildMwa: ListView.builder(
        controller: b17QxmControllerVza.b17QxmLanguageScrollControllerVza,
        itemCount: b17QxmControllerVza.b17PqmLanguageListWza.length,
        itemBuilder: (b17KqnContextVze, b17VqnIndexTza) {
          final B17QxmLocaleItemVza b17PqmItemWza =
              b17QxmControllerVza.b17PqmLanguageListWza[b17VqnIndexTza];
          final b17HqmSelectedWza = b17QxmControllerVza.b17PqmIsSelectedXza(
            b17PqmItemWza,
          );
          return B17MfwTapGuardViewQke(
            b17JkcOnPressedXwu: () =>
                b17QxmControllerVza.b17HqmClickLanguageWza(b17PqmItemWza),
            b17HnqChildVsa: SizedBox(
              height: 70.h,
              child: Row(
                children: [
                  B17PzrAssetPictureViewXcu(
                    b17PqmItemWza.b17HqmIconWza,
                    b17DtvWidthQpl: 38.w,
                    b17RnxHeightKse: 38.w,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: B17CxmLocalizedTextViewPra(
                      b17PqmItemWza.b17KqnNameVze,
                      b17RvxFontSizeQle: 14.sp,
                      b17DtkColorZma: const Color(0xff090A0A),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  B17PzrAssetPictureViewXcu(
                    b17HqmSelectedWza
                        ? 'b17_nmt_selected_icon_asset_zml'
                        : 'b17_qug_unselected_icon_asset_jxa',
                    b17DtvWidthQpl: 24.w,
                    b17RnxHeightKse: 24.w,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );

  Widget _b17VqnBottomWidgetTza(
    B17HqmSelectLocaleControllerWza b17QxmControllerVza,
    BuildContext b17QxnContextVza,
  ) => B17MfwTapGuardViewQke(
    b17JkcOnPressedXwu: () =>
        b17QxmControllerVza.b17PooClickOkUto(b17QxnContextVza),
    b17HnqChildVsa: Container(
      width: double.infinity,
      height: 46.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xffD12629),
        borderRadius: BorderRadius.circular(42.w),
      ),
      child: B17CxmLocalizedTextViewPra(
        'OK'.tr,
        b17RvxFontSizeQle: 18.sp,
        b17DtkColorZma: Colors.white,
        b17HncFontWeightYsp: FontWeight.bold,
      ),
    ),
  );

  Widget _b17HqmTopWidgetWza() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: double.infinity,
        height: 56.h,
        alignment: Alignment.center,
        child: B17CxmLocalizedTextViewPra(
          'Choose Language'.tr,
          b17RvxFontSizeQle: 16.sp,
          b17DtkColorZma: Color(0xff242C3C),
          b17HncFontWeightYsp: FontWeight.bold,
        ),
      ),
      B17CxmLocalizedTextViewPra(
        'Choose your preferred language to get started.'.tr,
        b17RvxFontSizeQle: 16.sp,
        b17DtkColorZma: const Color(0xff555978),
        b17HncFontWeightYsp: FontWeight.w500,
      ),
    ],
  );

  Widget _b17VvdNativeAdWidgetWdp() => const _B17VqnSelectLocaleNativeAdTza();
}

class _B17VqnSelectLocaleNativeAdTza extends StatefulWidget {
  const _B17VqnSelectLocaleNativeAdTza();

  @override
  State<_B17VqnSelectLocaleNativeAdTza> createState() =>
      _B17HqmSelectLocaleNativeAdStateWza();
}

class _B17HqmSelectLocaleNativeAdStateWza
    extends State<_B17VqnSelectLocaleNativeAdTza> {
  static const Duration _b17QxnRetryDurationVza = Duration(milliseconds: 500);

  Timer? _b17KqmRetryTimerWze;
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
        .b17VqnCanShowAdBySwitchTza(B17JkwPosidKos.pr_new_lan_nat);
    if (!mounted || !b17PqnCanShowAdVze) return;
    setState(() => _b17VqnCanShowAdTza = true);
    b17KqmAdHepWze.b17KqnUploadAdChanceVxe(
      b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_ban2,
      b17KqmAdPosIdVzr: B17JkwPosidKos.pr_new_lan_nat,
    );
    unawaited(_b17PqnTryTakeAdWidgetVze());
    _b17KqmRetryTimerWze = Timer.periodic(
      _b17QxnRetryDurationVza,
      (_) => unawaited(_b17PqnTryTakeAdWidgetVze()),
    );
  }

  Future<void> _b17PqnTryTakeAdWidgetVze() async {
    if (_b17VqnAdWidgetTza != null || _b17HqmCheckingAdWza) {
      return;
    }
    _b17HqmCheckingAdWza = true;
    try {
      final Widget? b17KqnAdWidgetVxe = await B17JiwAdFuncDjo
          .b17KqmAdUtilsInstanceVzr
          .b17PqmTakeCachedNativeAdWidgetVzr(
            b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_ban2,
            b17KqmAdPosIdVzr: B17JkwPosidKos.pr_new_lan_nat,
            b17PqmReloadAfterTakeVzr: true,
          );
      if (!mounted || b17KqnAdWidgetVxe == null) {
        return;
      }
      _b17KqmRetryTimerWze?.cancel();
      _b17KqmRetryTimerWze = null;
      setState(() {
        _b17VqnAdWidgetTza = b17KqnAdWidgetVxe;
      });
    } finally {
      _b17HqmCheckingAdWza = false;
    }
  }

  @override
  Widget build(BuildContext b17QxnContextVza) {
    if (!_b17VqnCanShowAdTza) return const SizedBox.shrink();
    if(null==_b17VqnAdWidgetTza){
      return SizedBox(
        width: double.infinity,
        height: 58.h,
      );
    }
    return Container(
      width: double.infinity,
      height: 58.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        border: Border.all(
          width: 1.w,
          color: Colors.black,
        ),
      ),
      child: _b17VqnAdWidgetTza ?? const SizedBox.shrink(),
    );
  }

  @override
  void dispose() {
    _b17KqmRetryTimerWze?.cancel();
    _b17KqmRetryTimerWze = null;
    super.dispose();
  }
}
