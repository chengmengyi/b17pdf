import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jiw_ad_hep_djo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_fji_dialog_fji/b17_jiw_comment_dialog_jdi/b17_jiw_comment_dialog_jdi.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_notification_hep_wdo/b17_jso_notification_hep_wko.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_address_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_hep_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_jdw_point_type_ijd.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_dji_tba_hep_wji.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_qmx_home_vza/b17_vqn_home_child_tza/b17_cqm_home_child_page_wze.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_qmx_home_vza/b17_tqm_tools_child_vza/b17_vqk_tools_child_page_rze.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_fje_root_controller_sak.dart';
import 'package:flutter/cupertino.dart';

enum B17XjoHomeBottomTabTypeMyz {
  files('Files', 'b17_dfe_home_sel_icon_ife', 'b17_dhw_home_uns_icon_idi'),
  tools('Tools', 'b17_djw_tool_sel_icon_ijo', 'b17_djw_tool_uns_icon_ijo');

  const B17XjoHomeBottomTabTypeMyz(
    this.b17KqmTextVza,
    this.b17HqmIconSelectedWze,
    this.b17VqnIconUnselectedXra,
  );

  final String b17KqmTextVza;
  final String b17HqmIconSelectedWze;
  final String b17VqnIconUnselectedXra;
}

class B17HqvHomeControllerWze extends B17FjeRootControllerSak {
  static const String b17PqmTabUpdateIdXve = 'b16_home_tab';

  int b17KqmTabIndexWza = 0;
  bool _b17QxnCanExitAfterCommentVza = false, _showOpenNotificationPage = true;

  final List<Widget> b17VqnPagesXre = const [
    B17CqmHomeChildPageWze(),
    B17VqkToolsChildPageRze(),
  ];

  @override
  void onInit() {
    super.onInit();
    B17DjiTbaHepWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwPointTypeIjd.page_view,
      b17KqmParametersWze: {"page": "file"},
    );
    B17PqnNotificationHepVze.instance.b17QxnInitializeNotificationsVza(
      b17KqmRequestPermissionWze: true,
    );
  }

  Future<bool> b17PqnHandleBackPressedVze() async {
    if (_b17QxnCanExitAfterCommentVza) {
      return true;
    }
    if (B17QxnUserCheckHepVza.instance.b17VqnIsEligibleUserTza) {
      await B17JiwAdHepDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
        b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_exit,
        b17KqmAdPosIdVzr: B17JkwPosidKos.pr_exit_app,
      );
    }
    final bool? b17VqmCanExitNextTimeWza =
        await B17FjeRoutersHepIfj.b17VxqShowBottomSheetPrn<bool>(
          b17QnwChildXza: const B17WjdCommentDialogJiIwe(),
          b17MkrDismissibleVte: false,
        );
    if (b17VqmCanExitNextTimeWza == true) {
      _b17QxnCanExitAfterCommentVza = true;
    }
    return false;
  }

  void b17HqmSelectTabVze(
    B17XjoHomeBottomTabTypeMyz b17VqnTabXra,
    BuildContext b17VqmcontextWza,
  ) {
    if (b17KqmTabIndexWza == b17VqnTabXra.index) {
      return;
    }
    if (b17KqmTabIndexWza == 0) {
      B17DjiTbaHepWji.instance.b17KqnUploadPointVxe(
        b17QxnPointTypeVza: B17JdwPointTypeIjd.page_view,
        b17KqmParametersWze: {"page": "file"},
      );
    } else if (b17KqmTabIndexWza == 1) {
      B17DjiTbaHepWji.instance.b17KqnUploadPointVxe(
        b17QxnPointTypeVza: B17JdwPointTypeIjd.page_view,
        b17KqmParametersWze: {"page": "tools"},
      );
    }
    b17KqmTabIndexWza = b17VqnTabXra.index;
    update([b17PqmTabUpdateIdXve]);
    B17JiwAdHepDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
      b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_user_use,
      b17KqmAdPosIdVzr: B17JkwPosidKos.pr_down_int,
      b17VmqAdHostContextXtr: b17VqmcontextWza,
    );
    _checkShowNotificationPage();
  }

  _checkShowNotificationPage() async {
    if (!_showOpenNotificationPage) {
      return;
    }
    var result = await B17PqnNotificationHepVze.instance
        .b17JpbHasNotificationPermissionBed();
    if (result) {
      return;
    }
    B17FjeRoutersHepIfj.b17HkqPushNamedVpa(
      b17McfRouteNameZsq: B17FjeRoutersAddressIfj.b17HqmNotificationRouteWza,
      b17XveArgumentsDlu: {"fromHome": true},
    );
    _showOpenNotificationPage = false;
  }
}
