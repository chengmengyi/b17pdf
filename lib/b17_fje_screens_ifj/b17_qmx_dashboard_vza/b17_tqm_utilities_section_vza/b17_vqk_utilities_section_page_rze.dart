import 'package:b17pdf/b17_fje_screens_ifj/b17_qmx_dashboard_vza/b17_tqm_utilities_section_vza/b17_hpn_utilities_section_controller_xwe.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_qxn_insert_widget_func_vza/b17_kqm_insert_widget_func_vze.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_qxm_pictures_func_vza/b17_kqm_pictures_func_wze.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_mxk_base_section_qza.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17VqkUtilitiesSectionPageRze extends B17MxkBaseSectionQza {
  const B17VqkUtilitiesSectionPageRze({super.key});

  @override
  State<B17VqkUtilitiesSectionPageRze> createState() =>
      _B17MqnUtilitiesSectionStateVxa();
}

class _B17MqnUtilitiesSectionStateVxa
    extends
        B17PrvBaseSectionStateWlt<
          B17HpnUtilitiesSectionControllerXwe,
          B17VqkUtilitiesSectionPageRze
        > {
  @override
  B17HpnUtilitiesSectionControllerXwe b17NwzCreateControllerTpi() {
    return B17HpnUtilitiesSectionControllerXwe();
  }

  @override
  Widget b17YksBuildContentUvd(
    BuildContext b17KqmContextWza,
    B17HpnUtilitiesSectionControllerXwe b17VqmControllerXre,
  ) {
    return GetBuilder<B17HpnUtilitiesSectionControllerXwe>(
      init: b17VqmControllerXre,
      global: false,
      builder: (b17QxmControllerVza) => Stack(
        children: [
          B17PzrAssetPictureViewXcu(
            "b17_jdk_home_top_bg_dhiw",
            b17DtvWidthQpl: double.infinity,
            b17RnxHeightKse: 232.h,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _b17KprTitleWidgetDnm(),
                SizedBox(height: 10.h),
                _b17DhnToolsWidgetQfv(),
                Container(
                  width: double.infinity,
                  height: 8.h,
                  color: Color(0xffF3F3F4),
                ),
                _b17CaqSystemWidgetUas(),
                Container(
                  width: double.infinity,
                  height: 8.h,
                  color: Color(0xffF3F3F4),
                ),
                _b17MvePreferenceWidgetRka(b17QxmControllerVza),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _b17DhnToolsWidgetQfv() => Container(
    width: double.infinity,
    padding: EdgeInsets.all(16.w),
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
            B17CxmLocalizedTextViewPra(
              "PDF tools".tr,
              b17RvxFontSizeQle: 16.sp,
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
                  B17KqmPicturesFuncWze.instance.b17BonToScanZjx();
                },
                b17HnqChildVsa: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      B17PzrAssetPictureViewXcu(
                        "b17_fji_capture_to_pdf_asset_efo",
                        b17DtvWidthQpl: 42.w,
                        b17RnxHeightKse: 42.h,
                      ),
                      SizedBox(height: 2.w),
                      B17CxmLocalizedTextViewPra(
                        "Scan To PDF".tr,
                        b17RvxFontSizeQle: 12.sp,
                        b17DtkColorZma: Colors.black,
                        b17HncFontWeightYsp: FontWeight.bold,
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
                  B17KqmPicturesFuncWze.instance.b17McvChooseImagesXri();
                },
                b17HnqChildVsa: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      B17PzrAssetPictureViewXcu(
                        "b17_fji_picture_to_pdf_asset_efj",
                        b17DtvWidthQpl: 42.w,
                        b17RnxHeightKse: 42.h,
                      ),
                      SizedBox(height: 2.w),
                      B17CxmLocalizedTextViewPra(
                        "Image To PDF".tr,
                        b17RvxFontSizeQle: 12.sp,
                        b17DtkColorZma: Colors.black,
                        b17HncFontWeightYsp: FontWeight.bold,
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
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            B17CxmLocalizedTextViewPra(
              "System".tr,
              b17RvxFontSizeQle: 16.sp,
              b17DtkColorZma: Colors.black,
              b17HncFontWeightYsp: FontWeight.bold,
            ),
          ],
        ),
        SizedBox(height: 12.h),
        B17MfwTapGuardViewQke(
          b17JkcOnPressedXwu: () {
            B17KqmInsertWidgetFuncVze.instance.b17EerShowAddWidgetDialogLxc();
          },
          b17HnqChildVsa: Container(
            width: double.infinity,
            height: 64.h,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                B17PzrAssetPictureViewXcu(
                  "b17_fji_insert_widget_icon_asset_ejf",
                  b17DtvWidthQpl: 38.w,
                  b17RnxHeightKse: 38.w,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: B17CxmLocalizedTextViewPra(
                    "Add Widget".tr,
                    b17RvxFontSizeQle: 14.sp,
                    b17DtkColorZma: Colors.black,
                    b17HncFontWeightYsp: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30.w,right: 30.w,top: 6.h,bottom: 6.h),
                  decoration: BoxDecoration(
                    color: Color(0xffD12629),
                    borderRadius: BorderRadius.circular(38.w),
                  ),
                  child: B17CxmLocalizedTextViewPra("Add".tr,b17RvxFontSizeQle: 12.sp,b17DtkColorZma: Colors.white,b17HncFontWeightYsp: FontWeight.bold,),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  Widget _b17MvePreferenceWidgetRka(
    B17HpnUtilitiesSectionControllerXwe b17VqmcontrollerXre,
  ) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
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
            child: Row(
              children: [
                B17PzrAssetPictureViewXcu(
                  "b17_gmn_locale_icon_asset_bzl",
                  b17DtvWidthQpl: 38.w,
                  b17RnxHeightKse: 38.w,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: B17CxmLocalizedTextViewPra(
                    "App Language".tr,
                    b17RvxFontSizeQle: 14.sp,
                    b17DtkColorZma: Colors.black,
                    b17HncFontWeightYsp: FontWeight.bold,
                  ),
                ),
                B17CxmLocalizedTextViewPra(
                  b17VqmcontrollerXre.b17QxmCurrentLanguageNameVza,
                  b17RvxFontSizeQle: 10.sp,
                  b17DtkColorZma: Color(0xff9C9FAE),
                  b17HncFontWeightYsp: FontWeight.w500,
                ),
                SizedBox(width: 4.w),
                B17PzrAssetPictureViewXcu(
                  "b17_right_icon_djiw",
                  b17DtvWidthQpl: 25.w,
                  b17RnxHeightKse: 25.w,
                ),
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
    child: Container(
      margin: EdgeInsets.only(left: 16.w),
      child: B17CxmLocalizedTextViewPra(
        "Tools & Settings".tr,
        b17RvxFontSizeQle: 25.sp,
        b17DtkColorZma: Colors.black,
        b17HncFontWeightYsp: FontWeight.bold,
      ),
    ),
  );
}
