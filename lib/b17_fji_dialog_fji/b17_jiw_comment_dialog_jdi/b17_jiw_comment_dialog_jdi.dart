import 'package:b17pdf/b17_fji_dialog_fji/b17_jiw_comment_dialog_jdi/b17_byk_comment_dialog_jiwjdiw_controller_xpo.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_hqm_controller_widget_vza.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_image_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_vny_media_padding_view_qsl.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class B17WjdCommentDialogJiIwe
    extends B17HqmControllerWidgetVza<B17JiwCommentDialogControllerJdi> {
  const B17WjdCommentDialogJiIwe({super.key});

  @override
  B17JiwCommentDialogControllerJdi b17PqmCreateControllerWza() =>
      B17JiwCommentDialogControllerJdi();

  @override
  Widget b17HqnBuildContentVxe(
    BuildContext b17KqmContextWza,
    B17JiwCommentDialogControllerJdi b17VqnControllerXre,
  ) {
    return B17MfwTapGuardViewQke(
      b17JkcOnPressedXwu: () {
        b17VqnControllerXre.b17KqnClickRateUsVze();
      },
      b17HnqChildVsa: Container(
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
            Container(
              margin: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20.h),
                  B17PzrAssetImageViewXcu(
                    "b17_fhu_logo_efh",
                    b17DtvWidthQpl: 68.w,
                    b17RnxHeightKse: 68.w,
                  ),
                  SizedBox(height: 16.h),
                  B17CxmLocalizedTextViewPra(
                    "Enjoying PDF Reader?".tr,
                    b17RvxFontSizeQle: 20.sp,
                    b17DtkColorZma: Colors.black,
                    b17HncFontWeightYsp: FontWeight.bold,
                  ),
                  SizedBox(height: 10.h),
                  B17CxmLocalizedTextViewPra(
                    "Your 5-star rating helps us improve! It only takes a few seconds of your time."
                        .tr,
                    b17RvxFontSizeQle: 14.sp,
                    b17DtkColorZma: Color(0xff4B5156),
                  ),
                  SizedBox(height: 10.h),
                  //b17_jiw_star_sel_icon_jie  b17_dji_star_uns_icon_wji
                  Container(
                    width: double.infinity,
                    height: 48.w,
                    margin: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: GetBuilder<B17JiwCommentDialogControllerJdi>(
                      id: B17JiwCommentDialogControllerJdi
                          .b17KqnStarBuilderIdVze,
                      builder: (b17QxmBuilderVza) => B17VnyMediaPaddingViewQsl(
                        b17QzpChildMwa: MasonryGridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 5,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 12.w,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            final bool b17KqnSelectedVze =
                                index < b17QxmBuilderVza.b17PqnStarCountVze;
                            return B17MfwTapGuardViewQke(
                              b17JkcOnPressedXwu: () {
                                b17QxmBuilderVza.b17VqmClickStarWza(index);
                              },
                              b17HnqChildVsa: B17PzrAssetImageViewXcu(
                                b17KqnSelectedVze
                                    ? "b17_jiw_star_sel_icon_jie"
                                    : "b17_dji_star_uns_icon_wji",
                                b17DtvWidthQpl: 48.w,
                                b17RnxHeightKse: 48.w,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  B17MfwTapGuardViewQke(
                    b17JkcOnPressedXwu:
                        b17VqnControllerXre.b17KqnClickRateUsVze,
                    b17HnqChildVsa: Container(
                      width: double.infinity,
                      height: 48.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.w),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xffFF8E71), Color(0xffA77FF1)],
                        ),
                      ),
                      child: B17CxmLocalizedTextViewPra(
                        "Rate Us 5 Stars".tr,
                        b17RvxFontSizeQle: 16.sp,
                        b17DtkColorZma: Colors.white,
                        b17HncFontWeightYsp: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: B17MfwTapGuardViewQke(
                b17JkcOnPressedXwu: () {
                  b17VqnControllerXre.b17VqnClickCloseTza();
                },
                b17HnqChildVsa: Container(
                  width: 44.w,
                  height: 44.w,
                  alignment: Alignment.center,
                  child: B17PzrAssetImageViewXcu(
                    "b17_oje_close_icon_bnl",
                    b17RnxHeightKse: 24.w,
                    b17DtvWidthQpl: 24.w,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
