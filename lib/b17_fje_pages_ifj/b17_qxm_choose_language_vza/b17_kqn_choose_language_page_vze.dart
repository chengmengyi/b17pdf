import 'dart:async';

import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jiw_ad_hep_djo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fje_language_hep_ifj/b17_fie_language_tools_ife.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_qxm_choose_language_vza/b17_hqm_choose_language_controller_wza.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_qaz_root_page_mtr.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_image_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_vny_media_padding_view_qsl.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17KqnChooseLanguagePageVze
    extends B17QazRootPageMtr<B17HqmChooseLanguageControllerWza> {
  const B17KqnChooseLanguagePageVze({super.key});
  @override
  B17HqmChooseLanguageControllerWza b17AhdCreateControllerWks() =>
      B17HqmChooseLanguageControllerWza();

  @override
  Widget b17RuzBuildContentNxe(
    BuildContext b17QxmContextVza,
    B17HqmChooseLanguageControllerWza b17KqnControllerVze,
  ) => GetBuilder<B17HqmChooseLanguageControllerWza>(
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
            SizedBox(height: 16.h),
            _b17VvdNativeAdWidgetWdp(),
            SizedBox(height: 16.h),
            _b17HqmTopWidgetWza(),
            SizedBox(height: 40.h),
            _b17KqnListWidgetVze(b17QxmControllerVza),
            SizedBox(height: 40.h),
            _b17VqnBottomWidgetTza(b17QxmControllerVza),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    ),
  );

  Widget _b17KqnListWidgetVze(
    B17HqmChooseLanguageControllerWza b17QxmControllerVza,
  ) => Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.w),
        border: Border.all(width: 0.5.w, color: const Color(0xffE0E3EA)),
      ),
      child: B17VnyMediaPaddingViewQsl(
        b17QzpChildMwa: ListView.builder(
          controller: b17QxmControllerVza.b17QxmLanguageScrollControllerVza,
          itemCount: b17QxmControllerVza.b17PqmLanguageListWza.length,
          itemBuilder: (b17KqnContextVze, b17VqnIndexTza) {
            final B17QxmLanguageItemVza b17PqmItemWza =
                b17QxmControllerVza.b17PqmLanguageListWza[b17VqnIndexTza];
            final b17HqmSelectedWza = b17QxmControllerVza.b17PqmIsSelectedXza(
              b17PqmItemWza,
            );
            return B17MfwTapGuardViewQke(
              b17JkcOnPressedXwu: () =>
                  b17QxmControllerVza.b17HqmClickLanguageWza(b17PqmItemWza),
              b17HnqChildVsa: SizedBox(
                height: 56.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      B17PzrAssetImageViewXcu(
                        b17PqmItemWza.b17HqmIconWza,
                        b17DtvWidthQpl: 32.w,
                        b17RnxHeightKse: 32.w,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: B17CxmLocalizedTextViewPra(
                          b17PqmItemWza.b17KqnNameVze,
                          b17RvxFontSizeQle: 14.sp,
                          b17DtkColorZma: const Color(0xff060E23),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      B17PzrAssetImageViewXcu(
                        b17HqmSelectedWza
                            ? 'b17_nmt_sel_icon_zml'
                            : 'b17_qug_uns_icon_jxa',
                        b17DtvWidthQpl: 24.w,
                        b17RnxHeightKse: 24.w,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ),
  );

  Widget _b17VqnBottomWidgetTza(
    B17HqmChooseLanguageControllerWza b17QxmControllerVza,
  ) => B17MfwTapGuardViewQke(
    b17JkcOnPressedXwu: b17QxmControllerVza.b17PooClickOkUto,
    b17HnqChildVsa: Container(
      width: double.infinity,
      height: 48.h,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.w),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff06B3F2), Color(0xff002DF6)],
        ),
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
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      B17PzrAssetImageViewXcu(
        'b17_nqm_language_top_image_vza',
        b17DtvWidthQpl: 72.w,
        b17RnxHeightKse: 72.w,
      ),
      SizedBox(height: 12.h),
      B17CxmLocalizedTextViewPra(
        'Welcome'.tr,
        b17RvxFontSizeQle: 32.sp,
        b17DtkColorZma: Colors.black,
        b17HncFontWeightYsp: FontWeight.bold,
      ),
      B17CxmLocalizedTextViewPra(
        'Choose your preferred language to get started.'.tr,
        b17RvxFontSizeQle: 16.sp,
        b17DtkColorZma: const Color(0xff858C92),
        b17HncFontWeightYsp: FontWeight.w500,
      ),
    ],
  );

  Widget _b17VvdNativeAdWidgetWdp() => const _B17VqnChooseLanguageNativeAdTza();
}

class _B17VqnChooseLanguageNativeAdTza extends StatefulWidget {
  const _B17VqnChooseLanguageNativeAdTza();

  @override
  State<_B17VqnChooseLanguageNativeAdTza> createState() =>
      _B17HqmChooseLanguageNativeAdStateWza();
}

class _B17HqmChooseLanguageNativeAdStateWza
    extends State<_B17VqnChooseLanguageNativeAdTza> {
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
    final B17JiwAdHepDjo b17KqmAdHepWze =
        B17JiwAdHepDjo.b17KqmAdUtilsInstanceVzr;
    final bool b17PqnCanShowAdVze = await b17KqmAdHepWze
        .b17VqnCanShowAdBySwitchTza(B17JkwPosidKos.pr_new_lan_nat);
    if (!mounted || !b17PqnCanShowAdVze) return;
    setState(() => _b17VqnCanShowAdTza = true);
    b17KqmAdHepWze.b17KqnUploadAdChanceVxe(
      b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_ban1,
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
      final Widget? b17KqnAdWidgetVxe = await B17JiwAdHepDjo
          .b17KqmAdUtilsInstanceVzr
          .b17PqmBuildCachedNativeAdWidgetVzr(
            b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_ban1,
            b17KqmAdPosIdVzr: B17JkwPosidKos.pr_new_lan_nat,
          );
      if (!mounted || b17KqnAdWidgetVxe == null) {
        return;
      }
      _b17KqmRetryTimerWze?.cancel();
      _b17KqmRetryTimerWze = null;
      setState(() {
        _b17VqnAdWidgetTza = b17KqnAdWidgetVxe;
      });
      unawaited(
        B17JiwAdHepDjo.b17KqmAdUtilsInstanceVzr
            .b17PqmRequestFilesListNativeAdVzr(),
      );
    } finally {
      _b17HqmCheckingAdWza = false;
    }
  }

  @override
  Widget build(BuildContext b17QxnContextVza) {
    if (!_b17VqnCanShowAdTza) return const SizedBox.shrink();
    return SizedBox(
      width: double.infinity,
      height: 58.h,
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
