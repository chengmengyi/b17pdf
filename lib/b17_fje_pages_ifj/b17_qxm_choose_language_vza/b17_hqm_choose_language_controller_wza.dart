import 'package:b17pdf/b17_dji_hep_jdo/b17_fje_language_hep_ifj/b17_kqm_language_hep_vza.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fje_language_hep_ifj/b17_fie_language_tools_ife.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jfi_new_user_hep_ejf.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_jdw_point_type_ijd.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_dji_tba_hep_wji.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_fje_root_controller_sak.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B17HqmChooseLanguageControllerWza extends B17FjeRootControllerSak {
  final ScrollController b17QxmLanguageScrollControllerVza = ScrollController();
  late B17QxmLanguageItemVza b17KqnSelectedLanguageVze;
  bool _b17VqnHasScrolledTza = false;

  List<B17QxmLanguageItemVza> get b17PqmLanguageListWza =>
      B17FieLanguageToolsIfe.b17RqmLanguageListWza;

  @override
  void onInit() {
    super.onInit();
    B17DjiTbaHepWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwPointTypeIjd.lang_select_view,
    );
    final b17HqmInitialLocaleWza =
        B17FieLanguageToolsIfe.b17HqnInitialLocaleVze();
    b17KqnSelectedLanguageVze = b17PqmLanguageListWza.firstWhere(
      (b17QxmItemVza) => B17FieLanguageToolsIfe.b17VqnIsSameLocaleTza(
        b17QxmItemVza.b17VqnLocaleTza,
        b17HqmInitialLocaleWza,
      ),
      orElse: () => b17PqmLanguageListWza.first,
    );
  }

  @override
  void onReady() {
    super.onReady();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => b17VqnScrollSelectedLanguageTza(),
    );
  }

  bool b17PqmIsSelectedXza(B17QxmLanguageItemVza b17KqnItemVze) =>
      B17FieLanguageToolsIfe.b17VqnIsSameLocaleTza(
        b17KqnSelectedLanguageVze.b17VqnLocaleTza,
        b17KqnItemVze.b17VqnLocaleTza,
      );

  void b17HqmClickLanguageWza(B17QxmLanguageItemVza b17QxmItemVza) {
    b17KqnSelectedLanguageVze = b17QxmItemVza;
    update();
  }

  void b17VqnScrollSelectedLanguageTza() {
    if (_b17VqnHasScrolledTza ||
        !b17QxmLanguageScrollControllerVza.hasClients) {
      return;
    }
    final b17KqnIndexVze = b17PqmLanguageListWza.indexWhere(
      b17PqmIsSelectedXza,
    );
    _b17VqnHasScrolledTza = true;
    if (b17KqnIndexVze <= 0) return;
    final b17QxmTargetOffsetVza = b17KqnIndexVze * 56.h;
    b17QxmLanguageScrollControllerVza.animateTo(
      b17QxmTargetOffsetVza.clamp(
        0.0,
        b17QxmLanguageScrollControllerVza.position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> b17PooClickOkUto() async {
    B17DjiTbaHepWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwPointTypeIjd.lang_select_click,
    );
    await B17KqmLanguageHepVza.b17GqmSelectLanguageWxe(
      b17KqnSelectedLanguageVze.b17VqnLocaleTza,
    );
    B17JfiNewUserHepEjf.instance.toPageOpenNotificationPermission();
  }

  @override
  void onClose() {
    b17QxmLanguageScrollControllerVza.dispose();
    super.onClose();
  }
}
