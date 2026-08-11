import 'package:b17pdf/b17_dji_func_jdo/b17_qxm_pictures_func_vza/b17_kqm_pictures_func_wze.dart';
import 'package:b17pdf/b17_fje_screens_ifj/b17_qmx_dashboard_vza/b17_hqv_dashboard_controller_wze.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_qaz_base_page_mtr.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17KpnDashboardPageYra
    extends B17QazBasePageMtr<B17HqvDashboardControllerWze> {
  const B17KpnDashboardPageYra({super.key});

  @override
  B17HqvDashboardControllerWze b17AhdCreateControllerWks() {
    return B17HqvDashboardControllerWze();
  }

  @override
  Color get b17LxqNavigationBarColorVbi => Colors.white;

  @override
  bool get b17NwsResizeToAvoidBottomInsetKde => false;

  @override
  Future<bool> b17YmeAllowRoutePopJcu(
    B17HqvDashboardControllerWze b17TbnControllerYui,
  ) => b17TbnControllerYui.b17PqnHandleBackPressedVze();

  @override
  Widget b17RuzBuildContentNxe(
    BuildContext b17VqmContextWza,
    B17HqvDashboardControllerWze b17KqmControllerXve,
  ) {
    return GetBuilder<B17HqvDashboardControllerWze>(
      id: B17HqvDashboardControllerWze.b17PqmTabUpdateIdXve,
      builder: (B17HqvDashboardControllerWze b17VqmControllerXza) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.only(bottom: 64.h),
              child: IndexedStack(
                index: b17VqmControllerXza.b17KqmTabIndexWza,
                children: b17VqmControllerXza.b17VqnPagesXre,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: b17PqmBottomWidgetVze(
                b17VqmControllerXza,
                b17VqmContextWza,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget b17PqmBottomWidgetVze(
    B17HqvDashboardControllerWze b17KqmControllerXva,
    BuildContext b17VqmcontextWza,
  ) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          height: 64.h,
          margin: EdgeInsets.only(top: 15.w),
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
          child: Row(
            children: [
              b17HqnItemWidgetVza(
                B17XjoDashboardBottomTabTypeMyz.files,
                b17KqmControllerXva,
                b17VqmcontextWza,
              ),
              SizedBox(width: 64.w),
              b17HqnItemWidgetVza(
                B17XjoDashboardBottomTabTypeMyz.tools,
                b17KqmControllerXva,
                b17VqmcontextWza,
              ),
            ],
          ),
        ),
        B17PzrAssetPictureViewXcu(
          'b17_fjh_bottom_middle_background_asset_eif',
          b17DtvWidthQpl: 80.w,
          b17RnxHeightKse: 16.w,
        ),
        Container(
          margin: EdgeInsets.only(top: 4.h),
          child: B17MfwTapGuardViewQke(
            b17JkcOnPressedXwu: () {
              B17KqmPicturesFuncWze.instance.b17BonToScanZjx();
            },
            b17HnqChildVsa: B17PzrAssetPictureViewXcu(
              'b17_fhe_main_capture_asset_ifi',
              b17DtvWidthQpl: 64.w,
              b17RnxHeightKse: 64.w,
            ),
          ),
        ),
      ],
    );
  }

  Widget b17HqnItemWidgetVza(
    B17XjoDashboardBottomTabTypeMyz b17VqmTypeXze,
    B17HqvDashboardControllerWze b17KqnControllerVxa,
    BuildContext b17VqmcontextWza,
  ) {
    final bool b17PqmSelectedWza =
        b17KqnControllerVxa.b17KqmTabIndexWza == b17VqmTypeXze.index;
    return Expanded(
      child: B17MfwTapGuardViewQke(
        b17JkcOnPressedXwu: () {
          b17KqnControllerVxa.b17HqmSelectTabVze(
            b17VqmTypeXze,
            b17VqmcontextWza,
          );
        },
        b17HnqChildVsa: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              B17PzrAssetPictureViewXcu(
                b17PqmSelectedWza
                    ? b17VqmTypeXze.b17HqmIconSelectedWze
                    : b17VqmTypeXze.b17VqnIconUnselectedXra,
                b17DtvWidthQpl: 28.w,
                b17RnxHeightKse: 28.w,
              ),
              B17CxmLocalizedTextViewPra(
                b17VqmTypeXze.b17KqmTextVza.tr,
                b17RvxFontSizeQle: 12.sp,
                b17DtkColorZma: b17PqmSelectedWza
                    ? const Color(0xfff4411f)
                    : const Color(0xff858c92),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
