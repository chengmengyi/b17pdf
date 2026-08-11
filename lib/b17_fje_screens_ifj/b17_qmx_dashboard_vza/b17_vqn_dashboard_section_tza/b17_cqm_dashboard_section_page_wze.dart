import 'package:b17pdf/b17_dji_func_jdo/b17_qxn_insert_widget_func_vza/b17_kqm_insert_widget_func_vze.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_jdw_metric_type_ijd.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_dji_analytics_func_wji.dart';
import 'package:b17pdf/b17_fje_screens_ifj/b17_qmx_dashboard_vza/b17_vqn_dashboard_section_tza/b17_fej_documents_list_section_ife/b17_qxm_documents_list_section_page_vza.dart';
import 'package:b17pdf/b17_fje_screens_ifj/b17_qmx_dashboard_vza/b17_vqn_dashboard_section_tza/b17_rkp_dashboard_section_controller_xwe.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_mxk_base_section_qza.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_hjk_tab_view_jdo.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17CqmDashboardSectionPageWze extends B17MxkBaseSectionQza {
  const B17CqmDashboardSectionPageWze({super.key});

  @override
  State<B17CqmDashboardSectionPageWze> createState() =>
      _B17PqnDashboardSectionStateVxa();
}

class _B17PqnDashboardSectionStateVxa
    extends
        B17PrvBaseSectionStateWlt<
          B17RkpDashboardSectionControllerXwe,
          B17CqmDashboardSectionPageWze
        > {
  @override
  B17RkpDashboardSectionControllerXwe b17NwzCreateControllerTpi() {
    return B17RkpDashboardSectionControllerXwe();
  }

  @override
  Widget b17YksBuildContentUvd(
    BuildContext b17HqmContextWza,
    B17RkpDashboardSectionControllerXwe b17VqmControllerXze,
  ) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        B17PzrAssetPictureViewXcu(
          "b17_jdk_home_top_bg_dhiw",
          b17DtvWidthQpl: double.infinity,
          b17RnxHeightKse: 232.h,
        ),
        GetBuilder<B17RkpDashboardSectionControllerXwe>(
          init: b17VqmControllerXze,
          builder: (b17QxmControllerVza) => Container(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              children: [
                _topWidget(b17QxmControllerVza),
                _tabWidget(b17QxmControllerVza),
                if (b17QxmControllerVza.b17QxnShowAddWidgetVza)
                  _addSmallWidget(b17QxmControllerVza),
                SizedBox(height: 12.h),
                _pageWidget(b17QxmControllerVza),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _pageWidget(B17RkpDashboardSectionControllerXwe b17VqmControllerXze) =>
      Expanded(
        child: TabBarView(
          controller: b17VqmControllerXze.b17KqnTabControllerVze,
          children: B17PeeDocumentTabTyFie.values
              .map(
                (B17PeeDocumentTabTyFie b17QxnTypeVza) =>
                    B17QxmDocumentsListSectionPageVza(type: b17QxnTypeVza),
              )
              .toList(growable: false),
        ),
      );

  _tabWidget(B17RkpDashboardSectionControllerXwe b17VqmcontrollerXze) =>
      SizedBox(
        width: double.infinity,
        height: 40.h,
        child: B17HjkTabViewJdo(
          b17KqnTabControllerVze: b17VqmcontrollerXze.b17KqnTabControllerVze,
          b17PqmOnTapXze: (int b17KqnIndexVze) {
            b17VqmcontrollerXze.b17QxnHandleTabTapVza();
          },
        ),
      );

  _addSmallWidget(B17RkpDashboardSectionControllerXwe b17VqmcontrollerXze) =>
      Container(
        width: double.infinity,
        height: 50.h,
        margin: EdgeInsets.only(top: 8.h),
        padding: EdgeInsets.only(left: 16.w,right: 16.w),
        decoration: BoxDecoration(
          color: Color(0xffFFC21C).withOpacity(0.14),
          borderRadius: BorderRadius.circular(25.w),
        ),
        child: Row(
          children: [
            B17PzrAssetPictureViewXcu(
              "b17_bul_insert_compact_widget_asset_fil",
              b17DtvWidthQpl: 32.w,
              b17RnxHeightKse: 32.w,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: B17CxmLocalizedTextViewPra(
                "To access features instantly, add the widget!".tr,
                b17RvxFontSizeQle: 14.sp,
                b17DtkColorZma: Color(0xff242C3C),
                b17FzrOverflowXke: TextOverflow.ellipsis,
                b17PqmMaxLinesTva: 2,
                b17HncFontWeightYsp: FontWeight.w500,
              ),
            ),
            SizedBox(width: 8.w),
            B17MfwTapGuardViewQke(
              b17JkcOnPressedXwu: () {
                B17KqmInsertWidgetFuncVze.instance
                    .b17EerShowAddWidgetDialogLxc();
              },
              b17HnqChildVsa: Container(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 4.h,
                  bottom: 4.h,
                ),
                decoration: BoxDecoration(
                  color: Color(0xff2897F3),
                  borderRadius: BorderRadius.circular(18.w),
                ),
                child: B17CxmLocalizedTextViewPra(
                  "Grant".tr,
                  b17RvxFontSizeQle: 14.sp,
                  b17DtkColorZma: Colors.white,
                  b17HncFontWeightYsp: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );

  _topWidget(B17RkpDashboardSectionControllerXwe b17VqmcontrollerXze) =>
      SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),
            Container(
              width: double.infinity,
              height: 46.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                border: Border.all(width: 2.w, color: Color(0xff242C3C)),
              ),
              child: Row(
                children: [
                  SizedBox(width: 12.w),
                  Expanded(
                    child: TextField(
                      enabled: true,
                      textAlign: TextAlign.left,
                      controller: b17VqmcontrollerXze.textEditingController,
                      textInputAction: TextInputAction.search,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xff202326),
                      ),
                      onTap: () {
                        B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
                          b17QxnPointTypeVza: B17JdwMetricTypeIjd.search_click,
                        );
                      },
                      decoration: InputDecoration(
                        counterText: '',
                        isCollapsed: true,
                        hintText: "Search...".tr,
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xff202326),
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: b17VqmcontrollerXze.b17PqmSearchFilesXza,
                      onSubmitted: b17VqmcontrollerXze.b17PqmSearchFilesXza,
                    ),
                  ),
                  B17PzrAssetPictureViewXcu(
                    "b17_fjh_find_asset_ief",
                    b17DtvWidthQpl: 22.w,
                    b17RnxHeightKse: 22.w,
                  ),
                  SizedBox(width: 12.w),
                ],
              ),
            ),
          ],
        ),
      );
}
