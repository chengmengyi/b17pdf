import 'dart:ui';

import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fef_cache_func_jei/b17_fji_locale_selected_efj.dart';

class B17QxmLocaleItemVza {
  const B17QxmLocaleItemVza({
    required this.b17KqnNameVze,
    required this.b17HqmIconWza,
    required this.b17VqnLocaleTza,
  });

  final String b17KqnNameVze;
  final String b17HqmIconWza;
  final Locale b17VqnLocaleTza;
}

abstract final class B17FieLocaleUtilitiesIfe {
  static const Locale b17PqmFallbackLocaleXze = Locale('en');

  static const List<B17QxmLocaleItemVza> b17RqmLanguageListWza = [
    B17QxmLocaleItemVza(
      b17KqnNameVze: 'English',
      b17HqmIconWza: 'b17_qxm_english_flag_asset_vza',
      b17VqnLocaleTza: Locale('en'),
    ),
    B17QxmLocaleItemVza(
      b17KqnNameVze: 'Français',
      b17HqmIconWza: 'b17_kqn_french_flag_asset_vze',
      b17VqnLocaleTza: Locale('fr'),
    ),
    B17QxmLocaleItemVza(
      b17KqnNameVze: '日本語',
      b17HqmIconWza: 'b17_hqm_japanese_flag_asset_wza',
      b17VqnLocaleTza: Locale('ja'),
    ),
    B17QxmLocaleItemVza(
      b17KqnNameVze: '한국어',
      b17HqmIconWza: 'b17_vqn_korean_flag_asset_tza',
      b17VqnLocaleTza: Locale('ko'),
    ),
    B17QxmLocaleItemVza(
      b17KqnNameVze: 'Deutsch',
      b17HqmIconWza: 'b17_pqm_german_flag_asset_xze',
      b17VqnLocaleTza: Locale('de'),
    ),
    B17QxmLocaleItemVza(
      b17KqnNameVze: 'Español',
      b17HqmIconWza: 'b17_cqn_spanish_flag_asset_vra',
      b17VqnLocaleTza: Locale('es'),
    ),
    B17QxmLocaleItemVza(
      b17KqnNameVze: 'Italiano',
      b17HqmIconWza: 'b17_rqm_italian_flag_asset_wza',
      b17VqnLocaleTza: Locale('it'),
    ),
    B17QxmLocaleItemVza(
      b17KqnNameVze: 'Português',
      b17HqmIconWza: 'b17_xqn_portuguese_flag_asset_vze',
      b17VqnLocaleTza: Locale('pt'),
    ),
    B17QxmLocaleItemVza(
      b17KqnNameVze: 'Русский',
      b17HqmIconWza: 'b17_zqm_russian_flag_asset_wva',
      b17VqnLocaleTza: Locale('ru'),
    ),
    B17QxmLocaleItemVza(
      b17KqnNameVze: '繁體中文',
      b17HqmIconWza: 'b17_mqp_traditional_flag_asset_tza',
      b17VqnLocaleTza: Locale('zh', 'TW'),
    ),
    B17QxmLocaleItemVza(
      b17KqnNameVze: '简体中文',
      b17HqmIconWza: 'b17_tqn_simplified_flag_asset_vza',
      b17VqnLocaleTza: Locale('zh', 'CN'),
    ),
    B17QxmLocaleItemVza(
      b17KqnNameVze: 'العربية',
      b17HqmIconWza: 'b17_wqm_arabic_flag_asset_xza',
      b17VqnLocaleTza: Locale('ar'),
    ),
  ];

  static Locale b17HqnInitialLocaleVze() {
    final b17QxmSavedTagVza = B17FjiLocaleSelectedEfj.b17VqmReadLanguageXpe();
    if (b17QxmSavedTagVza.isNotEmpty) {
      return b17KqmMatchLocaleWza(_b17VqnParseLocaleTza(b17QxmSavedTagVza));
    }
    return b17KqmMatchLocaleWza(PlatformDispatcher.instance.locale);
  }

  static Locale b17KqmMatchLocaleWza(Locale b17QxmLocaleVza) {
    for (final b17KqnItemVze in b17RqmLanguageListWza) {
      if (b17VqnIsSameLocaleTza(
        b17KqnItemVze.b17VqnLocaleTza,
        b17QxmLocaleVza,
      )) {
        return b17KqnItemVze.b17VqnLocaleTza;
      }
    }
    if (b17QxmLocaleVza.languageCode == 'zh') {
      final b17HqmUseTraditionalWza =
          const {'TW', 'HK', 'MO'}.contains(b17QxmLocaleVza.countryCode) ||
          b17QxmLocaleVza.scriptCode == 'Hant';
      return Locale('zh', b17HqmUseTraditionalWza ? 'TW' : 'CN');
    }
    for (final b17HqmItemWza in b17RqmLanguageListWza) {
      if (b17HqmItemWza.b17VqnLocaleTza.languageCode ==
          b17QxmLocaleVza.languageCode) {
        return b17HqmItemWza.b17VqnLocaleTza;
      }
    }
    return b17PqmFallbackLocaleXze;
  }

  static bool b17VqnIsSameLocaleTza(
    Locale? b17QxmLeftVza,
    Locale b17KqnRightVze,
  ) =>
      b17QxmLeftVza?.languageCode == b17KqnRightVze.languageCode &&
      b17QxmLeftVza?.countryCode == b17KqnRightVze.countryCode;

  static String b17PqmLocaleTagWza(Locale b17QxmLocaleVza) =>
      b17QxmLocaleVza.toLanguageTag();

  static Locale _b17VqnParseLocaleTza(String b17QxmTagVza) {
    final b17KqnPartsVze = b17QxmTagVza.replaceAll('_', '-').split('-');
    return Locale(
      b17KqnPartsVze.first.toLowerCase(),
      b17KqnPartsVze.length > 1 ? b17KqnPartsVze[1].toUpperCase() : null,
    );
  }
}
