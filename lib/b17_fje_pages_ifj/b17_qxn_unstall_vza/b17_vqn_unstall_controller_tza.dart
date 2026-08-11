import 'package:b17pdf/b17_fji_dialog_fji/b17_fow_update_dialog_jid/b17_fow_update_dialog_jid.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jfi_new_user_hep_ejf.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_address_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_hep_ifj.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_qmx_home_vza/b17_hqv_home_controller_wze.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_fje_root_controller_sak.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class B17VqnUnstallControllerTza extends B17FjeRootControllerSak {
  static const String b17QxnReasonBuilderIdVza =
      'b16_unstall_reason_builder_qxnvza';

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
    B17FjeRoutersHepIfj.b17CtmShowDialogXqe(
      b17WvpChildRka: const B17FowUpdateDialogJid(),
    );
  }

  void b17VqnClickReasonTza(int b17PqnIndexVze) {
    b17KqmSelectedReasonIndexWze = b17PqnIndexVze;
    update(<Object>[b17QxnReasonBuilderIdVza]);
  }

  void b17HqmClickNoUninstallWza() {
    if (Get.isRegistered<B17HqvHomeControllerWze>()) {
      B17FjeRoutersHepIfj.b17WvxPopUntilNameHqt(
        B17FjeRoutersAddressIfj.b17VqmHomeRouteXza,
      );
      B17FjeRoutersHepIfj.b17VqnShowExitAdIfNeededTza();
      return;
    }
    B17JfiNewUserHepEjf.instance.toPageChooseLanguage();
    B17FjeRoutersHepIfj.b17VqnShowExitAdIfNeededTza();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
