import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_fji_popup_fji/b17_jiw_comment_popup_jdi/b17_jiw_comment_popup_jdi.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_notice_func_wdo/b17_jso_notice_func_wko.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_address_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_jdw_metric_type_ijd.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_dji_analytics_func_wji.dart';
import 'package:b17pdf/b17_fje_screens_ifj/b17_qmx_dashboard_vza/b17_vqn_dashboard_section_tza/b17_cqm_dashboard_section_page_wze.dart';
import 'package:b17pdf/b17_fje_screens_ifj/b17_qmx_dashboard_vza/b17_tqm_utilities_section_vza/b17_vqk_utilities_section_page_rze.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_fje_base_controller_sak.dart';
import 'package:flutter/cupertino.dart';

enum B17XjoDashboardBottomTabTypeMyz {
  files(
    'Files',
    'b17_dfe_main_selected_icon_asset_ife',
    'b17_dhw_main_unselected_icon_asset_idi',
  ),
  tools(
    'Tools',
    'b17_djw_utility_selected_icon_asset_ijo',
    'b17_djw_utility_unselected_icon_asset_ijo',
  );

  const B17XjoDashboardBottomTabTypeMyz(
    this.b17KqmTextVza,
    this.b17HqmIconSelectedWze,
    this.b17VqnIconUnselectedXra,
  );

  final String b17KqmTextVza;
  final String b17HqmIconSelectedWze;
  final String b17VqnIconUnselectedXra;
}

class B17HqvDashboardControllerWze extends B17FjeBaseControllerSak {
  static const String b17PqmTabUpdateIdXve = 'b17_pqm_dashboard_tab_xve';

  int b17KqmTabIndexWza = 0;
  bool _b17QxnCanExitAfterCommentVza = false, _showOpenNotificationPage = true;

  final List<Widget> b17VqnPagesXre = const [
    B17CqmDashboardSectionPageWze(),
    B17VqkUtilitiesSectionPageRze(),
  ];

  @override
  void onInit() {
    super.onInit();
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.page_view,
      b17KqmParametersWze: {"page": "file"},
    );
    B17PqnNoticeFuncVze.instance.b17QxnInitializeNotificationsVza(
      b17KqmRequestPermissionWze: true,
    );
  }

  Future<bool> b17PqnHandleBackPressedVze() async {
    if (_b17QxnCanExitAfterCommentVza) {
      return true;
    }
    if (B17QxnUserCheckFuncVza.instance.b17VqnIsEligibleUserTza) {
      await B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
        b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_exit,
        b17KqmAdPosIdVzr: B17JkwPosidKos.pr_exit_app,
      );
    }
    final bool? b17VqmCanExitNextTimeWza =
        await B17FjeNavigationFuncIfj.b17VxqShowBottomSheetPrn<bool>(
          b17QnwChildXza: const B17WjdCommentPopupJiIwe(),
          b17MkrDismissibleVte: false,
        );
    if (b17VqmCanExitNextTimeWza == true) {
      _b17QxnCanExitAfterCommentVza = true;
    }
    return false;
  }

  void b17HqmSelectTabVze(
    B17XjoDashboardBottomTabTypeMyz b17VqnTabXra,
    BuildContext b17VqmcontextWza,
  ) {
    if (b17KqmTabIndexWza == b17VqnTabXra.index) {
      return;
    }
    if (b17KqmTabIndexWza == 0) {
      B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
        b17QxnPointTypeVza: B17JdwMetricTypeIjd.page_view,
        b17KqmParametersWze: {"page": "file"},
      );
    } else if (b17KqmTabIndexWza == 1) {
      B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
        b17QxnPointTypeVza: B17JdwMetricTypeIjd.page_view,
        b17KqmParametersWze: {"page": "tools"},
      );
    }
    b17KqmTabIndexWza = b17VqnTabXra.index;
    update([b17PqmTabUpdateIdXve]);
    B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
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
    var result = await B17PqnNoticeFuncVze.instance
        .b17JpbHasNotificationPermissionBed();
    if (result) {
      return;
    }
    B17FjeNavigationFuncIfj.b17HkqPushNamedVpa(
      b17McfRouteNameZsq: B17FjeNavigationAddressIfj.b17HqmNotificationRouteWza,
      b17XveArgumentsDlu: {"fromHome": true},
    );
    _showOpenNotificationPage = false;
  }
}
