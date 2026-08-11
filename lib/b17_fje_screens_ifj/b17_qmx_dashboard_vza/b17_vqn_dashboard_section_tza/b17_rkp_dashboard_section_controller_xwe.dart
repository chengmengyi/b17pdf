import 'dart:io';

import 'package:b17pdf/b17_fji_popup_fji/b17_jiw_comment_popup_jdi/b17_jiw_comment_popup_jdi.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fje_device_info_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_address_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_jdw_metric_type_ijd.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_dji_analytics_func_wji.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_fje_base_controller_sak.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fhi_signal_func_ejo/b17_fhi_signal_bean_feo.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fhi_signal_func_ejo/b17_qxm_signal_code_vza.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fhi_signal_func_ejo/b17_fji_signal_func_eji.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_qzm_access_func_xva/b17_kqn_access_func_vze.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fef_cache_func_jei/b17_qxn_insert_widget_cache_vza.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';
import 'package:permission_handler/permission_handler.dart';

enum B17PeeDocumentTabTyFie {
  all("All", "b17_ifj_all_documents_tab_selected_icon_asset_efe", "b17_fji_all_documents_tab_unselected_icon_asset_foe"),
  pdf("PDF", "b17_wif_pdf_tab_selected_icon_asset_jiw", "b17_wif_pdf_tab_selected_icon_asset_jiw"),
  word(
    "Word",
    "b17_fhi_word_tab_selected_icon_asset_fji",
    "b17_fhi_word_tab_selected_icon_asset_fji",
  ),
  excel(
    "Excel",
    "b17_fji_excel_tab_selected_icon_asset_wji",
    "b17_fji_excel_tab_selected_icon_asset_wji",
  );

  final String name;
  final String iconSel;
  final String iconUns;
  const B17PeeDocumentTabTyFie(this.name, this.iconSel, this.iconUns);
}

class B17RkpDashboardSectionControllerXwe extends B17FjeBaseControllerSak {
  TextEditingController textEditingController = TextEditingController();
  PageController pageController = PageController();
  int b17QmvSelectedTabIndexNza = 0;
  bool b17QxnShowAddWidgetVza =
      !B17QxnInsertWidgetCacheVza.b17KqmReadAddedWze();
  bool b17VqnRequestingStoragePermissionTza = false;

  @override
  void onReady() {
    super.onReady();
    b17HqmRequestStoragePermissionWza();
  }

  clickTabItem(B17PeeDocumentTabTyFie type) {
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.file_filter_click,
    );
    pageController.animateToPage(
      type.index,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  void b17HqmPageChangedWza(int b17KqnIndexVze, BuildContext b17HqmContextWza) {
    b17QmvSelectedTabIndexNza = b17KqnIndexVze;
    update();
    B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
      b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_user_use,
      b17KqmAdPosIdVzr: B17JkwPosidKos.pr_up_int,
      b17VmqAdHostContextXtr: b17HqmContextWza,
    );
  }

  void b17PqmSearchFilesXza(String b17VqnKeywordTze) =>
      B17FjiSignalFuncEji.instance.b17JijSendMsgFEio(
        B17FhiSignalBeanFeo(
          b17HfeEventCodeFMie: B17QxmSignalCodeVza.b17VqnFileSearchTza,
          b17DjiStringValueJie: b17VqnKeywordTze,
        ),
      );

  @override
  bool b17FeiRegisterEventJif() => true;

  @override
  void b17RifHandleEventhJei(B17FhiSignalBeanFeo b17QzmEventXva) {
    if (b17QzmEventXva.b17HfeEventCodeFMie ==
        B17QxmSignalCodeVza.b17PqnWidgetAddedVze) {
      b17QxnShowAddWidgetVza = false;
      update();
    } else if (b17QzmEventXva.b17HfeEventCodeFMie ==
        B17QxmSignalCodeVza.b17RqmStoragePermissionRequestWza) {
      b17HqmRequestStoragePermissionWza();
    }
  }

  Future<void> b17HqmRequestStoragePermissionWza() async {
    if (b17VqnRequestingStoragePermissionTza) return;
    b17VqnRequestingStoragePermissionTza = true;
    try {
      final Permission b17QxnPermissionVza =
          await _b17KqmStoragePermissionWze();
      final B17VqmAccessOutputXze b17VqnResultTza = await B17KqnAccessFuncVze
          .instance
          .requestPermission(b17QxmPermissionVza: b17QxnPermissionVza);
      if (b17VqnResultTza.b17PqnIsShowPermissionAdVxe) {
        B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
          b17QxnPointTypeVza: B17JdwMetricTypeIjd.storage_auth_click,
        );
        if (B17QxnUserCheckFuncVza.instance.b17VqnIsEligibleUserTza) {
          B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
            b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_launch,
            b17KqmAdPosIdVzr: B17JkwPosidKos.pr_permission_open,
          );
        }
      }
      if (!b17VqnResultTza.b17HqmIsGrantedWza) return;
      B17FjiSignalFuncEji.instance.b17JijSendMsgFEio(
        B17FhiSignalBeanFeo(
          b17HfeEventCodeFMie:
              B17QxmSignalCodeVza.b17TqnStoragePermissionGrantedVze,
        ),
      );
    } finally {
      b17VqnRequestingStoragePermissionTza = false;
    }
  }

  Future<Permission> _b17KqmStoragePermissionWze() async {
    if (!Platform.isAndroid) return Permission.storage;
    final b17QxnAndroidInfoVza = await DeviceInfoPlugin().androidInfo;
    return b17QxnAndroidInfoVza.version.sdkInt >= 30
        ? Permission.manageExternalStorage
        : Permission.storage;
  }

  void test() async {
    if (!kDebugMode) {
      return;
    }
    // B17FjeNavigationFuncIfj.b17VxqShowBottomSheetPrn(b17QnwChildXza: B17WjdCommentPopupJiIwe());
    B17DjiAnalyticsFuncWji.instance.b17QgrAddLifeTimePjg();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
