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
        return Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: b17VqmControllerXza.b17KqmTabIndexWza,
                children: b17VqmControllerXza.b17VqnPagesXre,
              ),
            ),
            b17PqmBottomWidgetVze(
              b17VqmControllerXza,
              b17VqmContextWza,
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
    return SizedBox(
      width: double.infinity,
      height: 92.h,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          B17PzrAssetPictureViewXcu("b17_hhk_home_bottom_bg_djw",b17DtvWidthQpl: double.infinity,b17RnxHeightKse: double.infinity,),
          Row(
            children: [
              b17HqnItemWidgetVza(
                B17XjoDashboardBottomTabTypeMyz.files,
                b17KqmControllerXva,
                b17VqmcontextWza,
              ),
              B17MfwTapGuardViewQke(
                b17JkcOnPressedXwu: () {
                  B17KqmPicturesFuncWze.instance.b17BonToScanZjx();
                },
                b17HnqChildVsa: B17PzrAssetPictureViewXcu(
                  'b17_fhe_main_capture_asset_ifi',
                  b17DtvWidthQpl: 96.w,
                  b17RnxHeightKse: 80.w,
                ),
              ),
              b17HqnItemWidgetVza(
                B17XjoDashboardBottomTabTypeMyz.tools,
                b17KqmControllerXva,
                b17VqmcontextWza,
              ),
            ],
          ),
        ],
      ),
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
                b17DtvWidthQpl: 33.w,
                b17RnxHeightKse: 33.w,
              ),
              B17CxmLocalizedTextViewPra(
                b17VqmTypeXze.b17KqmTextVza.tr,
                b17RvxFontSizeQle: 12.sp,
                b17DtkColorZma: b17PqmSelectedWza
                    ? const Color(0xff2897F3)
                    : const Color(0xff9C9FAE),
                b17HncFontWeightYsp: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
