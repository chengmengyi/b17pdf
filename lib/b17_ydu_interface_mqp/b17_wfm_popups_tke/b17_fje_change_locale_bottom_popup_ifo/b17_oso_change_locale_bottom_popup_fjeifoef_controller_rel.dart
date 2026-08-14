import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fje_localization_ifj/b17_kqm_locale_func_vza.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fje_localization_ifj/b17_fie_locale_utilities_ife.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_fji_locale_selected_efj.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_fje_base_controller_sak.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B17FjeChangeLocaleBottomPopupControllerIfo
    extends B17FjeBaseControllerSak {
  final ScrollController b17QxmLanguageScrollControllerVza = ScrollController();
  late B17QxmLocaleItemVza b17KqnSelectedLanguageVze;
  bool _b17VqnHasScrolledTza = false;

  List<B17QxmLocaleItemVza> get b17PqmLanguageListWza =>
      B17FieLocaleUtilitiesIfe.b17RqmLanguageListWza;

  @override
  void onInit() {
    super.onInit();
    final b17HqmStoredLanguageWza =
        B17FjiLocaleSelectedEfj.b17VqmReadLanguageXpe();
    final b17QxmInitialLocaleVza = b17HqmStoredLanguageWza.isEmpty
        ? B17FieLocaleUtilitiesIfe.b17HqnInitialLocaleVze()
        : B17FieLocaleUtilitiesIfe.b17KqmMatchLocaleWza(
            _b17VqnParseLocaleTza(b17HqmStoredLanguageWza),
          );
    b17KqnSelectedLanguageVze = b17PqmLanguageListWza.firstWhere(
      (b17KqnItemVze) => B17FieLocaleUtilitiesIfe.b17VqnIsSameLocaleTza(
        b17KqnItemVze.b17VqnLocaleTza,
        b17QxmInitialLocaleVza,
      ),
      orElse: () => b17PqmLanguageListWza.first,
    );
  }

  @override
  void onReady() {
    super.onReady();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => b17HqmScrollSelectedLanguageWza(),
    );
  }

  bool b17VqnIsSelectedTza(B17QxmLocaleItemVza b17KqnItemVze) =>
      B17FieLocaleUtilitiesIfe.b17VqnIsSameLocaleTza(
        b17KqnSelectedLanguageVze.b17VqnLocaleTza,
        b17KqnItemVze.b17VqnLocaleTza,
      );

  void b17HqmScrollSelectedLanguageWza() {
    if (_b17VqnHasScrolledTza ||
        !b17QxmLanguageScrollControllerVza.hasClients) {
      return;
    }
    _b17VqnHasScrolledTza = true;
    final b17QxmIndexVza = b17PqmLanguageListWza.indexWhere(
      b17VqnIsSelectedTza,
    );
    if (b17QxmIndexVza <= 0) return;
    b17QxmLanguageScrollControllerVza.animateTo(
      (b17QxmIndexVza * 56.h).clamp(
        0.0,
        b17QxmLanguageScrollControllerVza.position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> b17PqmClickLanguageWza(B17QxmLocaleItemVza b17QxmItemVza) async {
    b17KqnSelectedLanguageVze = b17QxmItemVza;
    update();
    await B17KqmLocaleFuncVza.b17GqmSelectLanguageWxe(
      b17QxmItemVza.b17VqnLocaleTza,
    );
    B17FjeNavigationFuncIfj.b17FtyBackNwp();
  }

  Locale _b17VqnParseLocaleTza(String b17QxmTagVza) {
    final b17KqnPartsVze = b17QxmTagVza.replaceAll('_', '-').split('-');
    return Locale(
      b17KqnPartsVze.first.toLowerCase(),
      b17KqnPartsVze.length > 1 ? b17KqnPartsVze[1].toUpperCase() : null,
    );
  }

  @override
  void onClose() {
    b17QxmLanguageScrollControllerVza.dispose();
    super.onClose();
  }
}
