import 'dart:io';

import 'package:b17pdf/b17_fji_dialog_fji/b17_jiw_comment_dialog_jdi/b17_jiw_comment_dialog_jdi.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jiw_ad_hep_djo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fje_local_info_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_address_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_hep_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_jdw_point_type_ijd.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_dji_tba_hep_wji.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_fje_root_controller_sak.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fhi_event_hep_ejo/b17_fhi_event_bean_feo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fhi_event_hep_ejo/b17_qxm_event_code_vza.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fhi_event_hep_ejo/b17_fji_event_hep_eji.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_qzm_permission_hep_xva/b17_kqn_permission_hep_vze.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fji_storage_hep_ejf/b17_fef_storage_hep_jei/b17_qxn_add_widget_storage_vza.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';
import 'package:permission_handler/permission_handler.dart';

enum B17PeeFileTabTyFie {
  all("All", "b17_ifj_all_tab_sel_icon_efe", "b17_fji_all_tab_uns_icon_foe"),
  pdf("PDF", "b17_wif_pdf_tab_sel_icon_jiw", "b17_wif_pdf_tab_sel_icon_jiw"),
  word(
    "Word",
    "b17_fhi_word_tab_sel_icon_fji",
    "b17_fhi_word_tab_sel_icon_fji",
  ),
  excel(
    "Excel",
    "b17_fji_excel_tab_sel_icon_wji",
    "b17_fji_excel_tab_sel_icon_wji",
  );

  final String name;
  final String iconSel;
  final String iconUns;
  const B17PeeFileTabTyFie(this.name, this.iconSel, this.iconUns);
}

class B17RkpHomeChildControllerXwe extends B17FjeRootControllerSak {
  TextEditingController textEditingController = TextEditingController();
  PageController pageController = PageController();
  int b17QmvSelectedTabIndexNza = 0;
  bool b17QxnShowAddWidgetVza = !B17QxnAddWidgetStorageVza.b17KqmReadAddedWze();
  bool b17VqnRequestingStoragePermissionTza = false;

  @override
  void onReady() {
    super.onReady();
    b17HqmRequestStoragePermissionWza();
  }

  clickTabItem(B17PeeFileTabTyFie type) {
    B17DjiTbaHepWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwPointTypeIjd.file_filter_click,
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
    B17JiwAdHepDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
      b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_user_use,
      b17KqmAdPosIdVzr: B17JkwPosidKos.pr_up_int,
      b17VmqAdHostContextXtr: b17HqmContextWza,
    );
  }

  void b17PqmSearchFilesXza(String b17VqnKeywordTze) =>
      B17FjiEventHepEji.instance.b17JijSendMsgFEio(
        B17FhiEventBeanFeo(
          b17HfeEventCodeFMie: B17QxmEventCodeVza.b17VqnFileSearchTza,
          b17DjiStringValueJie: b17VqnKeywordTze,
        ),
      );

  @override
  bool b17FeiRegisterEventJif() => true;

  @override
  void b17RifHandleEventhJei(B17FhiEventBeanFeo b17QzmEventXva) {
    if (b17QzmEventXva.b17HfeEventCodeFMie ==
        B17QxmEventCodeVza.b17PqnWidgetAddedVze) {
      b17QxnShowAddWidgetVza = false;
      update();
    } else if (b17QzmEventXva.b17HfeEventCodeFMie ==
        B17QxmEventCodeVza.b17RqmStoragePermissionRequestWza) {
      b17HqmRequestStoragePermissionWza();
    }
  }

  Future<void> b17HqmRequestStoragePermissionWza() async {
    if (b17VqnRequestingStoragePermissionTza) return;
    b17VqnRequestingStoragePermissionTza = true;
    try {
      final Permission b17QxnPermissionVza =
          await _b17KqmStoragePermissionWze();
      final B17VqmPermissionResultXze b17VqnResultTza =
          await B17KqnPermissionHepVze.instance.requestPermission(
            b17QxmPermissionVza: b17QxnPermissionVza,
          );
      if (b17VqnResultTza.b17PqnIsShowPermissionAdVxe) {
        B17DjiTbaHepWji.instance.b17KqnUploadPointVxe(
          b17QxnPointTypeVza: B17JdwPointTypeIjd.storage_auth_click,
        );
        if (B17QxnUserCheckHepVza.instance.b17VqnIsEligibleUserTza) {
          B17JiwAdHepDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
            b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_launch,
            b17KqmAdPosIdVzr: B17JkwPosidKos.pr_permission_open,
          );
        }
      }
      if (!b17VqnResultTza.b17HqmIsGrantedWza) return;
      B17FjiEventHepEji.instance.b17JijSendMsgFEio(
        B17FhiEventBeanFeo(
          b17HfeEventCodeFMie:
              B17QxmEventCodeVza.b17TqnStoragePermissionGrantedVze,
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
    // B17FjeRoutersHepIfj.b17VxqShowBottomSheetPrn(b17QnwChildXza: B17WjdCommentDialogJiIwe());
    B17DjiTbaHepWji.instance.b17QgrAddLifeTimePjg();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
