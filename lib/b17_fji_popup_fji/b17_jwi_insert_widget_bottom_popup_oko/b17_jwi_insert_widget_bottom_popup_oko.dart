import 'package:b17pdf/b17_dji_func_jdo/b17_fje_device_info_ifj.dart';
import 'package:b17pdf/b17_fji_popup_fji/b17_jwi_insert_widget_bottom_popup_oko/b17_yik_insert_widget_bottom_popup_jwiokowdw_controller_lki.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_qxn_insert_widget_func_vza/b17_kqm_insert_widget_func_vze.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_hqm_controller_widget_vza.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_vny_media_padding_view_qsl.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class B17JwiInsertWidgetBottomPopupOko
    extends
        B17HqmControllerWidgetVza<B17JwiInsertWidgetBottomPopupControllerOko> {
  const B17JwiInsertWidgetBottomPopupOko({super.key});

  @override
  B17JwiInsertWidgetBottomPopupControllerOko b17PqmCreateControllerWza() =>
      B17JwiInsertWidgetBottomPopupControllerOko();

  @override
  Widget b17HqnBuildContentVxe(
    BuildContext b17KqmContextWza,
    B17JwiInsertWidgetBottomPopupControllerOko b17VqnControllerXre,
  ) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.w),
          topRight: Radius.circular(16.w),
        ),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          B17PzrAssetPictureViewXcu("b17_add_widget_bg_hik",b17DtvWidthQpl: double.infinity,b17RnxHeightKse: 198.h,),
          Container(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                B17CxmLocalizedTextViewPra(
                  'Add Widget'.tr,
                  b17RvxFontSizeQle: 18.sp,
                  b17DtkColorZma: Colors.black,
                  b17HncFontWeightYsp: FontWeight.bold,
                ),
                SizedBox(height: 10.h),
                B17CxmLocalizedTextViewPra(
                  'Add widget with one click to open files'.tr,
                  b17RvxFontSizeQle: 14.sp,
                  b17DtkColorZma: const Color(0xff555978),
                  b17PqmMaxLinesTva: 1,
                  b17FzrOverflowXke: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12.h),
                _b17IpmContentWidgetRmp(),
                SizedBox(height: 20.h),
                B17MfwTapGuardViewQke(
                  b17JkcOnPressedXwu: () {
                    b17VqnControllerXre.b17ZahClickAddZei();
                  },
                  b17HnqChildVsa: Container(
                    width: double.infinity,
                    height: 48.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xffD12629),
                      borderRadius: BorderRadius.circular(24.w),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        B17PzrAssetPictureViewXcu(
                          "b17_fwo_insert_icon_asset_dko",
                          b17DtvWidthQpl: 24.w,
                          b17RnxHeightKse: 24.w,
                        ),
                        SizedBox(width: 8.w),
                        B17CxmLocalizedTextViewPra(
                          "Add".tr,
                          b17RvxFontSizeQle: 16.sp,
                          b17DtkColorZma: Colors.white,
                          b17HncFontWeightYsp: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _b17IpmContentWidgetRmp() => Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.w),
      border: Border.all(
        width: 1.w,
        color: Color(0xffCAD5E0),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.2),
          blurRadius: 5,
          offset: const Offset(0, -0.5),
        ),
      ],
    ),
    child: Container(
      margin: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              B17PzrAssetPictureViewXcu(
                'b17_fhu_logo_asset_efh',
                b17DtvWidthQpl: 20.w,
                b17RnxHeightKse: 20.w,
              ),
              SizedBox(width: 8.w,),
              B17CxmLocalizedTextViewPra(
                B17FjeDeviceInfoIfj.appName,
                b17RvxFontSizeQle: 12.sp,
                b17DtkColorZma: Color(0xff242C3C),
                b17HncFontWeightYsp: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(height: 12.h,),
          Container(
            width: double.infinity,
            height: 42.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
              border: Border.all(
                width: 2.w,
                color: Color(0xff242C3C),
              ),
            ),
            child: Row(
              children: [
                SizedBox(width: 12.w,),
                B17CxmLocalizedTextViewPra(
                  "Search...".tr,
                  b17RvxFontSizeQle: 14.sp,
                  b17DtkColorZma: Color(0xff555978),
                ),
                Spacer(),
                B17PzrAssetPictureViewXcu(
                  "b17_fjh_find_asset_ief",
                  b17DtvWidthQpl: 22.w,
                  b17RnxHeightKse: 22.w,
                ),
                SizedBox(width: 12.w,),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          B17VnyMediaPaddingViewQsl(
            b17QzpChildMwa: MasonryGridView.count(
              crossAxisCount: 4,
              mainAxisSpacing: 0,
              crossAxisSpacing: 8.w,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: B17AdwInsertWidgetTypeTpe.values.length,
              itemBuilder: (BuildContext context, int index) {
                var type = B17AdwInsertWidgetTypeTpe.values[index];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    B17PzrAssetPictureViewXcu(
                      type.icon,
                      b17DtvWidthQpl: 36.w,
                      b17RnxHeightKse: 36.w,
                    ),
                    SizedBox(height: 4.h),
                    B17CxmLocalizedTextViewPra(
                      type.text.tr,
                      b17RvxFontSizeQle: 12.sp,
                      b17DtkColorZma: Colors.black,
                      b17HncFontWeightYsp: FontWeight.bold,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
