import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_jdw_metric_type_ijd.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_dji_analytics_func_wji.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_fje_base_controller_sak.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class B17JiwCommentPopupControllerJdi extends B17FjeBaseControllerSak {
  static const String b17KqnStarBuilderIdVze =
      'b17_kqn_comment_rating_builder_vze';

  int b17PqnStarCountVze = 0;
  bool _b17QxmClosingDialogVza = false;

  @override
  void onInit() {
    super.onInit();
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.rating_pop_v,
    );
  }

  void b17VqmClickStarWza(int b17HqmIndexWza) {
    b17PqnStarCountVze = b17HqmIndexWza + 1;
    update(<Object>[b17KqnStarBuilderIdVze]);
  }

  Future<void> b17KqnClickRateUsVze() async {
    b17PqnStarCountVze = 5;
    update(<Object>[b17KqnStarBuilderIdVze]);
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.rating_pop_c,
    );
    await _b17PqmOpenGooglePlayXza();
  }

  Future<void> b17VqnClickCloseTza() async {
    if (_b17QxmClosingDialogVza) {
      return;
    }
    _b17QxmClosingDialogVza = true;
    if (Get.isBottomSheetOpen == true) {
      B17FjeNavigationFuncIfj.b17FtyBackNwp<bool>(b17NcgResultKqe: false);
    }
  }

  Future<void> _b17PqmOpenGooglePlayXza() async {
    final String b17QxnPackageNameVza = await FlutterTbaInfo.instance
        .getBundleId();
    final Uri b17KqmMarketUriWze = Uri.parse(
      'market://details?id=$b17QxnPackageNameVza',
    );
    final Uri b17VqnWebUriTza = Uri.https(
      'play.google.com',
      '/store/apps/details',
      <String, String>{'id': b17QxnPackageNameVza},
    );
    if (await canLaunchUrl(b17KqmMarketUriWze)) {
      await launchUrl(b17KqmMarketUriWze, mode: LaunchMode.externalApplication);
    } else {
      await launchUrl(b17VqnWebUriTza, mode: LaunchMode.externalApplication);
    }
    if (Get.isBottomSheetOpen == true) {
      B17FjeNavigationFuncIfj.b17FtyBackNwp<bool>(b17NcgResultKqe: true);
    }
  }
}
