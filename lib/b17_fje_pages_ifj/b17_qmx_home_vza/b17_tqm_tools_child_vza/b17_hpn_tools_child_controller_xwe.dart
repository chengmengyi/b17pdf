import 'package:b17pdf/b17_fji_dialog_fji/b17_fje_change_language_bottom_dialog_ifo/b17_fje_change_language_bottom_dialog_ifo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_hep_ifj.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_fje_root_controller_sak.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fje_language_hep_ifj/b17_fie_language_tools_ife.dart';
import 'package:get/get.dart';

class B17HpnToolsChildControllerXwe extends B17FjeRootControllerSak {
  String get b17QxmCurrentLanguageNameVza {
    final b17KqnLocaleVze = B17FieLanguageToolsIfe.b17KqmMatchLocaleWza(
      Get.locale ?? B17FieLanguageToolsIfe.b17HqnInitialLocaleVze(),
    );
    return B17FieLanguageToolsIfe.b17RqmLanguageListWza
        .firstWhere(
          (b17VqnItemTza) => B17FieLanguageToolsIfe.b17VqnIsSameLocaleTza(
            b17VqnItemTza.b17VqnLocaleTza,
            b17KqnLocaleVze,
          ),
        )
        .b17KqnNameVze;
  }

  Future<void> b17JwoClickChangeLanguageIat() async {
    await B17FjeRoutersHepIfj.b17VxqShowBottomSheetPrn(
      b17QnwChildXza: B17FjeChangeLanguageBottomDialogIfo(),
    );
    update();
  }
}
