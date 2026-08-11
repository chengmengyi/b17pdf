import 'package:b17pdf/b17_fji_popup_fji/b17_fje_change_locale_bottom_popup_ifo/b17_oso_change_locale_bottom_popup_fjeifoef_controller_rel.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fje_locale_func_ifj/b17_fie_locale_utilities_ife.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_hqm_controller_widget_vza.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_vny_media_padding_view_qsl.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17FjeChangeLocaleBottomPopupIfo
    extends
        B17HqmControllerWidgetVza<B17FjeChangeLocaleBottomPopupControllerIfo> {
  const B17FjeChangeLocaleBottomPopupIfo({super.key});

  @override
  B17FjeChangeLocaleBottomPopupControllerIfo b17PqmCreateControllerWza() =>
      B17FjeChangeLocaleBottomPopupControllerIfo();
  @override
  Widget b17HqnBuildContentVxe(
    BuildContext b17KqmContextWza,
    B17FjeChangeLocaleBottomPopupControllerIfo b17VqnControllerXre,
  ) => GetBuilder<B17FjeChangeLocaleBottomPopupControllerIfo>(
    init: b17VqnControllerXre,
    global: false,
    builder: (b17QxmControllerVza) => Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.w),
          topRight: Radius.circular(16.w),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _b17KqnTitleWidgetVze(),
          _b17VqnContentWidgetTza(b17QxmControllerVza),
          SizedBox(height: 12.h),
        ],
      ),
    ),
  );

  Widget _b17VqnContentWidgetTza(
    B17FjeChangeLocaleBottomPopupControllerIfo b17QxmControllerVza,
  ) => Container(
    width: double.infinity,
    height: 448.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.w),
      border: Border.all(width: 0.5.w, color: const Color(0xffE0E3EA)),
    ),
    child: B17VnyMediaPaddingViewQsl(
      b17QzpChildMwa: ListView.builder(
        controller: b17QxmControllerVza.b17QxmLanguageScrollControllerVza,
        itemCount: b17QxmControllerVza.b17PqmLanguageListWza.length,
        itemBuilder: (b17KqnContextVze, b17VqnIndexTza) {
          final B17QxmLocaleItemVza b17PqmItemWza =
              b17QxmControllerVza.b17PqmLanguageListWza[b17VqnIndexTza];
          final b17HqmSelectedWza = b17QxmControllerVza.b17VqnIsSelectedTza(
            b17PqmItemWza,
          );
          return B17MfwTapGuardViewQke(
            b17JkcOnPressedXwu: () =>
                b17QxmControllerVza.b17PqmClickLanguageWza(b17PqmItemWza),
            b17HnqChildVsa: SizedBox(
              height: 56.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    B17PzrAssetPictureViewXcu(
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
            ),
          );
        },
      ),
    ),
  );

  Widget _b17KqnTitleWidgetVze() => SizedBox(
    width: double.infinity,
    height: 56.h,
    child: Stack(
      children: [
        Align(
          child: B17CxmLocalizedTextViewPra(
            'App Language'.tr,
            b17RvxFontSizeQle: 20.sp,
            b17DtkColorZma: Colors.black,
            b17HncFontWeightYsp: FontWeight.bold,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: B17MfwTapGuardViewQke(
            b17JkcOnPressedXwu: B17FjeNavigationFuncIfj.b17FtyBackNwp,
            b17HnqChildVsa: B17PzrAssetPictureViewXcu(
              'b17_oje_dismiss_icon_asset_bnl',
              b17DtvWidthQpl: 24.w,
              b17RnxHeightKse: 24.w,
            ),
          ),
        ),
      ],
    ),
  );
}
