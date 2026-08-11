import 'dart:io';

import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jiw_ad_hep_djo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_hwi_ad_hep_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_dji_routers_hep_ejf/b17_fje_routers_hep_ifj.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_jdw_point_type_ijd.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_jwj_tba_hep_owd/b17_dji_tba_hep_wji.dart';
import 'package:b17pdf/b17_fji_root_eld/b17_fje_root_controller_sak.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class B17MqpPreviewExcelControllerTza extends B17FjeRootControllerSak {
  late final ExcelFileController b17KqnExcelControllerVze;
  FileToolsFileInfo b17XqnFileInfoVze =
      Get.arguments['file'] as FileToolsFileInfo;
  bool b17VqnCanLoadViewerTza = false;
  String get b17HqmFileNameWza {
    if ((b17XqnFileInfoVze.name ?? '').isNotEmpty) {
      return b17XqnFileInfoVze.name!;
    }
    return (b17XqnFileInfoVze.path ?? '').split(Platform.pathSeparator).last;
  }

  bool get b17QxmIsEditingVza => b17KqnExcelControllerVze.isEditing;
  bool get b17RqmIsSavingWza => b17KqnExcelControllerVze.saving;
  @override
  void onInit() {
    super.onInit();
    b17KqnExcelControllerVze = ExcelFileController(
      filePath: b17XqnFileInfoVze.path ?? '',
    );
    b17KqnExcelControllerVze.addListener(_b17VqmViewerChangedXza);
  }

  @override
  void onReady() {
    super.onReady();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future<void>.delayed(const Duration(milliseconds: 160));
      b17VqnCanLoadViewerTza = true;
      update();
      await b17KqnExcelControllerVze.initialize();
    });
  }

  void _b17VqmViewerChangedXza() => update();
  Future<void> b17AckClickEditEif() async {
    if (b17RqmIsSavingWza) return;
    b17QxmIsEditingVza
        ? await b17KqnExcelControllerVze.cancelEditing()
        : await b17KqnExcelControllerVze.enterEditMode();
  }

  Future<void> b17IedClickSaveJkt() async {
    if (!b17QxmIsEditingVza || b17RqmIsSavingWza) return;
    try {
      B17DjiTbaHepWji.instance.b17KqnUploadPointVxe(
        b17QxnPointTypeVza: B17JdwPointTypeIjd.editor_save_click,
      );
      await b17KqnExcelControllerVze.save();
      final b17KqnPathVze = b17XqnFileInfoVze.path ?? '';
      final b17VqmStatXza = await File(b17KqnPathVze).stat();
      b17XqnFileInfoVze = b17XqnFileInfoVze.copyWith(
        size: b17VqmStatXza.size,
        updateTime: b17VqmStatXza.modified.millisecondsSinceEpoch,
      );
      Fluttertoast.showToast(msg: 'Saved successfully'.tr);
    } catch (b17QxmErrorVza) {
      Fluttertoast.showToast(msg: '$b17QxmErrorVza');
    }
  }

  void b17UjfClickBackBzn() {
    B17FjeRoutersHepIfj.b17FtyBackNwp();
    if (B17QxnUserCheckHepVza.instance.b17VqnIsEligibleUserTza) {
      B17JiwAdHepDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
        b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_exit,
        b17KqmAdPosIdVzr: B17JkwPosidKos.pr_readback,
      );
    }
  }

  @override
  void onClose() {
    b17KqnExcelControllerVze.removeListener(_b17VqmViewerChangedXza);
    b17KqnExcelControllerVze.dispose();
    super.onClose();
  }
}
