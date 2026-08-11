import 'package:b17pdf/b17_dji_hep_jdo/b17_qxm_images_hep_vza/b17_kqm_images_hep_wze.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_qmx_home_vza/b17_hqv_home_controller_wze.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_qaz_root_page_mtr.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_image_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17KpnHomePageYra extends B17QazRootPageMtr<B17HqvHomeControllerWze> {
  const B17KpnHomePageYra({super.key});

  @override
  B17HqvHomeControllerWze b17AhdCreateControllerWks() {
    return B17HqvHomeControllerWze();
  }

  @override
  Color get b17LxqNavigationBarColorVbi => Colors.white;

  @override
  bool get b17NwsResizeToAvoidBottomInsetKde => false;

  @override
  Future<bool> b17YmeAllowRoutePopJcu(
    B17HqvHomeControllerWze b17TbnControllerYui,
  ) => b17TbnControllerYui.b17PqnHandleBackPressedVze();

  @override
  Widget b17RuzBuildContentNxe(
    BuildContext b17VqmContextWza,
    B17HqvHomeControllerWze b17KqmControllerXve,
  ) {
    return GetBuilder<B17HqvHomeControllerWze>(
      id: B17HqvHomeControllerWze.b17PqmTabUpdateIdXve,
      builder: (B17HqvHomeControllerWze b17VqmControllerXza) {
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
    B17HqvHomeControllerWze b17KqmControllerXva,
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
                B17XjoHomeBottomTabTypeMyz.files,
                b17KqmControllerXva,
                b17VqmcontextWza,
              ),
              SizedBox(width: 64.w),
              b17HqnItemWidgetVza(
                B17XjoHomeBottomTabTypeMyz.tools,
                b17KqmControllerXva,
                b17VqmcontextWza,
              ),
            ],
          ),
        ),
        B17PzrAssetImageViewXcu(
          'b17_fjh_bottom_center_bg_eif',
          b17DtvWidthQpl: 80.w,
          b17RnxHeightKse: 16.w,
        ),
        Container(
          margin: EdgeInsets.only(top: 4.h),
          child: B17MfwTapGuardViewQke(
            b17JkcOnPressedXwu: () {
              B17KqmImagesHepWze.instance.b17BonToScanZjx();
            },
            b17HnqChildVsa: B17PzrAssetImageViewXcu(
              'b17_fhe_home_scan_ifi',
              b17DtvWidthQpl: 64.w,
              b17RnxHeightKse: 64.w,
            ),
          ),
        ),
      ],
    );
  }

  Widget b17HqnItemWidgetVza(
    B17XjoHomeBottomTabTypeMyz b17VqmTypeXze,
    B17HqvHomeControllerWze b17KqnControllerVxa,
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
              B17PzrAssetImageViewXcu(
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
