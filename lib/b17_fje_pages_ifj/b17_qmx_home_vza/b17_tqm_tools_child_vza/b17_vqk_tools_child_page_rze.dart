import 'package:b17pdf/b17_fje_pages_ifj/b17_qmx_home_vza/b17_tqm_tools_child_vza/b17_hpn_tools_child_controller_xwe.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_qxn_add_widget_hep_vza/b17_kqm_add_widget_hep_vze.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_qxm_images_hep_vza/b17_kqm_images_hep_wze.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_mxk_root_child_qza.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_image_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17VqkToolsChildPageRze extends B17MxkRootChildQza {
  const B17VqkToolsChildPageRze({super.key});

  @override
  State<B17VqkToolsChildPageRze> createState() => _B17MqnToolsChildStateVxa();
}

class _B17MqnToolsChildStateVxa
    extends
        B17PrvRootChildStateWlt<
          B17HpnToolsChildControllerXwe,
          B17VqkToolsChildPageRze
        > {
  @override
  B17HpnToolsChildControllerXwe b17NwzCreateControllerTpi() {
    return B17HpnToolsChildControllerXwe();
  }

  @override
  Widget b17YksBuildContentUvd(
    BuildContext b17KqmContextWza,
    B17HpnToolsChildControllerXwe b17VqmControllerXre,
  ) {
    return GetBuilder<B17HpnToolsChildControllerXwe>(
      init: b17VqmControllerXre,
      global: false,
      builder: (b17QxmControllerVza) => Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: B17PzrAssetImageViewXcu(
              "b17_fje_tools_top_bg_ifi",
              b17DtvWidthQpl: 200.w,
              b17RnxHeightKse: 120.h,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(left: 8.w, right: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _b17KprTitleWidgetDnm(),
                  SizedBox(height: 10.h),
                  _b17DhnToolsWidgetQfv(),
                  SizedBox(height: 8.h),
                  _b17CaqSystemWidgetUas(),
                  SizedBox(height: 8.h),
                  _b17MvePreferenceWidgetRka(b17QxmControllerVza),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _b17DhnToolsWidgetQfv() => Container(
    width: double.infinity,
    padding: EdgeInsets.all(8.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.w),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 8.w),
            B17PzrAssetImageViewXcu(
              "b17_fji_tools_icon_ejf",
              b17DtvWidthQpl: 24.w,
              b17RnxHeightKse: 24.w,
            ),
            SizedBox(width: 8.w),
            B17CxmLocalizedTextViewPra(
              "PDF tools".tr,
              b17RvxFontSizeQle: 14.sp,
              b17DtkColorZma: Colors.black,
              b17HncFontWeightYsp: FontWeight.bold,
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: B17MfwTapGuardViewQke(
                b17JkcOnPressedXwu: () {
                  B17KqmImagesHepWze.instance.b17BonToScanZjx();
                },
                b17HnqChildVsa: Container(
                  width: double.infinity,
                  height: 72.h,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.w),
                    border: Border.all(width: 0.5.w, color: Color(0xffEBEBEB)),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10.w),
                      B17PzrAssetImageViewXcu(
                        "b17_fji_scan_to_pdf_efo",
                        b17DtvWidthQpl: 52.w,
                        b17RnxHeightKse: 60.h,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            B17CxmLocalizedTextViewPra(
                              "Scan To".tr,
                              b17RvxFontSizeQle: 14.sp,
                              b17DtkColorZma: Colors.black,
                            ),
                            B17CxmLocalizedTextViewPra(
                              "PDF".tr,
                              b17RvxFontSizeQle: 18.sp,
                              b17DtkColorZma: Colors.black,
                              b17HncFontWeightYsp: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: B17MfwTapGuardViewQke(
                b17JkcOnPressedXwu: () {
                  B17KqmImagesHepWze.instance.b17McvChooseImagesXri();
                },
                b17HnqChildVsa: Container(
                  width: double.infinity,
                  height: 72.h,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.w),
                    border: Border.all(width: 0.5.w, color: Color(0xffEBEBEB)),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10.w),
                      B17PzrAssetImageViewXcu(
                        "b17_fji_image_to_pdf_efj",
                        b17DtvWidthQpl: 52.w,
                        b17RnxHeightKse: 60.h,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            B17CxmLocalizedTextViewPra(
                              "Image To".tr,
                              b17RvxFontSizeQle: 14.sp,
                              b17DtkColorZma: Colors.black,
                            ),
                            B17CxmLocalizedTextViewPra(
                              "PDF".tr,
                              b17RvxFontSizeQle: 18.sp,
                              b17DtkColorZma: Colors.black,
                              b17HncFontWeightYsp: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _b17CaqSystemWidgetUas() => Container(
    width: double.infinity,
    padding: EdgeInsets.all(8.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.w),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 8.w),
            B17PzrAssetImageViewXcu(
              "b17_fji_system_icon_ejf",
              b17DtvWidthQpl: 24.w,
              b17RnxHeightKse: 24.w,
            ),
            SizedBox(width: 8.w),
            B17CxmLocalizedTextViewPra(
              "System".tr,
              b17RvxFontSizeQle: 14.sp,
              b17DtkColorZma: Colors.black,
              b17HncFontWeightYsp: FontWeight.bold,
            ),
          ],
        ),
        SizedBox(height: 12.h),
        B17MfwTapGuardViewQke(
          b17JkcOnPressedXwu: () {
            B17KqmAddWidgetHepVze.instance.b17EerShowAddWidgetDialogLxc();
          },
          b17HnqChildVsa: Container(
            width: double.infinity,
            height: 56.h,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              border: Border.all(width: 0.5.w, color: Color(0xffEBEBEB)),
            ),
            child: Row(
              children: [
                SizedBox(width: 12.w),
                B17PzrAssetImageViewXcu(
                  "b17_fji_add_widget_icon_ejf",
                  b17DtvWidthQpl: 32.w,
                  b17RnxHeightKse: 32.w,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: B17CxmLocalizedTextViewPra(
                    "Add Widget".tr,
                    b17RvxFontSizeQle: 14.sp,
                    b17DtkColorZma: Colors.black,
                    b17HncFontWeightYsp: FontWeight.w500,
                  ),
                ),
                B17PzrAssetImageViewXcu(
                  "b17_fjo_add_icon_efe",
                  b17DtvWidthQpl: 24.w,
                  b17RnxHeightKse: 24.w,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  Widget _b17MvePreferenceWidgetRka(
    B17HpnToolsChildControllerXwe b17VqmcontrollerXre,
  ) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(8.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.w),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 8.w),
            B17PzrAssetImageViewXcu(
              "b17_fji_pre_icon_efj",
              b17DtvWidthQpl: 24.w,
              b17RnxHeightKse: 24.w,
            ),
            SizedBox(width: 8.w),
            B17CxmLocalizedTextViewPra(
              "Preference".tr,
              b17RvxFontSizeQle: 14.sp,
              b17DtkColorZma: Colors.black,
              b17HncFontWeightYsp: FontWeight.bold,
            ),
          ],
        ),
        SizedBox(height: 12.h),
        B17MfwTapGuardViewQke(
          b17JkcOnPressedXwu: () {
            b17VqmcontrollerXre.b17JwoClickChangeLanguageIat();
          },
          b17HnqChildVsa: Container(
            width: double.infinity,
            height: 56.h,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              border: Border.all(width: 0.5.w, color: Color(0xffEBEBEB)),
            ),
            child: Row(
              children: [
                SizedBox(width: 12.w),
                B17PzrAssetImageViewXcu(
                  "b17_gmn_lan_icon_bzl",
                  b17DtvWidthQpl: 32.w,
                  b17RnxHeightKse: 32.w,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: B17CxmLocalizedTextViewPra(
                    "App Language".tr,
                    b17RvxFontSizeQle: 14.sp,
                    b17DtkColorZma: Colors.black,
                    b17HncFontWeightYsp: FontWeight.w500,
                  ),
                ),
                B17CxmLocalizedTextViewPra(
                  b17VqmcontrollerXre.b17QxmCurrentLanguageNameVza,
                  b17RvxFontSizeQle: 12.sp,
                  b17DtkColorZma: Color(0xff858C92),
                  b17HncFontWeightYsp: FontWeight.w500,
                ),
                SizedBox(width: 4.w),
                B17PzrAssetImageViewXcu(
                  "b17_ksp_right_wkp",
                  b17DtvWidthQpl: 16.w,
                  b17RnxHeightKse: 16.w,
                ),
                SizedBox(width: 4.w),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  Widget _b17KprTitleWidgetDnm() => SafeArea(
    top: true,
    bottom: false,
    child: B17CxmLocalizedTextViewPra(
      "Tools & Settings".tr,
      b17RvxFontSizeQle: 28.sp,
      b17DtkColorZma: Colors.black,
      b17HncFontWeightYsp: FontWeight.bold,
    ),
  );
}
