import 'dart:async';

import 'package:b17pdf/b17_tqa_monetization_vhf/b17_hwi_advertising_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_rke_documents_wpt/b17_qmx_workspace_vza/b17_vqn_dashboard_section_tza/b17_fej_documents_list_section_ife/b17_hqm_documents_list_section_controller_wze.dart';
import 'package:b17pdf/b17_rke_documents_wpt/b17_qmx_workspace_vza/b17_vqn_dashboard_section_tza/b17_rkp_dashboard_section_controller_xwe.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_mxk_base_section_qza.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_pzr_asset_picture_view_xcu.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_cxm_localized_text_view_pra.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_vny_media_padding_view_qsl.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_dkg_refresh_view_wta.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_hcv_widgets_rqa/b17_mfw_tap_guard_view_qke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdf_ad_plugins/flutter_pdf_ad_plugins.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

class B17QxmDocumentsListSectionPageVza extends B17MxkBaseSectionQza {
  final B17PeeDocumentTabTyFie type;
  final bool b17QxnSectionActiveVza;

  const B17QxmDocumentsListSectionPageVza({
    super.key,
    required this.type,
    required this.b17QxnSectionActiveVza,
  });

  @override
  State<B17QxmDocumentsListSectionPageVza> createState() =>
      _B17VqnDocumentsListSectionStateXre();
}

class _B17VqnDocumentsListSectionStateXre
    extends
        B17PrvBaseSectionStateWlt<
          B17HqmDocumentsListSectionControllerWze,
          B17QxmDocumentsListSectionPageVza
        > {
  @override
  void initState() {
    super.initState();
    b17FshControllerLeaseQya.b17NqxControllerRfe.b17QxnUpdateSectionActiveVza(
      widget.b17QxnSectionActiveVza,
    );
  }

  @override
  void didUpdateWidget(covariant B17QxmDocumentsListSectionPageVza oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.b17QxnSectionActiveVza != widget.b17QxnSectionActiveVza) {
      b17FshControllerLeaseQya.b17NqxControllerRfe.b17QxnUpdateSectionActiveVza(
        widget.b17QxnSectionActiveVza,
      );
    }
  }

  @override
  String get b17VdsControllerTagYre => 'b17_files_${widget.type.name}';

  @override
  B17HqmDocumentsListSectionControllerWze b17NwzCreateControllerTpi() {
    return B17HqmDocumentsListSectionControllerWze(type: widget.type);
  }

  @override
  Widget b17YksBuildContentUvd(
    BuildContext b17KqmContextWza,
    B17HqmDocumentsListSectionControllerWze b17VqnControllerXre,
  ) {
    return VisibilityDetector(
      key: ValueKey<String>('b17_documents_page_${widget.type.name}'),
      onVisibilityChanged: (VisibilityInfo b17QxnInfoVza) => b17VqnControllerXre
          .b17VqnUpdatePageVisibilityTza(b17QxnInfoVza.visibleFraction > 0),
      child: GetBuilder<B17HqmDocumentsListSectionControllerWze>(
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
      ),
    );
  }

  Widget _b17DphSortWidgetAjj(
    B17HqmDocumentsListSectionControllerWze b17VqncontrollerXre,
  ) => Row(
    children: [
      Expanded(
        child: B17MfwTapGuardViewQke(
          b17JkcOnPressedXwu: () {
            b17VqncontrollerXre.test();
          },
          b17HnqChildVsa: B17CxmLocalizedTextViewPra(
            "Local Storage".tr,
            b17RvxFontSizeQle: 18.sp,
            b17DtkColorZma: Colors.black,
            b17HncFontWeightYsp: FontWeight.bold,
            b17FzrOverflowXke: TextOverflow.ellipsis,
          ),
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
            B17PzrAssetPictureViewXcu(
              "b17_jij_sort_icon_jiw",
              b17DtvWidthQpl: 22.w,
              b17RnxHeightKse: 22.w,
            ),
            SizedBox(width: 4.w),
            B17CxmLocalizedTextViewPra(
              "Sort".tr,
              b17RvxFontSizeQle: 12.sp,
              b17DtkColorZma: Color(0xff555978),
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
            B17PzrAssetPictureViewXcu(
              "b17_fje_selection_asset_ifj",
              b17DtvWidthQpl: 22.w,
              b17RnxHeightKse: 22.w,
            ),
            SizedBox(width: 4.w),
            B17CxmLocalizedTextViewPra(
              "Select".tr,
              b17RvxFontSizeQle: 12.sp,
              b17DtkColorZma: Color(0xff555978),
              b17HncFontWeightYsp: FontWeight.w500,
            ),
          ],
        ),
      ),
    ],
  );

  Widget _b17IpmContentWidgetRmp(
    B17HqmDocumentsListSectionControllerWze b17VqncontrollerXre,
  ) => Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: switch (b17VqncontrollerXre.b17PqmListStateXza) {
        B17QmvDocumentsListStateNza.noPermission =>
          _b17QxnEmptyWithDemoFileWidgetVza(
            b17PqnControllerVze: b17VqncontrollerXre,
            b17VqnEmptyWidgetTza: _b17OidNoPermissionWidgetPlb(
              b17VqncontrollerXre,
            ),
          ),
        B17QmvDocumentsListStateNza.loading => _b17XalLoadingWidgetMkl(),
        B17QmvDocumentsListStateNza.loaded =>
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
    B17HqmDocumentsListSectionControllerWze b17VqncontrollerXre,
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
    B17HqmDocumentsListSectionControllerWze b17PqnControllerVze,
  ) {
    final bool b17QxmCanShowNativeAdVza =
        b17PqnControllerVze.b17HqmCanShowNativeAdWza;
    final int b17VqmNativeAdCountWza = b17QxmCanShowNativeAdVza
        ? b17PqnControllerVze.b17VqmVisibleFilesWza.length ~/
              B17HqmDocumentsListSectionControllerWze.b17KqmNativeAdIntervalVze
        : 0;
    final int b17HqmItemCountWza =
        b17PqnControllerVze.b17VqmVisibleFilesWza.length +
        b17VqmNativeAdCountWza;
    b17PqnControllerVze.b17PqnSyncNativeAdListStateVze(b17HqmItemCountWza);
    return ListView.separated(
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
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 8.h),
    );
  }

  Widget _b17HqmNativeAdSlotWidgetWza({
    required B17HqmDocumentsListSectionControllerWze b17PqnControllerVze,
    required int b17KqnListIndexVze,
    required bool b17PqnShowNativeAdVze,
  }) {
    b17PqnControllerVze.b17HqmPrepareNativeAdSlotWza(b17KqnListIndexVze);
    return VisibilityDetector(
      key: ValueKey<String>(
        'b17_fia_document_inline_ad_${widget.type.name}_${b17KqnListIndexVze}_vke',
      ),
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
                    'b17_fna_document_native_ad_${b17KqnListIndexVze}_${b17PqnControllerVze.b17QxnNativeAdRefreshKeyVza}_vke',
                  ),
                  child: const _B17KqnDocumentsNativeAdContentVze(),
                )
              : const B17PzrAssetPictureViewXcu(
                  'b17_kqn_native_advert_cover_asset_vze',
                  b17DtvWidthQpl: double.infinity,
                ),
        ),
      ),
    );
  }

  String _b17KqnFileIconVze(FileToolsFileInfo b17QxmFileVza) =>
      switch (b17QxmFileVza.type) {
        FileToolsDocumentType.pdf => 'b17_gpf_pdf_logo_asset_tpd',
        FileToolsDocumentType.excel => 'b17_qlt_excel_logo_asset_ouw',
        _ => 'b17_ouq_word_logo_asset_auf',
      };

  Color _b17QxnFileBackgroundColorVza(FileToolsFileInfo b17QxmFileVza) =>
      switch (b17QxmFileVza.type) {
        FileToolsDocumentType.word => const Color(0xff2C90FE),
        FileToolsDocumentType.excel => const Color(0xff01C87C),
        _ => const Color(0xffF85758),
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
    B17HqmDocumentsListSectionControllerWze b17PqnControllerVze,
    FileToolsFileInfo b17QxmFileVza,
  ) {
    return B17MfwTapGuardViewQke(
      b17JkcOnPressedXwu: () =>
          b17PqnControllerVze.b17XxoClickFileItemDgu(b17QxmFileVza),
      b17HnqChildVsa: Container(
        width: double.infinity,
        height: 68.h,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              _b17QxnFileBackgroundColorVza(b17QxmFileVza).withOpacity(0.08),
              Colors.transparent,
            ],
          ),
        ),
        child: Row(
          children: [
            B17PzrAssetPictureViewXcu(
              _b17KqnFileIconVze(b17QxmFileVza),
              b17DtvWidthQpl: 40.w,
              b17RnxHeightKse: 40.w,
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
                    b17DtkColorZma: Color(0xff242C3C),
                    b17HncFontWeightYsp: FontWeight.bold,
                    b17FzrOverflowXke: TextOverflow.ellipsis,
                  ),
                  B17CxmLocalizedTextViewPra(
                    _b17PqmFileDetailWza(b17QxmFileVza),
                    b17RvxFontSizeQle: 10.sp,
                    b17DtkColorZma: const Color(0xff9C9FAE),
                    b17HncFontWeightYsp: FontWeight.w500,
                    b17FzrOverflowXke: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _b17QxnEmptyWithDemoFileWidgetVza({
    required B17HqmDocumentsListSectionControllerWze b17PqnControllerVze,
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
    B17HqmDocumentsListSectionControllerWze b17PqnControllerVze,
  ) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          B17PzrAssetPictureViewXcu(
            'b17_gpf_pdf_logo_asset_tpd',
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
    B17HqmDocumentsListSectionControllerWze b17VqncontrollerXre,
  ) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      B17PzrAssetPictureViewXcu(
        "b17_fje_secure_asset_ifj",
        b17DtvWidthQpl: 75.w,
        b17RnxHeightKse: 75.w,
      ),
      SizedBox(height: 16.h),
      B17CxmLocalizedTextViewPra(
        "No permissions granted".tr,
        b17RvxFontSizeQle: 18.sp,
        b17DtkColorZma: Color(0xff242C3C),
        b17HncFontWeightYsp: FontWeight.bold,
      ),
      SizedBox(height: 6.h),
      B17CxmLocalizedTextViewPra(
        "Permission is required to access all files".tr,
        b17RvxFontSizeQle: 14.sp,
        b17DtkColorZma: Color(0xff555978),
      ),
      SizedBox(height: 40.h),
      B17MfwTapGuardViewQke(
        b17JkcOnPressedXwu: () {
          b17VqncontrollerXre.b17LozClickRequestPermissionOsz();
        },
        b17HnqChildVsa: Container(
          padding: EdgeInsets.only(
            left: 36.w,
            right: 36.w,
            top: 8.h,
            bottom: 8.h,
          ),
          decoration: BoxDecoration(
            color: Color(0xffD12629),
            borderRadius: BorderRadius.circular(42.w),
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

class _B17KqnDocumentsNativeAdContentVze extends StatefulWidget {
  const _B17KqnDocumentsNativeAdContentVze();

  @override
  State<_B17KqnDocumentsNativeAdContentVze> createState() =>
      _B17VqmDocumentsNativeAdContentStateWza();
}

class _B17VqmDocumentsNativeAdContentStateWza
    extends State<_B17KqnDocumentsNativeAdContentVze> {
  Widget? _b17PqnNativeAdWidgetVze;

  @override
  void initState() {
    super.initState();
    unawaited(_b17KqnLoadNativeAdWidgetVze());
  }

  Future<void> _b17KqnLoadNativeAdWidgetVze() async {
    final Widget? b17QxmAdWidgetVza = await B17JiwAdFuncDjo
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
  Widget build(BuildContext context) {
    if(null==_b17PqnNativeAdWidgetVze){
      return const B17PzrAssetPictureViewXcu(
        'b17_kqn_native_advert_cover_asset_vze',
        b17DtvWidthQpl: double.infinity,
      );
    }
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        border: Border.all(
          width: 1.w,
          color: Colors.black,
        ),
      ),
      child: _b17PqnNativeAdWidgetVze,
    );
  }
}
