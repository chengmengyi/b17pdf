import 'package:b17pdf/b17_fji_popup_fji/b17_jwi_insert_widget_bottom_popup_oko/b17_jwi_insert_widget_bottom_popup_oko.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fhi_signal_func_ejo/b17_fhi_signal_bean_feo.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fhi_signal_func_ejo/b17_qxm_signal_code_vza.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fhi_signal_func_ejo/b17_fji_signal_func_eji.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fji_cache_func_ejf/b17_fef_cache_func_jei/b17_qxn_insert_widget_cache_vza.dart';
import 'package:flutter_add_widget_plugins/flutter_add_widget_plugins.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

enum B17AdwInsertWidgetTypeTpe {
  home("Home", "b17_fji_widget_main_icon_asset_eio"),
  merge("Merge", "b17_fke_widget_merge_icon_asset_ofk"),
  import("Import", "b17_zeg_widget_import_icon_asset_tow"),
  convert("Convert", "b17_dwi_widget_convert_icon_asset_dji");

  final String text;
  final String icon;
  const B17AdwInsertWidgetTypeTpe(this.text, this.icon);
}

class B17KqmInsertWidgetFuncVze {
  B17KqmInsertWidgetFuncVze._();

  static final B17KqmInsertWidgetFuncVze instance =
      B17KqmInsertWidgetFuncVze._();

  final List<WidgetInfo> _widgetInfoList = <WidgetInfo>[];

  Future<void> b17EerShowAddWidgetDialogLxc() async {
    var result = await B17FjeNavigationFuncIfj.b17VxqShowBottomSheetPrn<bool>(
      b17QnwChildXza: const B17JwiInsertWidgetBottomPopupOko(),
    );
    if (result == true) {
      await _b17MddAddWidgetNrj();
    }
  }

  Future<void> _b17MddAddWidgetNrj() async {
    _b17CvtInitWidgetInfoArz();
    await FlutterAddWidgetPlugins.instance.addWidget(
      items: _widgetInfoList,
      layoutName: "b17_ivq_insert_widget_layout_xfa",
    );
    await B17QxnInsertWidgetCacheVza.b17VqnSaveAddedTza(true);
    B17FjiSignalFuncEji.instance.b17JijSendMsgFEio(
      B17FhiSignalBeanFeo(
        b17HfeEventCodeFMie: B17QxmSignalCodeVza.b17PqnWidgetAddedVze,
      ),
    );
  }

  void _b17CvtInitWidgetInfoArz() {
    _widgetInfoList.clear();
    for (var value in B17AdwInsertWidgetTypeTpe.values) {
      _widgetInfoList.add(
        WidgetInfo(icon: value.icon, name: value.text.tr, type: value.name),
      );
    }
  }
}
