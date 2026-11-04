import 'package:b17pdf/b17_ydu_interface_mqp/b17_wfm_popups_tke/b17_fow_update_popup_jid/b17_deu_update_popup_fowjidwj_controller_xnf.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_kqn_center_popup_vze.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17FowUpdatePopupJid
    extends B17KqnCenterPopupVze<B17FowUpdatePopupControllerJid> {
  const B17FowUpdatePopupJid({super.key});

  @override
  B17FowUpdatePopupControllerJid b17TqnCreateControllerXre() =>
      B17FowUpdatePopupControllerJid();

  @override
  Widget b17VqmBuildDialogWza(
    BuildContext b17HqnContextVxe,
    B17FowUpdatePopupControllerJid b17KqmControllerWza,
  ) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 28.w, right: 28.w),
      child: Stack(
        children: [
          B17PzrAssetPictureViewXcu(
            "b17_fji_upgrade_background_asset_eie",
            b17DtvWidthQpl: double.infinity,
            b17RnxHeightKse: 120.h,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8.w),
            margin: EdgeInsets.only(top: 100.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.w),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                B17CxmLocalizedTextViewPra(
                  "New version coming soon!".tr,
                  b17RvxFontSizeQle: 20.sp,
                  b17DtkColorZma: Colors.black,
                  b17HncFontWeightYsp: FontWeight.bold,
                ),
                SizedBox(height: 12.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Color(0xffF3F5F7),
                    borderRadius: BorderRadius.circular(8.w),
                    border: Border.all(width: 0.5.w, color: Color(0xffEBEBEB)),
                  ),
                  child: B17CxmLocalizedTextViewPra(
                    "Your feedback has been received! This information is vital to us. We are continuously optimizing the product experience, and a new version will be launched soon. Please stay with us!"
                        .tr,
                    b17RvxFontSizeQle: 14.sp,
                    b17DtkColorZma: Color(0xff4B5156),
                  ),
                ),
                SizedBox(height: 12.h),
                B17MfwTapGuardViewQke(
                  b17JkcOnPressedXwu:
                      b17KqmControllerWza.b17KqnClickContinueUsingVze,
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
                      "Continue using for free".tr,
                      b17RvxFontSizeQle: 16.sp,
                      b17DtkColorZma: Colors.white,
                      b17HncFontWeightYsp: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                B17MfwTapGuardViewQke(
                  b17JkcOnPressedXwu: () => b17KqmControllerWza
                      .b17VqnClickLeaveAnywayTza(b17HqnContextVxe),
                  b17HnqChildVsa: B17CxmLocalizedTextViewPra(
                    "Leave anyway".tr,
                    b17RvxFontSizeQle: 14.sp,
                    b17DtkColorZma: Color(0xff858C92),
                    b17HncFontWeightYsp: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
