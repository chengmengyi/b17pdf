import 'dart:io';

import 'package:b17pdf/b17_fje_screens_ifj/b17_qxn_pictures_output_vza/b17_kqm_pictures_output_controller_wze.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_qaz_base_page_mtr.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17VqnPicturesOutputPageTza
    extends B17QazBasePageMtr<B17KqmPicturesOutputControllerWze> {
  const B17VqnPicturesOutputPageTza({super.key});

  @override
  B17KqmPicturesOutputControllerWze b17AhdCreateControllerWks() {
    return B17KqmPicturesOutputControllerWze();
  }

  @override
  Color get b17LxqNavigationBarColorVbi => Colors.white;

  @override
  Widget b17RuzBuildContentNxe(
    BuildContext b17VqmContextWza,
    B17KqmPicturesOutputControllerWze b17KqmControllerXve,
  ) {
    return GetBuilder<B17KqmPicturesOutputControllerWze>(
      builder: (B17KqmPicturesOutputControllerWze b17VqnControllerTza) =>
          Column(
            children: [
              _b17HqmTitleWza(b17VqnControllerTza),
              _b17KqnContentVze(b17VqnControllerTza),
              _b17VqnBottomTza(b17VqnControllerTza),
            ],
          ),
    );
  }

  Widget _b17VqnBottomTza(
    B17KqmPicturesOutputControllerWze b17KqmcontrollerXve,
  ) => Container(
    width: double.infinity,
    padding: EdgeInsets.only(left: 16.w, right: 16.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12.w),
        topRight: Radius.circular(12.w),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.2),
          blurRadius: 5,
          offset: const Offset(0, -0.5),
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 8.h),
        SizedBox(
          height: 78.h,
          child: ListView.separated(
            controller: b17KqmcontrollerXve.b17PqnThumbnailControllerVze,
            itemCount: b17KqmcontrollerXve.b17QxnImagePathsVza.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, b17KqnIndexVze) {
              final b17VqnPageTza = b17KqnIndexVze + 1;
              return B17MfwTapGuardViewQke(
                b17JkcOnPressedXwu: () {
                  b17KqmcontrollerXve.b17VqnSelectImageTza(b17KqnIndexVze);
                },
                b17HnqChildVsa: Container(
                  width: 60.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffF3F5F7),
                    borderRadius: BorderRadius.circular(3.w),
                    border: Border.all(
                      width: 2.w,
                      color:
                          b17KqmcontrollerXve.b17KqmSelectedIndexWze ==
                              b17KqnIndexVze
                          ? const Color(0xff067bf2)
                          : const Color(0xffEBEBEB),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3.w),
                          child: Image.file(
                            File(
                              b17KqmcontrollerXve
                                  .b17QxnImagePathsVza[b17KqnIndexVze],
                            ),
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => const SizedBox.shrink(),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 1.h,
                          ),
                          color: Colors.black54,
                          child: Text(
                            '$b17VqnPageTza',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (b17QxmContextVza, b17KqnIndexVze) =>
                SizedBox(width: 8.w),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            B17MfwTapGuardViewQke(
              b17JkcOnPressedXwu: b17KqmcontrollerXve.b17RuaClickReplacePmb,
              b17HnqChildVsa: Container(
                width: 92.w,
                height: 64.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffF5F6F9),
                  borderRadius: BorderRadius.circular(16.w),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    B17PzrAssetPictureViewXcu(
                      "b17_jiw_rescan_icon_asset_odw",
                      b17DtvWidthQpl: 24.w,
                      b17RnxHeightKse: 24.w,
                    ),
                    SizedBox(height: 4.h),
                    B17CxmLocalizedTextViewPra(
                      "Retake".tr,
                      b17RvxFontSizeQle: 14.sp,
                      b17DtkColorZma: Color(0xff242C3C),
                      b17HncFontWeightYsp: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12.w),
            B17MfwTapGuardViewQke(
              b17JkcOnPressedXwu: b17KqmcontrollerXve.b17ZahClickAddZei,
              b17HnqChildVsa: Container(
                width: 92.w,
                height: 64.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffF5F6F9),
                  borderRadius: BorderRadius.circular(16.w),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    B17PzrAssetPictureViewXcu(
                      "b17_dkw_insert_page_icon_asset_oko",
                      b17DtvWidthQpl: 24.w,
                      b17RnxHeightKse: 24.w,
                    ),
                    SizedBox(height: 4.h),
                    B17CxmLocalizedTextViewPra(
                      "Add".tr,
                      b17RvxFontSizeQle: 14.sp,
                      b17DtkColorZma: Color(0xff242C3C),
                      b17HncFontWeightYsp: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: B17MfwTapGuardViewQke(
                b17JkcOnPressedXwu: () {
                  b17KqmcontrollerXve.b17IedClickSaveJkt();
                },
                b17HnqChildVsa: Container(
                  width: double.infinity,
                  height: 64.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xffD12629),
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      B17PzrAssetPictureViewXcu(
                        "b17_sel_icon_white_djwi",
                        b17DtvWidthQpl: 22.w,
                        b17RnxHeightKse: 22.w,
                      ),
                      SizedBox(height: 2.w),
                      B17CxmLocalizedTextViewPra(
                        "Save PDF".tr,
                        b17RvxFontSizeQle: 14.sp,
                        b17DtkColorZma: Colors.white,
                        b17HncFontWeightYsp: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
      ],
    ),
  );

  Widget _b17KqnContentVze(
    B17KqmPicturesOutputControllerWze b17KqmcontrollerXve,
  ) => Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 5,
            offset: const Offset(0, -0.5),
          ),
        ],
      ),
      child: PageView.builder(
        controller: b17KqmcontrollerXve.b17HqmPageControllerWza,
        itemCount: b17KqmcontrollerXve.b17QxnImagePathsVza.length,
        onPageChanged: b17KqmcontrollerXve.b17HqmPageChangedWza,
        itemBuilder: (_, int b17QxnIndexVza) {
          return Image.file(
            File(b17KqmcontrollerXve.b17QxnImagePathsVza[b17QxnIndexVza]),
            fit: BoxFit.contain,
            errorBuilder: (_, _, _) => const SizedBox.shrink(),
          );
        },
      ),
    ),
  );

  Widget _b17HqmTitleWza(
    B17KqmPicturesOutputControllerWze b17KqmcontrollerXve,
  ) => Container(
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
