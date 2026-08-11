import 'package:b17pdf/b17_fji_dialog_fji/b17_dje_request_permission_dialog_ifj/b17_xnd_request_permission_dialog_djeifje_controller_qmo.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_kqn_center_dialog_vze.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:permission_handler/permission_handler.dart';

class B17DjeRequestPermissionDialogIfj
    extends B17KqnCenterDialogVze<B17DjeRequestPermissionDialogControllerIfj> {
  final Permission permission;
  B17DjeRequestPermissionDialogIfj({required this.permission});

  @override
  B17DjeRequestPermissionDialogControllerIfj b17TqnCreateControllerXre() =>
      B17DjeRequestPermissionDialogControllerIfj(permission: permission);

  @override
  Widget b17VqmBuildDialogWza(
    BuildContext b17HqnContextVxe,
    B17DjeRequestPermissionDialogControllerIfj b17KqmControllerWza,
  ) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 28.w, right: 28.w),
      padding: EdgeInsets.only(
        left: 12.w,
        right: 12.w,
        top: 16.h,
        bottom: 16.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          B17CxmLocalizedTextViewPra(
            "Permission Required".tr,
            b17RvxFontSizeQle: 20.sp,
            b17DtkColorZma: Colors.black,
            b17HncFontWeightYsp: FontWeight.bold,
          ),
          SizedBox(height: 12.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Color(0xffF3F5F7),
              borderRadius: BorderRadius.circular(8.w),
              border: Border.all(width: 0.5.w, color: Color(0xffEBEBEB)),
            ),
            child: B17CxmLocalizedTextViewPra(
              b17KqmControllerWza.b17PnmPermissionMessageMfk(),
              b17RvxFontSizeQle: 14.sp,
              b17DtkColorZma: Color(0xff4B4D56),
            ),
          ),
          SizedBox(height: 20.h),
          B17MfwTapGuardViewQke(
            b17JkcOnPressedXwu: b17KqmControllerWza.b17LiaClickAllowKev,
            b17HnqChildVsa: Container(
              width: double.infinity,
              height: 48.h,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 24.w, right: 24.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.w),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xffFF8E71), Color(0xffA77FF1)],
                ),
              ),
              child: B17CxmLocalizedTextViewPra(
                "Allow".tr,
                b17RvxFontSizeQle: 16.sp,
                b17DtkColorZma: Colors.white,
                b17HncFontWeightYsp: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          B17MfwTapGuardViewQke(
            b17JkcOnPressedXwu: () {
              b17KqmControllerWza.b17RlsClickLaterJtt();
            },
            b17HnqChildVsa: B17CxmLocalizedTextViewPra(
              'Later'.tr,
              b17RvxFontSizeQle: 14.sp,
              b17DtkColorZma: const Color(0xff858C92),
              b17FefDecorationJie: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
