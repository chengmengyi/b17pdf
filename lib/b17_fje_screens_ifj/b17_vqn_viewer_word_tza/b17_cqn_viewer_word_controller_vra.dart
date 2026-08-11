import 'dart:io';

import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_jiw_ad_func_djo.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_ynx_ad_scene_ige.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_hwi_ad_func_jiw/b17_jkw_posid_kos.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_dji_navigation_func_ejf/b17_fje_navigation_func_ifj.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_jdw_metric_type_ijd.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_jwj_analytics_func_owd/b17_dji_analytics_func_wji.dart';
import 'package:b17pdf/b17_fji_base_eld/b17_fje_base_controller_sak.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class B17CqnViewerWordControllerVra extends B17FjeBaseControllerSak {
  late final WordFileController b17KqnWordControllerVze;
  FileToolsFileInfo b17PqmFileInfoXze =
      Get.arguments['file'] as FileToolsFileInfo;
  bool b17VqnCanLoadViewerTza = false;

  String get b17HqmFileNameWza {
    if ((b17PqmFileInfoXze.name ?? '').isNotEmpty) {
      return b17PqmFileInfoXze.name!;
    }
    return (b17PqmFileInfoXze.path ?? '').split(Platform.pathSeparator).last;
  }

  bool get b17QxmIsEditingVza => b17KqnWordControllerVze.isEditing;
  bool get b17RqmIsSavingWza => b17KqnWordControllerVze.saving;

  @override
  void onInit() {
    super.onInit();
    b17KqnWordControllerVze = WordFileController(
      filePath: b17PqmFileInfoXze.path ?? '',
    );
    b17KqnWordControllerVze.addListener(_b17VqmViewerChangedXza);
  }

  @override
  void onReady() {
    super.onReady();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future<void>.delayed(const Duration(milliseconds: 160));
      b17VqnCanLoadViewerTza = true;
      update();
      await b17KqnWordControllerVze.initialize();
    });
  }

  void _b17VqmViewerChangedXza() => update();
  Future<void> b17AckClickEditEif() async {
    if (b17RqmIsSavingWza) return;
    b17QxmIsEditingVza
        ? await b17KqnWordControllerVze.cancelEditing()
        : await b17KqnWordControllerVze.enterEditMode();
  }

  Future<void> b17IedClickSaveJkt() async {
    if (!b17QxmIsEditingVza || b17RqmIsSavingWza) return;
    try {
      B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
        b17QxnPointTypeVza: B17JdwMetricTypeIjd.editor_save_click,
      );
      await b17KqnWordControllerVze.save();
      final b17KqnPathVze = b17PqmFileInfoXze.path ?? '';
      final b17VqmStatXza = await File(b17KqnPathVze).stat();
      b17PqmFileInfoXze = b17PqmFileInfoXze.copyWith(
        size: b17VqmStatXza.size,
        updateTime: b17VqmStatXza.modified.millisecondsSinceEpoch,
      );
      Fluttertoast.showToast(msg: 'Saved successfully'.tr);
    } catch (b17QxmErrorVza) {
      Fluttertoast.showToast(msg: '$b17QxmErrorVza');
    }
  }

  void b17UjfClickBackBzn() {
    B17FjeNavigationFuncIfj.b17FtyBackNwp();
    if (B17QxnUserCheckFuncVza.instance.b17VqnIsEligibleUserTza) {
      B17JiwAdFuncDjo.b17KqmAdUtilsInstanceVzr.b17PqmShowCachedSceneAdVzr(
        b17PqmAdSceneVzr: B17EipAdSceneUkg.pr_exit,
        b17KqmAdPosIdVzr: B17JkwPosidKos.pr_readback,
      );
    }
  }

  @override
  void onClose() {
    b17KqnWordControllerVze.removeListener(_b17VqmViewerChangedXza);
    b17KqnWordControllerVze.dispose();
    super.onClose();
  }
}
