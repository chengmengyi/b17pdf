import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_jdw_metric_type_ijd.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_dji_analytics_func_wji.dart';
import 'package:b17pdf/b17_ydu_interface_mqp/b17_nrx_foundation_pke/b17_fje_base_controller_sak.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_dji_navigation_ejf/b17_fje_navigation_func_ifj.dart';

enum B17JffSortTypeRiq {
  dateNew(
    "Date(Newest First)",
    "b17_ihd_sort_newdate_icon_asset_kog",
    "b17_ihd_sort_newdate_icon_asset_kog_sel",
  ),
  dateOld(
    "Date(Oldest First)",
    "b17_wwb_sort_olddate_icon_asset_pce",
    "b17_wwb_sort_olddate_icon_asset_pce_sel",
  ),
  nameAZ(
    "Name(A-Z)",
    "b17_zqk_sort_az_icon_asset_zfw",
    "b17_zqk_sort_az_icon_asset_zfw_sel",
  ),
  nameZA(
    "Name(Z-A)",
    "b17_gsu_sort_za_icon_asset_cui",
    "b17_gsu_sort_za_icon_asset_cui_sel",
  );

  final String b17HqmTextWza;
  final String b17KqnIconVxe;
  final String b17KqnIconVxeSel;
  const B17JffSortTypeRiq(
    this.b17HqmTextWza,
    this.b17KqnIconVxe,
    this.b17KqnIconVxeSel,
  );
}

class B17FjiSortBottomPopupControllerEwf extends B17FjeBaseControllerSak {
  final B17JffSortTypeRiq b17VqmSelectedTypeXza;
  B17FjiSortBottomPopupControllerEwf({required this.b17VqmSelectedTypeXza});

  void b17OteClickSortNcs(B17JffSortTypeRiq b17PqnTypeVze) {
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.file_sort_change,
      b17KqmParametersWze: {"sort_type": b17PqnTypeVze.name},
    );
    B17FjeNavigationFuncIfj.b17FtyBackNwp<B17JffSortTypeRiq>(
      b17NcgResultKqe: b17PqnTypeVze,
    );
  }
}
