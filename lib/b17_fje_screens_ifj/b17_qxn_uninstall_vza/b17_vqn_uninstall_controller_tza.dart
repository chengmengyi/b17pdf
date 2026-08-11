import 'package:b17pdf/b17_fji_popup_fji/b17_fow_update_popup_jid/b17_fow_update_popup_jid.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jfi_first_user_func_ejf.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_address_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_fje_screens_ifj/b17_qmx_dashboard_vza/b17_hqv_dashboard_controller_wze.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_fje_base_controller_sak.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class B17VqnUninstallControllerTza extends B17FjeBaseControllerSak {
  static const String b17QxnReasonBuilderIdVza =
      'b17_qxn_uninstall_reason_builder_vza';

  TextEditingController textEditingController = TextEditingController();
  int b17KqmSelectedReasonIndexWze = -1;
  final List<String> reasonList = <String>[
    'Hard to use',
    'Frequent ad interference',
    'Poor PDF reading experience',
    'Too many notifications',
    "Editing features don't meet needs",
    'Phone has built-in PDF tools',
    'Other (Please specify)',
  ];

  void b17OzhClickUninstallMzk() {
    B17FjeNavigationFuncIfj.b17CtmShowDialogXqe(
      b17WvpChildRka: const B17FowUpdatePopupJid(),
    );
  }

  void b17VqnClickReasonTza(int b17PqnIndexVze) {
    b17KqmSelectedReasonIndexWze = b17PqnIndexVze;
    update(<Object>[b17QxnReasonBuilderIdVza]);
  }

  void b17HqmClickNoUninstallWza() {
    if (Get.isRegistered<B17HqvDashboardControllerWze>()) {
      B17FjeNavigationFuncIfj.b17WvxPopUntilNameHqt(
        B17FjeNavigationAddressIfj.b17VqmHomeRouteXza,
      );
      B17FjeNavigationFuncIfj.b17VqnShowExitAdIfNeededTza();
      return;
    }
    B17JfiFirstUserFuncEjf.instance.toPageChooseLanguage();
    B17FjeNavigationFuncIfj.b17VqnShowExitAdIfNeededTza();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
