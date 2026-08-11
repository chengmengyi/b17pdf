import 'package:b17pdf/b17_dji_hep_jdo/b17_qxn_add_widget_hep_vza/b17_kqm_add_widget_hep_vze.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_jdw_point_type_ijd.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_dji_tba_hep_wji.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_qmx_home_vza/b17_vqn_home_child_tza/b17_fej_files_list_child_ife/b17_qxm_files_list_child_page_vza.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_qmx_home_vza/b17_vqn_home_child_tza/b17_rkp_home_child_controller_xwe.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_mxk_root_child_qza.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_image_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17CqmHomeChildPageWze extends B17MxkRootChildQza {
  const B17CqmHomeChildPageWze({super.key});

  @override
  State<B17CqmHomeChildPageWze> createState() => _B17PqnHomeChildStateVxa();
}

class _B17PqnHomeChildStateVxa
    extends
        B17PrvRootChildStateWlt<
          B17RkpHomeChildControllerXwe,
          B17CqmHomeChildPageWze
        > {
  @override
  B17RkpHomeChildControllerXwe b17NwzCreateControllerTpi() {
    return B17RkpHomeChildControllerXwe();
  }

  @override
  Widget b17YksBuildContentUvd(
    BuildContext b17HqmContextWza,
    B17RkpHomeChildControllerXwe b17VqmControllerXze,
  ) {
    return GetBuilder<B17RkpHomeChildControllerXwe>(
      init: b17VqmControllerXze,
      builder: (b17QxmControllerVza) => Container(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          children: [
            _topWidget(b17QxmControllerVza),
            SizedBox(height: 12.h),
            _tabWidget(b17QxmControllerVza),
            if (b17QxmControllerVza.b17QxnShowAddWidgetVza)
              _addSmallWidget(b17QxmControllerVza),
            SizedBox(height: 12.h),
            _pageWidget(b17QxmControllerVza, b17HqmContextWza),
          ],
        ),
      ),
    );
  }

  _pageWidget(
    B17RkpHomeChildControllerXwe b17VqmcontrollerXze,
    BuildContext b17HqmcontextWza,
  ) => Expanded(
    child: PageView.builder(
      itemCount: B17PeeFileTabTyFie.values.length,
      controller: b17VqmcontrollerXze.pageController,
      onPageChanged: (index) {
        b17VqmcontrollerXze.b17HqmPageChangedWza(index, b17HqmcontextWza);
      },
      itemBuilder: (context, index) {
        return B17QxmFilesListChildPageVza(
          type: B17PeeFileTabTyFie.values[index],
        );
      },
    ),
  );

  _tabWidget(B17RkpHomeChildControllerXwe b17VqmcontrollerXze) => SizedBox(
    width: double.infinity,
    height: 36.h,
    child: ListView.separated(
      itemCount: B17PeeFileTabTyFie.values.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var type = B17PeeFileTabTyFie.values[index];
        final b17QxmSelectedVza =
            index == b17VqmcontrollerXze.b17QmvSelectedTabIndexNza;
        return B17MfwTapGuardViewQke(
          b17JkcOnPressedXwu: () {
            b17VqmcontrollerXze.clickTabItem(type);
          },
          b17HnqChildVsa: Container(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.w),
              color: b17QxmSelectedVza ? null : Colors.white,
              gradient: b17QxmSelectedVza
                  ? LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xffFF8E71), Color(0xffA77FF1)],
                    )
                  : null,
              border: Border.all(width: 1.w, color: Color(0xffEBEBEB)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                B17PzrAssetImageViewXcu(
                  b17QxmSelectedVza ? type.iconSel : type.iconUns,
                  b17DtvWidthQpl: 16.w,
                  b17RnxHeightKse: 16.w,
                ),
                SizedBox(width: 2.w),
                B17CxmLocalizedTextViewPra(
                  type.name.tr,
                  b17RvxFontSizeQle: 14.sp,
                  b17DtkColorZma: b17QxmSelectedVza
                      ? Colors.white
                      : const Color(0xff4B5156),
                  b17HncFontWeightYsp: FontWeight.bold,
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(width: 8.w),
    ),
  );

  _addSmallWidget(B17RkpHomeChildControllerXwe b17VqmcontrollerXze) => Stack(
    alignment: Alignment.topLeft,
    children: [
      Container(
        width: double.infinity,
        height: 56.h,
        margin: EdgeInsets.only(top: 8.h),
        padding: EdgeInsets.only(left: 76.w, right: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
          border: Border.all(width: 0.5.w, color: Color(0xffEBEBEB)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xffFCF2F7), Color(0xffFEF3F6)],
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: B17CxmLocalizedTextViewPra(
                "To access features instantly, add the widget!".tr,
                b17RvxFontSizeQle: 14.sp,
                b17DtkColorZma: Colors.black,
                b17FzrOverflowXke: TextOverflow.ellipsis,
                b17PqmMaxLinesTva: 2,
              ),
            ),
            SizedBox(width: 8.w),
            B17MfwTapGuardViewQke(
              b17JkcOnPressedXwu: () {
                B17KqmAddWidgetHepVze.instance.b17EerShowAddWidgetDialogLxc();
              },
              b17HnqChildVsa: Container(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 4.h,
                  bottom: 4.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.w),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xffFD7734), Color(0xffF73A70)],
                  ),
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
      ),
      Container(
        margin: EdgeInsets.only(left: 8.w),
        child: B17PzrAssetImageViewXcu(
          "b17_bul_add_small_widget_fil",
          b17DtvWidthQpl: 60.w,
          b17RnxHeightKse: 60.w,
        ),
      ),
    ],
  );

  _topWidget(B17RkpHomeChildControllerXwe b17VqmcontrollerXze) => SafeArea(
    top: true,
    bottom: false,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            B17CxmLocalizedTextViewPra(
              "Files".tr,
              b17RvxFontSizeQle: 28.sp,
              b17DtkColorZma: Colors.black,
              b17HncFontWeightYsp: FontWeight.bold,
            ),
            Expanded(
              child: kDebugMode
                  ? B17MfwTapGuardViewQke(
                      b17JkcOnPressedXwu: () {
                        b17VqmcontrollerXze.test();
                      },
                      b17HnqChildVsa: Container(
                        width: double.infinity,
                        height: 20.h,
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Container(
          width: double.infinity,
          height: 48.h,
          padding: EdgeInsets.all(1.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.w),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xffFF8E71), Color(0xffA77FF1)],
            ),
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: Row(
              children: [
                B17PzrAssetImageViewXcu(
                  "b17_fjh_search_ief",
                  b17DtvWidthQpl: 24.w,
                  b17RnxHeightKse: 24.w,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: TextField(
                    enabled: true,
                    textAlign: TextAlign.left,
                    controller: b17VqmcontrollerXze.textEditingController,
                    textInputAction: TextInputAction.search,
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                    onTap: () {
                      B17DjiTbaHepWji.instance.b17KqnUploadPointVxe(
                        b17QxnPointTypeVza: B17JdwPointTypeIjd.search_click,
                      );
                    },
                    decoration: InputDecoration(
                      counterText: '',
                      isCollapsed: true,
                      hintText: "Search...".tr,
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xff858C92),
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: b17VqmcontrollerXze.b17PqmSearchFilesXza,
                    onSubmitted: b17VqmcontrollerXze.b17PqmSearchFilesXza,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
