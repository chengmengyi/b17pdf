import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_jdw_point_type_ijd.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_dji_tba_hep_wji.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_fje_root_controller_sak.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_hep_ifj.dart';

enum B17JffSortTypeRiq {
  dateNew("Date(Newest First)", "b17_ihd_sort_newdate_icon_kog"),
  dateOld("Date(Oldest First)", "b17_wwb_sort_olddate_icon_pce"),
  nameAZ("Name(A-Z)", "b17_zqk_sort_az_icon_zfw"),
  nameZA("Name(Z-A)", "b17_gsu_sort_za_icon_cui");

  final String b17HqmTextWza;
  final String b17KqnIconVxe;
  const B17JffSortTypeRiq(this.b17HqmTextWza, this.b17KqnIconVxe);
}

class B17FjiSortBottomDialogControllerEwf extends B17FjeRootControllerSak {
  final B17JffSortTypeRiq b17VqmSelectedTypeXza;
  B17FjiSortBottomDialogControllerEwf({required this.b17VqmSelectedTypeXza});

  void b17OteClickSortNcs(B17JffSortTypeRiq b17PqnTypeVze) {
    B17DjiTbaHepWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwPointTypeIjd.file_sort_change,
      b17KqmParametersWze: {"sort_type": b17PqnTypeVze.name},
    );
    B17FjeRoutersHepIfj.b17FtyBackNwp<B17JffSortTypeRiq>(
      b17NcgResultKqe: b17PqnTypeVze,
    );
  }
}
