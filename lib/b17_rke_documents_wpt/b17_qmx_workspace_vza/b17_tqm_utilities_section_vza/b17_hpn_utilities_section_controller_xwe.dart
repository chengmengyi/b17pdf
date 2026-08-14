import 'package:b17pdf/b17_ydu_interface_mqp/b17_wfm_popups_tke/b17_fje_change_locale_bottom_popup_ifo/b17_fje_change_locale_bottom_popup_ifo.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_fje_base_controller_sak.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fje_localization_ifj/b17_fie_locale_utilities_ife.dart';
import 'package:get/get.dart';

class B17HpnUtilitiesSectionControllerXwe extends B17FjeBaseControllerSak {
  String get b17QxmCurrentLanguageNameVza {
    final b17KqnLocaleVze = B17FieLocaleUtilitiesIfe.b17KqmMatchLocaleWza(
      Get.locale ?? B17FieLocaleUtilitiesIfe.b17HqnInitialLocaleVze(),
    );
    return B17FieLocaleUtilitiesIfe.b17RqmLanguageListWza
        .firstWhere(
          (b17VqnItemTza) => B17FieLocaleUtilitiesIfe.b17VqnIsSameLocaleTza(
            b17VqnItemTza.b17VqnLocaleTza,
            b17KqnLocaleVze,
          ),
        )
        .b17KqnNameVze;
  }

  Future<void> b17JwoClickChangeLanguageIat() async {
    await B17FjeNavigationFuncIfj.b17VxqShowBottomSheetPrn(
      b17QnwChildXza: B17FjeChangeLocaleBottomPopupIfo(),
    );
    update();
  }
}
