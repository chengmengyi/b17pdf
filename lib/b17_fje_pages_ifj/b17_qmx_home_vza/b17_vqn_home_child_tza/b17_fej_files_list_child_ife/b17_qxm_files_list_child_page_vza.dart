import 'dart:async';

import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jiw_ad_hep_djo.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_qmx_home_vza/b17_vqn_home_child_tza/b17_fej_files_list_child_ife/b17_hqm_files_list_child_controller_wze.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_qmx_home_vza/b17_vqn_home_child_tza/b17_rkp_home_child_controller_xwe.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_mxk_root_child_qza.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_pzr_asset_image_view_xcu.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_vny_media_padding_view_qsl.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_dkg_refresh_view_wta.dart';
import 'package:b17pdf/b17_krt_view_mxa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdf_ad_plugins/flutter_pdf_ad_plugins.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

class B17QxmFilesListChildPageVza extends B17MxkRootChildQza {
  final B17PeeFileTabTyFie type;
  const B17QxmFilesListChildPageVza({super.key, required this.type});

  @override
  State<B17QxmFilesListChildPageVza> createState() =>
      _B17VqnFilesListChildStateXre();
}

class _B17VqnFilesListChildStateXre
    extends
        B17PrvRootChildStateWlt<
          B17HqmFilesListChildControllerWze,
          B17QxmFilesListChildPageVza
        > {
  @override
  String get b17VdsControllerTagYre => 'b16_files_${widget.type.name}';

  @override
  B17HqmFilesListChildControllerWze b17NwzCreateControllerTpi() {
    return B17HqmFilesListChildControllerWze(type: widget.type);
  }

  @override
  Widget b17YksBuildContentUvd(
    BuildContext b17KqmContextWza,
    B17HqmFilesListChildControllerWze b17VqnControllerXre,
  ) {
    return GetBuilder<B17HqmFilesListChildControllerWze>(
      init: b17VqnControllerXre,
      global: false,
      builder: (b17QxmControllerVza) {
        return Column(
          children: [
            _b17DphSortWidgetAjj(b17QxmControllerVza),
            SizedBox(height: 8.h),
            _b17IpmContentWidgetRmp(b17QxmControllerVza),
          ],
        );
      },
    );
  }

  Widget _b17DphSortWidgetAjj(
    B17HqmFilesListChildControllerWze b17VqncontrollerXre,
  ) => Row(
    children: [
      Expanded(
        child: B17CxmLocalizedTextViewPra(
          "Local Storage".tr,
          b17RvxFontSizeQle: 18.sp,
          b17DtkColorZma: Colors.black,
          b17HncFontWeightYsp: FontWeight.bold,
          b17FzrOverflowXke: TextOverflow.ellipsis,
        ),
      ),
      SizedBox(width: 8.w),
      B17MfwTapGuardViewQke(
        b17JkcOnPressedXwu: () {
          b17VqncontrollerXre.b17OteClickSortNcs();
        },
        b17HnqChildVsa: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            B17PzrAssetImageViewXcu(
              b17VqncontrollerXre.b17PqnSortTypeVza.b17KqnIconVxe,
              b17DtvWidthQpl: 20.w,
              b17RnxHeightKse: 20.w,
            ),
            SizedBox(width: 4.w),
            B17CxmLocalizedTextViewPra(
              "Sort".tr,
              b17RvxFontSizeQle: 14.sp,
              b17DtkColorZma: Color(0xff858C92),
              b17HncFontWeightYsp: FontWeight.w500,
            ),
          ],
        ),
      ),
      SizedBox(width: 12.w),
      B17MfwTapGuardViewQke(
        b17JkcOnPressedXwu: () {
          b17VqncontrollerXre.b17DgpClickDeleteFileQky();
        },
        b17HnqChildVsa: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            B17PzrAssetImageViewXcu(
              "b17_fje_select_ifj",
              b17DtvWidthQpl: 20.w,
              b17RnxHeightKse: 20.w,
            ),
            SizedBox(width: 4.w),
            B17CxmLocalizedTextViewPra(
              "Select".tr,
              b17RvxFontSizeQle: 14.sp,
              b17DtkColorZma: Color(0xff858C92),
              b17HncFontWeightYsp: FontWeight.w500,
            ),
          ],
        ),
      ),
    ],
  );

  Widget _b17IpmContentWidgetRmp(
    B17HqmFilesListChildControllerWze b17VqncontrollerXre,
  ) => Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.w),
        border: Border.all(width: 0.5.w, color: Color(0xffEBEBEB)),
      ),
      child: switch (b17VqncontrollerXre.b17PqmListStateXza) {
        B17QmvFilesListStateNza.noPermission =>
          _b17QxnEmptyWithDemoFileWidgetVza(
            b17PqnControllerVze: b17VqncontrollerXre,
            b17VqnEmptyWidgetTza: _b17OidNoPermissionWidgetPlb(
              b17VqncontrollerXre,
            ),
          ),
        B17QmvFilesListStateNza.loading => _b17XalLoadingWidgetMkl(),
        B17QmvFilesListStateNza.loaded =>
          b17VqncontrollerXre.b17VqmVisibleFilesWza.isEmpty
              ? _b17QxnEmptyWithDemoFileWidgetVza(
                  b17PqnControllerVze: b17VqncontrollerXre,
                  b17VqnEmptyWidgetTza: _b17KqmNoFilesWidgetWze(
                    b17VqncontrollerXre,
                  ),
                )
              : _b17QypListViewWidgetMcf(b17VqncontrollerXre),
      },
    ),
  );

  Widget _b17QypListViewWidgetMcf(
    B17HqmFilesListChildControllerWze b17VqncontrollerXre,
  ) => B17VnyMediaPaddingViewQsl(
    b17QzpChildMwa: B17DkgRefreshViewWta(
      b17NpkEnableLoadMoreXvu: false,
      b17XqmControllerVta: b17VqncontrollerXre.refreshController,
      b17GzrScrollControllerQma: b17VqncontrollerXre.b17PqnScrollControllerVze,
      b17CqpOnRefreshYdu: b17VqncontrollerXre.b17VqmRefreshFilesWza,
      b17JkzChildNwe: _b17KqnFileListWidgetVze(b17VqncontrollerXre),
    ),
  );

  Widget _b17KqnFileListWidgetVze(
    B17HqmFilesListChildControllerWze b17PqnControllerVze,
  ) {
    final bool b17QxmCanShowNativeAdVza =
        b17PqnControllerVze.b17HqmCanShowNativeAdWza;
    final int b17VqmNativeAdCountWza = b17QxmCanShowNativeAdVza
        ? b17PqnControllerVze.b17VqmVisibleFilesWza.length ~/
              B17HqmFilesListChildControllerWze.b17KqmNativeAdIntervalVze
        : 0;
    final int b17HqmItemCountWza =
        b17PqnControllerVze.b17VqmVisibleFilesWza.length +
        b17VqmNativeAdCountWza;
    b17PqnControllerVze.b17PqnSyncNativeAdListStateVze(b17HqmItemCountWza);
    return ListView.builder(
      itemCount: b17HqmItemCountWza,
      itemBuilder: (context, index) {
        if (b17QxmCanShowNativeAdVza &&
            b17PqnControllerVze.b17VqnIsNativeAdIndexTza(index)) {
          return _b17HqmNativeAdSlotWidgetWza(
            b17PqnControllerVze: b17PqnControllerVze,
            b17KqnListIndexVze: index,
            b17PqnShowNativeAdVze:
                b17PqnControllerVze.b17PqmActiveNativeAdIndexXza == index,
          );
        }
        final int b17QxmFileIndexVza = b17QxmCanShowNativeAdVza
            ? b17PqnControllerVze.b17VqmFileIndexFromListIndexWza(index)
            : index;
        final b17QxmFileVza =
            b17PqnControllerVze.b17VqmVisibleFilesWza[b17QxmFileIndexVza];
        return _b17RqmFileItemWidgetWza(b17PqnControllerVze, b17QxmFileVza);
      },
    );
  }

  Widget _b17HqmNativeAdSlotWidgetWza({
    required B17HqmFilesListChildControllerWze b17PqnControllerVze,
    required int b17KqnListIndexVze,
    required bool b17PqnShowNativeAdVze,
  }) {
    b17PqnControllerVze.b17HqmPrepareNativeAdSlotWza(b17KqnListIndexVze);
    return VisibilityDetector(
      key: ValueKey('b16_file_inline_ad_$b17KqnListIndexVze'),
      onVisibilityChanged: (b17VqmInfoWza) =>
          b17PqnControllerVze.b17PqnUpdateNativeAdVisibilityVze(
            b17KqnListIndexVze,
            b17VqmInfoWza.visibleFraction > 0,
          ),
      child: SizedBox(
        width: double.infinity,
        height: 68.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          child: b17PqnShowNativeAdVze
              ? KeyedSubtree(
                  key: ValueKey(
                    'b16_file_native_${b17KqnListIndexVze}_${b17PqnControllerVze.b17QxnNativeAdRefreshKeyVza}',
                  ),
                  child: const _B17KqnFilesNativeAdContentVze(),
                )
              : const B17PzrAssetImageViewXcu(
                  'b17_kqn_native_ad_cover_vze',
                  b17DtvWidthQpl: double.infinity,
                ),
        ),
      ),
    );
  }

  String _b17KqnFileIconVze(FileToolsFileInfo b17QxmFileVza) =>
      switch (b17QxmFileVza.type) {
        FileToolsDocumentType.pdf => 'b17_gpf_pdf_logo_tpd',
        FileToolsDocumentType.excel => 'b17_qlt_excel_logo_ouw',
        _ => 'b17_ouq_word_logo_auf',
      };

  String _b17PqmFileDetailWza(FileToolsFileInfo b17VqnFileTze) {
    final b17HqmDateWza = DateTime.fromMillisecondsSinceEpoch(
      b17VqnFileTze.updateTime ?? 0,
    );
    final b17KqnDateTextVze =
        '${b17HqmDateWza.year}-${b17HqmDateWza.month.toString().padLeft(2, '0')}-${b17HqmDateWza.day.toString().padLeft(2, '0')}';
    final b17PqmSizeXza = (b17VqnFileTze.size ?? 0) / 1024 / 1024;
    return '$b17KqnDateTextVze | ${b17PqmSizeXza.toStringAsFixed(1)}M';
  }

  Widget _b17RqmFileItemWidgetWza(
    B17HqmFilesListChildControllerWze b17PqnControllerVze,
    FileToolsFileInfo b17QxmFileVza,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        B17MfwTapGuardViewQke(
          b17JkcOnPressedXwu: () =>
              b17PqnControllerVze.b17XxoClickFileItemDgu(b17QxmFileVza),
          b17HnqChildVsa: Container(
            width: double.infinity,
            height: 72.h,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                B17PzrAssetImageViewXcu(
                  _b17KqnFileIconVze(b17QxmFileVza),
                  b17DtvWidthQpl: 32.w,
                  b17RnxHeightKse: 32.w,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      B17CxmLocalizedTextViewPra(
                        b17QxmFileVza.name ?? '',
                        b17RvxFontSizeQle: 14.sp,
                        b17DtkColorZma: Colors.black,
                        b17HncFontWeightYsp: FontWeight.bold,
                        b17FzrOverflowXke: TextOverflow.ellipsis,
                      ),
                      B17CxmLocalizedTextViewPra(
                        _b17PqmFileDetailWza(b17QxmFileVza),
                        b17RvxFontSizeQle: 12.sp,
                        b17DtkColorZma: const Color(0xff858C92),
                        b17HncFontWeightYsp: FontWeight.w500,
                        b17FzrOverflowXke: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 0.5.h,
          color: const Color(0xffEBEBEB),
        ),
      ],
    );
  }

  Widget _b17QxnEmptyWithDemoFileWidgetVza({
    required B17HqmFilesListChildControllerWze b17PqnControllerVze,
    required Widget b17VqnEmptyWidgetTza,
  }) {
    final FileToolsFileInfo? b17QxmDemoFileVza =
        b17PqnControllerVze.b17QxnDemoFileInfoVza;
    if (b17QxmDemoFileVza == null) {
      return b17VqnEmptyWidgetTza;
    }
    return Column(
      children: [
        _b17RqmFileItemWidgetWza(b17PqnControllerVze, b17QxmDemoFileVza),
        Expanded(child: b17VqnEmptyWidgetTza),
      ],
    );
  }

  Widget _b17KqmNoFilesWidgetWze(
    B17HqmFilesListChildControllerWze b17PqnControllerVze,
  ) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          B17PzrAssetImageViewXcu(
            'b17_gpf_pdf_logo_tpd',
            b17DtvWidthQpl: 72.w,
            b17RnxHeightKse: 72.w,
          ),
          SizedBox(height: 16.h),
          B17CxmLocalizedTextViewPra(
            'No files found'.tr,
            b17RvxFontSizeQle: 18.sp,
            b17DtkColorZma: Colors.black,
            b17HncFontWeightYsp: FontWeight.bold,
          ),
          SizedBox(height: 24.h),
          B17MfwTapGuardViewQke(
            b17JkcOnPressedXwu: b17PqnControllerVze.b17VqmRefreshFilesWza,
            b17HnqChildVsa: Container(
              height: 42.h,
              constraints: BoxConstraints(minWidth: 132.w),
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.w),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xffFF8E71), Color(0xffA77FF1)],
                ),
              ),
              child: B17CxmLocalizedTextViewPra(
                'Try again'.tr,
                b17RvxFontSizeQle: 14.sp,
                b17DtkColorZma: Colors.white,
                b17HncFontWeightYsp: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _b17XalLoadingWidgetMkl() =>
      Center(child: CircularProgressIndicator());

  Widget _b17OidNoPermissionWidgetPlb(
    B17HqmFilesListChildControllerWze b17VqncontrollerXre,
  ) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      B17PzrAssetImageViewXcu(
        "b17_fje_lock_ifj",
        b17DtvWidthQpl: 80.w,
        b17RnxHeightKse: 80.w,
      ),
      SizedBox(height: 16.h),
      B17CxmLocalizedTextViewPra(
        "No permissions granted".tr,
        b17RvxFontSizeQle: 20.sp,
        b17DtkColorZma: Colors.black,
        b17HncFontWeightYsp: FontWeight.bold,
      ),
      SizedBox(height: 6.h),
      B17CxmLocalizedTextViewPra(
        "Permission is required to access all files".tr,
        b17RvxFontSizeQle: 14.sp,
        b17DtkColorZma: Color(0xff4B5156),
      ),
      SizedBox(height: 40.h),
      B17MfwTapGuardViewQke(
        b17JkcOnPressedXwu: () {
          b17VqncontrollerXre.b17LozClickRequestPermissionOsz();
        },
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
            "Go to settings".tr,
            b17RvxFontSizeQle: 16.sp,
            b17DtkColorZma: Colors.white,
            b17HncFontWeightYsp: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

class _B17KqnFilesNativeAdContentVze extends StatefulWidget {
  const _B17KqnFilesNativeAdContentVze();

  @override
  State<_B17KqnFilesNativeAdContentVze> createState() =>
      _B17VqmFilesNativeAdContentStateWza();
}

class _B17VqmFilesNativeAdContentStateWza
    extends State<_B17KqnFilesNativeAdContentVze> {
  Widget? _b17PqnNativeAdWidgetVze;

  @override
  void initState() {
    super.initState();
    unawaited(_b17KqnLoadNativeAdWidgetVze());
  }

  Future<void> _b17KqnLoadNativeAdWidgetVze() async {
    final Widget? b17QxmAdWidgetVza = await B17JiwAdHepDjo
        .b17KqmAdUtilsInstanceVzr
        .b17PqmTakeFilesListNativeAdWidgetVzr(
          b17PqmLoadIfNeededVzr: true,
          b17PqmReloadAfterTakeVzr: true,
          b17PqmDisposeDelayVzr: Duration.zero,
        );
    if (b17QxmAdWidgetVza == null) return;
    if (!mounted) {
      try {
        await FlutterPdfAdPlugins.instance.disposeTakenAdWidget(
          b17QxmAdWidgetVza,
        );
      } catch (_) {}
      return;
    }
    setState(() => _b17PqnNativeAdWidgetVze = b17QxmAdWidgetVza);
  }

  @override
  Widget build(BuildContext context) =>
      _b17PqnNativeAdWidgetVze ??
      const B17PzrAssetImageViewXcu(
        'b17_kqn_native_ad_cover_vze',
        b17DtvWidthQpl: double.infinity,
      );
}
