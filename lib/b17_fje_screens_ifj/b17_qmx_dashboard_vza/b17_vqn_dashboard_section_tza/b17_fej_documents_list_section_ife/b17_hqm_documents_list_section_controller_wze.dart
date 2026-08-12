import 'dart:async';
import 'dart:io';

import 'package:b17pdf/b17_dji_func_jdo/b17_fje_device_info_ifj.dart';
import 'package:b17pdf/b17_fji_popup_fji/b17_fji_sort_bottom_popup_ewf/b17_fji_sort_bottom_popup_ewf.dart';
import 'package:b17pdf/b17_fji_popup_fji/b17_fji_sort_bottom_popup_ewf/b17_brf_sort_bottom_popup_fjiewfjoe_controller_pnh.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fhi_signal_func_ejo/b17_fhi_signal_bean_feo.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fhi_signal_func_ejo/b17_qxm_signal_code_vza.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fhi_signal_func_ejo/b17_fji_signal_func_eji.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_qxn_demo_document_func_vza.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_qzm_access_func_xva/b17_kqn_access_func_vze.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_address_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fef_cache_func_jei/b17_mqn_document_sort_cache_vza.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_jdw_metric_type_ijd.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_dji_analytics_func_wji.dart';
import 'package:b17pdf/b17_fje_screens_ifj/b17_qmx_dashboard_vza/b17_vqn_dashboard_section_tza/b17_rkp_dashboard_section_controller_xwe.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_fje_base_controller_sak.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:device_info_plus/device_info_plus.dart';

enum B17QmvDocumentsListStateNza { noPermission, loading, loaded }

class B17HqmDocumentsListSectionControllerWze extends B17FjeBaseControllerSak {
  static const int b17KqmNativeAdIntervalVze = 4;
  static const Duration _b17VqnNativeAdRefreshDurationTza = Duration(
    seconds: 10,
  );
  static const Duration _b17HqmScrollIdleDurationWza = Duration(
    milliseconds: 280,
  );

  final B17PeeDocumentTabTyFie type;
  final RefreshController refreshController = RefreshController();
  final ScrollController b17PqnScrollControllerVze = ScrollController();
  final Set<int> _b17VqmVisibleNativeAdIndexesWza = <int>{};
  Timer? _b17KqnScrollIdleTimerVze;
  Timer? _b17HqmNativeAdRefreshTimerWza;
  B17QmvDocumentsListStateNza b17PqmListStateXza =
      B17QmvDocumentsListStateNza.loading;
  List<FileToolsFileInfo> b17KqnAllFilesVze = [];
  List<FileToolsFileInfo> b17VqmVisibleFilesWza = [];
  FileToolsFileInfo? b17QxnDemoFileInfoVza;
  String b17HqmSearchTextXze = '';
  bool b17VqnLoadingFilesTza = false;
  bool b17KqmHasLoadedFilesWze = false;
  bool b17QxnAppInForegroundVza = true;
  int? b17PqmActiveNativeAdIndexXza;
  int? _b17VqnLastChanceNativeAdIndexTza;
  int b17QxnNativeAdRefreshKeyVza = 0;
  int _b17KqmLatestListItemCountWze = 0;
  bool _b17PqnIsListScrollingVze = false;
  bool _b17VqmIsRefreshingNativeAdWza = false;
  bool _b17QxnNativeAdSwitchEnabledVza = false;
  late B17JffSortTypeRiq b17PqnSortTypeVza;

  B17HqmDocumentsListSectionControllerWze({required this.type});

  Future<Permission> _b17QxmStoragePermissionVza() async {
    if (!Platform.isAndroid) return Permission.storage;
    final b17KqnAndroidInfoVze = await DeviceInfoPlugin().androidInfo;
    return b17KqnAndroidInfoVze.version.sdkInt >= 30
        ? Permission.manageExternalStorage
        : Permission.storage;
  }

  @override
  void onInit() {
    b17PqnSortTypeVza = B17JffSortTypeRiq.values.firstWhere(
      (b17VqmItemXza) =>
          b17VqmItemXza.name ==
          B17MqnDocumentSortCacheVza.b17HqmReadSortNameWze(type.name),
      orElse: () => B17JffSortTypeRiq.dateNew,
    );
    super.onInit();
    b17PqnScrollControllerVze.addListener(_b17KqmHandleScrollWze);
    unawaited(_b17PqnInitializeNativeAdSwitchVze());
  }

  Future<void> _b17PqnInitializeNativeAdSwitchVze() async {
    _b17QxnNativeAdSwitchEnabledVza = await B17JiwAdFuncDjo
        .b17KqmAdUtilsInstanceVzr
        .b17VqnCanShowAdBySwitchTza(B17JkwPosidKos.pr_main_banner1);
    if (isClosed) return;
    if (!_b17QxnNativeAdSwitchEnabledVza) {
      _b17KqnClearActiveNativeAdVze();
    }
    update();
  }

  bool get b17HqmCanShowNativeAdWza =>
      _b17QxnNativeAdSwitchEnabledVza &&
      B17QxnUserCheckFuncVza.instance.b17VqnIsEligibleUserTza &&
      b17VqmVisibleFilesWza.length >= b17KqmNativeAdIntervalVze;

  bool b17VqnIsNativeAdIndexTza(int b17KqnIndexVze) =>
      (b17KqnIndexVze + 1) % (b17KqmNativeAdIntervalVze + 1) == 0;

  int b17VqmFileIndexFromListIndexWza(int b17PqnIndexVze) =>
      b17PqnIndexVze - (b17PqnIndexVze + 1) ~/ (b17KqmNativeAdIntervalVze + 1);

  void b17PqnSyncNativeAdListStateVze(int b17VqmItemCountWza) {
    _b17KqmLatestListItemCountWze = b17VqmItemCountWza;
    _b17VqmVisibleNativeAdIndexesWza.removeWhere(
      (b17KqnIndexVze) => b17KqnIndexVze >= b17VqmItemCountWza,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isClosed || _b17VqmIsRefreshingNativeAdWza) return;
      if (!b17HqmCanShowNativeAdWza || b17VqmItemCountWza <= 0) {
        _b17KqnClearActiveNativeAdVze();
      } else if (b17PqmActiveNativeAdIndexXza == null ||
          b17PqmActiveNativeAdIndexXza! >= b17VqmItemCountWza) {
        _b17QxmActivateNativeAdVza();
      } else {
        _b17VqnStartNativeAdRefreshTimerTza();
      }
    });
  }

  void b17HqmPrepareNativeAdSlotWza(int b17KqnListIndexVze) {
    if (b17HqmCanShowNativeAdWza &&
        b17PqmActiveNativeAdIndexXza == b17KqnListIndexVze &&
        _b17VqnLastChanceNativeAdIndexTza != b17KqnListIndexVze) {
      _b17VqnLastChanceNativeAdIndexTza = b17KqnListIndexVze;
      _b17QxmUploadNativeAdChanceVza();
    }
  }

  void b17PqnUpdateNativeAdVisibilityVze(
    int b17KqnIndexVze,
    bool b17QxmVisibleVza,
  ) {
    if (isClosed) return;
    final bool b17VqmChangedWza = b17QxmVisibleVza
        ? _b17VqmVisibleNativeAdIndexesWza.add(b17KqnIndexVze)
        : _b17VqmVisibleNativeAdIndexesWza.remove(b17KqnIndexVze);
    if (!b17VqmChangedWza) return;
    if (!b17QxmVisibleVza && b17PqmActiveNativeAdIndexXza == b17KqnIndexVze) {
      b17PqmActiveNativeAdIndexXza = null;
      if (_b17VqnLastChanceNativeAdIndexTza == b17KqnIndexVze) {
        _b17VqnLastChanceNativeAdIndexTza = null;
      }
      _b17QxnStopNativeAdRefreshTimerVza();
      update();
    }
    if (b17QxmVisibleVza &&
        b17QxnAppInForegroundVza &&
        !_b17PqnIsListScrollingVze &&
        !_b17VqmIsRefreshingNativeAdWza) {
      _b17QxmActivateNativeAdVza();
    }
  }

  void _b17KqmHandleScrollWze() {
    if (isClosed || !b17HqmCanShowNativeAdWza) return;
    _b17PqnIsListScrollingVze = true;
    _b17KqnScrollIdleTimerVze?.cancel();
    _b17QxnStopNativeAdRefreshTimerVza();
    _b17KqnScrollIdleTimerVze = Timer(_b17HqmScrollIdleDurationWza, () {
      if (isClosed || !b17HqmCanShowNativeAdWza) return;
      _b17PqnIsListScrollingVze = false;
      _b17QxmActivateNativeAdVza();
    });
  }

  void _b17QxmActivateNativeAdVza() {
    if (!b17QxnAppInForegroundVza || _b17VqmVisibleNativeAdIndexesWza.isEmpty) {
      _b17QxnStopNativeAdRefreshTimerVza();
      return;
    }
    final List<int> b17QxmVisibleIndexesVza =
        _b17VqmVisibleNativeAdIndexesWza
            .where(
              (b17VqnIndexTza) =>
                  b17VqnIndexTza < _b17KqmLatestListItemCountWze,
            )
            .toList()
          ..sort();
    if (b17QxmVisibleIndexesVza.isEmpty) return;
    final int b17VqmIndexWza = b17QxmVisibleIndexesVza.first;
    if (b17PqmActiveNativeAdIndexXza != b17VqmIndexWza) {
      b17PqmActiveNativeAdIndexXza = b17VqmIndexWza;
      update();
    }
    _b17VqnStartNativeAdRefreshTimerTza();
  }

  bool _b17KqnCanRefreshNativeAdVze() {
    final int? b17QxmActiveIndexVza = b17PqmActiveNativeAdIndexXza;
    return !isClosed &&
        b17QxnAppInForegroundVza &&
        !_b17VqmIsRefreshingNativeAdWza &&
        !_b17PqnIsListScrollingVze &&
        b17QxmActiveIndexVza != null &&
        _b17VqmVisibleNativeAdIndexesWza.contains(b17QxmActiveIndexVza) &&
        b17HqmCanShowNativeAdWza;
  }

  bool _b17RqmCanContinueNativeAdRefreshWza(int b17KqnIndexVze) =>
      !isClosed &&
      b17QxnAppInForegroundVza &&
      !_b17PqnIsListScrollingVze &&
      _b17VqmVisibleNativeAdIndexesWza.contains(b17KqnIndexVze) &&
      b17HqmCanShowNativeAdWza;

  void _b17VqnStartNativeAdRefreshTimerTza() {
    if (!_b17KqnCanRefreshNativeAdVze()) return;
    _b17HqmNativeAdRefreshTimerWza ??= Timer.periodic(
      _b17VqnNativeAdRefreshDurationTza,
      (_) => unawaited(_b17PqnRefreshActiveNativeAdVze()),
    );
  }

  void _b17QxnStopNativeAdRefreshTimerVza() {
    _b17HqmNativeAdRefreshTimerWza?.cancel();
    _b17HqmNativeAdRefreshTimerWza = null;
  }

  void _b17KqnClearActiveNativeAdVze() {
    _b17QxnStopNativeAdRefreshTimerVza();
    _b17VqnLastChanceNativeAdIndexTza = null;
    if (b17PqmActiveNativeAdIndexXza != null) {
      b17PqmActiveNativeAdIndexXza = null;
      update();
    }
  }

  Future<void> _b17PqnRefreshActiveNativeAdVze() async {
    if (!_b17KqnCanRefreshNativeAdVze()) return;
    final int b17KqnRefreshIndexVze = b17PqmActiveNativeAdIndexXza!;
    _b17VqmIsRefreshingNativeAdWza = true;
    _b17QxmUploadNativeAdChanceVza();
    try {
      b17PqmActiveNativeAdIndexXza = null;
      update();
      await WidgetsBinding.instance.endOfFrame;
      await Future<void>.delayed(Duration.zero);
      if (!_b17RqmCanContinueNativeAdRefreshWza(b17KqnRefreshIndexVze)) return;
      final B17JiwAdFuncDjo b17VqmAdHepWza =
          B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr;
      if (!await b17VqmAdHepWza.b17PqmHasFilesListNativeAdVzr()) {
        await b17VqmAdHepWza.b17PqmRequestFilesListNativeAdVzr();
      }
      if (!_b17RqmCanContinueNativeAdRefreshWza(b17KqnRefreshIndexVze)) return;
      b17QxnNativeAdRefreshKeyVza++;
      b17PqmActiveNativeAdIndexXza = b17KqnRefreshIndexVze;
      update();
    } finally {
      _b17VqmIsRefreshingNativeAdWza = false;
      if (b17QxnAppInForegroundVza &&
          !_b17PqnIsListScrollingVze &&
          b17HqmCanShowNativeAdWza &&
          b17PqmActiveNativeAdIndexXza == null) {
        _b17QxmActivateNativeAdVza();
      }
    }
  }

  void _b17QxmUploadNativeAdChanceVza() {
    if (!_b17QxnNativeAdSwitchEnabledVza) return;
    B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17KqnUploadAdChanceVxe(
      b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_ban1,
      b17KqmAdPosIdVzr: B17JkwPosidKos.pr_main_banner1,
    );
  }

  @override
  void onReady() {
    super.onReady();
    b17PqnLoadFilesVze();
  }

  Future<void> b17PqnLoadFilesVze({
    bool b17QxmShowLoadingVza = true,
    bool b17VqnForceReloadTza = false,
  }) async {
    if (b17VqnLoadingFilesTza ||
        (b17KqmHasLoadedFilesWze && !b17VqnForceReloadTza)) {
      refreshController.refreshCompleted();
      return;
    }
    final b17HqmPermissionWza = await _b17QxmStoragePermissionVza();
    if (!await b17HqmPermissionWza.isGranted) {
      await _b17VqnPrepareDemoFileTza();
      b17PqmListStateXza = B17QmvDocumentsListStateNza.noPermission;
      refreshController.refreshCompleted();
      update();
      return;
    }
    b17VqnLoadingFilesTza = true;
    if (b17QxmShowLoadingVza) {
      b17PqmListStateXza = B17QmvDocumentsListStateNza.loading;
      update();
    }
    try {
      b17KqnAllFilesVze = await FlutterPreviewFile.queryFileList(
        FileToolsDocumentType.values[type.index],
      );
      _b17HqmSortFilesWza();
      _b17VqmApplySearchXze();
      if (b17VqmVisibleFilesWza.isEmpty) {
        await _b17VqnPrepareDemoFileTza();
      }
      b17KqmHasLoadedFilesWze = true;
      b17PqmListStateXza = B17QmvDocumentsListStateNza.loaded;
    } finally {
      b17VqnLoadingFilesTza = false;
      refreshController.refreshCompleted();
      update();
    }
  }

  void b17VqmRefreshFilesWza() {
    b17PqnLoadFilesVze(b17QxmShowLoadingVza: false, b17VqnForceReloadTza: true);
  }

  void b17LozClickRequestPermissionOsz() {
    B17FjiSignalFuncEji.instance.b17JijSendMsgFEio(
      B17FhiSignalBeanFeo(
        b17HfeEventCodeFMie:
            B17QxmSignalCodeVza.b17RqmStoragePermissionRequestWza,
      ),
    );
  }

  void _b17HqmSortFilesWza() {
    b17KqnAllFilesVze.sort((b17QxmLeftVza, b17PqnRightVze) {
      switch (b17PqnSortTypeVza) {
        case B17JffSortTypeRiq.dateNew:
          return (b17PqnRightVze.updateTime ?? 0).compareTo(
            b17QxmLeftVza.updateTime ?? 0,
          );
        case B17JffSortTypeRiq.dateOld:
          return (b17QxmLeftVza.updateTime ?? 0).compareTo(
            b17PqnRightVze.updateTime ?? 0,
          );
        case B17JffSortTypeRiq.nameAZ:
          return (b17QxmLeftVza.name ?? '').toLowerCase().compareTo(
            (b17PqnRightVze.name ?? '').toLowerCase(),
          );
        case B17JffSortTypeRiq.nameZA:
          return (b17PqnRightVze.name ?? '').toLowerCase().compareTo(
            (b17QxmLeftVza.name ?? '').toLowerCase(),
          );
      }
    });
  }

  void _b17VqmApplySearchXze() {
    final b17PqmKeywordWza = b17HqmSearchTextXze.trim().toLowerCase();
    b17VqmVisibleFilesWza = b17PqmKeywordWza.isEmpty
        ? List<FileToolsFileInfo>.from(b17KqnAllFilesVze)
        : b17KqnAllFilesVze
              .where(
                (b17KqnFileVze) => (b17KqnFileVze.name ?? '')
                    .toLowerCase()
                    .contains(b17PqmKeywordWza),
              )
              .toList();
  }

  Future<void> _b17VqnPrepareDemoFileTza() async {
    b17QxnDemoFileInfoVza = await B17QxnDemoDocumentFuncVza.instance
        .b17KqnGetDemoPdfInfoVxe();
  }

  Future<void> b17OteClickSortNcs() async {
    final b17KqnPermissionTypeVze = await _b17QxmStoragePermissionVza();
    final b17PqmPermissionVza = await B17KqnAccessFuncVze.instance
        .requestPermission(b17QxmPermissionVza: b17KqnPermissionTypeVze);
    if (!b17PqmPermissionVza.b17HqmIsGrantedWza) return;
    final b17VqmSelectedXza =
        await B17FjeNavigationFuncIfj.b17VxqShowBottomSheetPrn<
          B17JffSortTypeRiq
        >(
          b17QnwChildXza: B17FjiSortBottomPopupEwf(
            b17HqmSelectedTypeWza: b17PqnSortTypeVza,
          ),
        );
    if (b17VqmSelectedXza == null) return;
    b17PqnSortTypeVza = b17VqmSelectedXza;
    await B17MqnDocumentSortCacheVza.b17PqmWriteSortNameXza(
      b17VqnTabNameTze: type.name,
      b17HqmSortNameWza: b17VqmSelectedXza.name,
    );
    _b17HqmSortFilesWza();
    _b17VqmApplySearchXze();
    update();
  }

  Future<void> b17DgpClickDeleteFileQky() async {
    final b17PqmPermissionTypeWza = await _b17QxmStoragePermissionVza();
    final b17VqmPermissionXza = await B17KqnAccessFuncVze.instance
        .requestPermission(b17QxmPermissionVza: b17PqmPermissionTypeWza);
    if (!b17VqmPermissionXza.b17HqmIsGrantedWza) return;
    B17FjeNavigationFuncIfj.b17HkqPushNamedVpa(
      b17McfRouteNameZsq: B17FjeNavigationAddressIfj.b17KqnDeleteFileRouteVze,
      b17XveArgumentsDlu: {'files': b17VqmVisibleFilesWza},
    );
  }

  void b17XxoClickFileItemDgu(FileToolsFileInfo b17QxmFileInfoVza) {
    final String? b17KqnRouteNameVze = switch (b17QxmFileInfoVza.type) {
      FileToolsDocumentType.pdf =>
        B17FjeNavigationAddressIfj.b17QxmPreviewPdfRouteVza,
      FileToolsDocumentType.word =>
        B17FjeNavigationAddressIfj.b17VqnPreviewWordRouteTza,
      FileToolsDocumentType.excel =>
        B17FjeNavigationAddressIfj.b17RqmPreviewExcelRouteWza,
      _ => null,
    };
    if (b17KqnRouteNameVze == null) return;
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.editor_entry,
    );
    B17FjeNavigationFuncIfj.b17HkqPushNamedVpa(
      b17McfRouteNameZsq: b17KqnRouteNameVze,
      b17XveArgumentsDlu: {'file': b17QxmFileInfoVza},
    );
  }

  @override
  bool b17FeiRegisterEventJif() => true;

  @override
  void b17RifHandleEventhJei(B17FhiSignalBeanFeo b17QzmEventXva) async {
    if (b17QzmEventXva.b17HfeEventCodeFMie ==
        B17QxmSignalCodeVza.b17KqmAppLifecycleWze) {
      b17QxnAppInForegroundVza = b17QzmEventXva.b17DjiIntValueJie != 1;
      if (b17QxnAppInForegroundVza) {
        _b17QxmActivateNativeAdVza();
      } else {
        _b17QxnStopNativeAdRefreshTimerVza();
      }
    } else if (b17QzmEventXva.b17HfeEventCodeFMie ==
        B17QxmSignalCodeVza.b17VqnFileSearchTza) {
      final b17KqnPermissionVze = await _b17QxmStoragePermissionVza();
      if (!await b17KqnPermissionVze.isGranted) return;
      b17HqmSearchTextXze = b17QzmEventXva.b17DjiStringValueJie ?? '';
      _b17VqmApplySearchXze();
      update();
    } else if (b17QzmEventXva.b17HfeEventCodeFMie ==
        B17QxmSignalCodeVza.b17HqmFileListRefreshWza) {
      b17PqnLoadFilesVze(b17VqnForceReloadTza: true);
    } else if (b17QzmEventXva.b17HfeEventCodeFMie ==
        B17QxmSignalCodeVza.b17TqnStoragePermissionGrantedVze) {
      b17PqnLoadFilesVze();
    } else if (b17QzmEventXva.b17HfeEventCodeFMie ==
        B17QxmSignalCodeVza.b17PqmRefreshBUserStateVzr) {
      update();
    }
  }

  @override
  void onClose() {
    _b17QxnStopNativeAdRefreshTimerVza();
    _b17KqnScrollIdleTimerVze?.cancel();
    _b17KqnScrollIdleTimerVze = null;
    b17PqnScrollControllerVze.removeListener(_b17KqmHandleScrollWze);
    b17PqnScrollControllerVze.dispose();
    refreshController.dispose();
    super.onClose();
  }
}
