import 'package:b17pdf/b17_fji_dialog_fji/b17_jwi_add_widget_bottom_dialog_oko/b17_jwi_add_widget_bottom_dialog_oko.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fhi_event_hep_ejo/b17_fhi_event_bean_feo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fhi_event_hep_ejo/b17_qxm_event_code_vza.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fhi_event_hep_ejo/b17_fji_event_hep_eji.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_hep_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fji_storage_hep_ejf/b17_fef_storage_hep_jei/b17_qxn_add_widget_storage_vza.dart';
import 'package:flutter_add_widget_plugins/flutter_add_widget_plugins.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

enum B17AdwAddWidgetTypeTpe {
  home("Home", "b17_fji_widget_home_icon_eio"),
  merge("Merge", "b17_fke_widget_merge_icon_ofk"),
  import("Import", "b17_zeg_widget_import_icon_tow"),
  convert("Convert", "b17_dwi_widget_convert_icon_dji");

  final String text;
  final String icon;
  const B17AdwAddWidgetTypeTpe(this.text, this.icon);
}

class B17KqmAddWidgetHepVze {
  B17KqmAddWidgetHepVze._();

  static final B17KqmAddWidgetHepVze instance = B17KqmAddWidgetHepVze._();

  final List<WidgetInfo> _widgetInfoList = <WidgetInfo>[];

  Future<void> b17EerShowAddWidgetDialogLxc() async {
    var result = await B17FjeRoutersHepIfj.b17VxqShowBottomSheetPrn<bool>(
      b17QnwChildXza: const B17JwiAddWidgetBottomDialogOko(),
    );
    if (result == true) {
      await _b17MddAddWidgetNrj();
    }
  }

  Future<void> _b17MddAddWidgetNrj() async {
    _b17CvtInitWidgetInfoArz();
    await FlutterAddWidgetPlugins.instance.addWidget(
      items: _widgetInfoList,
      layoutName: "b17_ivq_add_widget_layout_xfa",
    );
    await B17QxnAddWidgetStorageVza.b17VqnSaveAddedTza(true);
    B17FjiEventHepEji.instance.b17JijSendMsgFEio(
      B17FhiEventBeanFeo(
        b17HfeEventCodeFMie: B17QxmEventCodeVza.b17PqnWidgetAddedVze,
      ),
    );
  }

  void _b17CvtInitWidgetInfoArz() {
    _widgetInfoList.clear();
    for (var value in B17AdwAddWidgetTypeTpe.values) {
      _widgetInfoList.add(
        WidgetInfo(icon: value.icon, name: value.text.tr, type: value.name),
      );
    }
  }
}
