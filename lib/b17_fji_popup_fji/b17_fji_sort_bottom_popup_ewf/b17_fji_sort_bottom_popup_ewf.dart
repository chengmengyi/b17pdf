import 'package:b17pdf/b17_fji_popup_fji/b17_fji_sort_bottom_popup_ewf/b17_brf_sort_bottom_popup_fjiewfjoe_controller_pnh.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_hqm_controller_widget_vza.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_vny_media_padding_view_qsl.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17FjiSortBottomPopupEwf
    extends B17HqmControllerWidgetVza<B17FjiSortBottomPopupControllerEwf> {
  final B17JffSortTypeRiq b17HqmSelectedTypeWza;
  B17FjiSortBottomPopupEwf({required this.b17HqmSelectedTypeWza});

  @override
  B17FjiSortBottomPopupControllerEwf b17PqmCreateControllerWza() =>
      B17FjiSortBottomPopupControllerEwf(
        b17VqmSelectedTypeXza: b17HqmSelectedTypeWza,
      );

  @override
  Widget b17HqnBuildContentVxe(
    BuildContext b17KqmContextWza,
    B17FjiSortBottomPopupControllerEwf b17VqnControllerXre,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_b17KprTitleWidgetDnm(), _listWidget(b17VqnControllerXre)],
      ),
    );
  }

  _listWidget(B17FjiSortBottomPopupControllerEwf b17VqncontrollerXre) =>
      B17VnyMediaPaddingViewQsl(
        b17QzpChildMwa: ListView.builder(
          shrinkWrap: true,
          itemCount: B17JffSortTypeRiq.values.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var type = B17JffSortTypeRiq.values[index];
            return B17MfwTapGuardViewQke(
              b17JkcOnPressedXwu: () {
                b17VqncontrollerXre.b17OteClickSortNcs(type);
              },
              b17HnqChildVsa: Container(
                width: double.infinity,
                height: 48.h,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Row(
                  children: [
                    B17PzrAssetPictureViewXcu(
                      type.b17KqnIconVxe,
                      b17DtvWidthQpl: 24.w,
                      b17RnxHeightKse: 24.w,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: B17CxmLocalizedTextViewPra(
                        type.b17HqmTextWza.tr,
                        b17RvxFontSizeQle: 16.sp,
                        b17DtkColorZma: Color(0xff4B4D56),
                        b17HncFontWeightYsp: FontWeight.w500,
                        b17FzrOverflowXke: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    if (type == b17VqncontrollerXre.b17VqmSelectedTypeXza)
                      B17PzrAssetPictureViewXcu(
                        "b17_fji_selection_sort_asset_efj",
                        b17DtvWidthQpl: 24.w,
                        b17RnxHeightKse: 24.w,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      );

  _b17KprTitleWidgetDnm() => SizedBox(
    width: double.infinity,
    height: 56.h,
    child: Stack(
      children: [
        Align(
          child: B17CxmLocalizedTextViewPra(
            "Sort By".tr,
            b17RvxFontSizeQle: 20.sp,
            b17DtkColorZma: Colors.black,
            b17HncFontWeightYsp: FontWeight.bold,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.only(right: 16.w),
            child: B17MfwTapGuardViewQke(
              b17JkcOnPressedXwu: () {
                B17FjeNavigationFuncIfj.b17FtyBackNwp();
              },
              b17HnqChildVsa: B17PzrAssetPictureViewXcu(
                "b17_oje_dismiss_icon_asset_bnl",
                b17DtvWidthQpl: 24.w,
                b17RnxHeightKse: 24.w,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
