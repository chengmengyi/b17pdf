import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jiw_ad_hep_djo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_hep_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_jdw_point_type_ijd.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_dji_tba_hep_wji.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_fje_root_controller_sak.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class B17JiwCommentDialogControllerJdi extends B17FjeRootControllerSak {
  static const String b17KqnStarBuilderIdVze =
      'b16_comment_star_builder_kqnvze';

  int b17PqnStarCountVze = 0;
  bool _b17QxmClosingDialogVza = false;

  @override
  void onInit() {
    super.onInit();
    B17DjiTbaHepWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwPointTypeIjd.rating_pop_v,
    );
  }

  void b17VqmClickStarWza(int b17HqmIndexWza) {
    b17PqnStarCountVze = b17HqmIndexWza + 1;
    update(<Object>[b17KqnStarBuilderIdVze]);
  }

  Future<void> b17KqnClickRateUsVze() async {
    b17PqnStarCountVze = 5;
    update(<Object>[b17KqnStarBuilderIdVze]);
    B17DjiTbaHepWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwPointTypeIjd.rating_pop_c,
    );
    await _b17PqmOpenGooglePlayXza();
  }

  Future<void> b17VqnClickCloseTza() async {
    if (_b17QxmClosingDialogVza) {
      return;
    }
    _b17QxmClosingDialogVza = true;
    if (Get.isBottomSheetOpen == true) {
      B17FjeRoutersHepIfj.b17FtyBackNwp<bool>(b17NcgResultKqe: false);
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
      B17FjeRoutersHepIfj.b17FtyBackNwp<bool>(b17NcgResultKqe: true);
    }
  }
}
