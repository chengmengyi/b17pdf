import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_dji_analytics_func_wji.dart';
import 'package:b17pdf/b17_gve_telemetry_rkx/b17_jwj_analytics_owd/b17_jdw_metric_type_ijd.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_fje_device_info_ifj.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_rtx_runtime_wqa/b17_jiw_check_user_ojd.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_fji_persistence_ejf/b17_fef_cache_func_jei/b17_float_oho_cache_vze.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class B17QxnOverlayFuncVza {
  B17QxnOverlayFuncVza._();

  static final B17QxnOverlayFuncVza instance = B17QxnOverlayFuncVza._();

  uploadPermissionState()async{
    var result = await FlutterLocalNotificationPlugins.instance.checkOverlayPermission();
    B17DjiAnalyticsFuncWji.instance.b17KqnUploadPointVxe(
      b17QxnPointTypeVza: B17JdwMetricTypeIjd.float,
      b17KqmParametersWze: {"state":result?"on":"off"},
    );
  }

  Future<void> b17QxnInitializeOverlayVza() async {
    if (!B17QxnUserCheckFuncVza.instance.b17VqnIsEligibleUserTza) {
      return;
    }
    await FlutterLocalNotificationPlugins.instance.setTimerOverlayInfo(
      layoutName: 'b17_time_overlay_layout_one_djiw',
      lastPdfSubtitleTemplate: "You were on page {n}. Let's finish it!".tr,
      lastPdfButtonText: 'Open'.tr,
      continueReadingStr: 'Continue Reading'.tr,
      contentList: _b17QxnBuildPrimaryContentVza(),
      layoutName2: 'b17_time_overlay_layout_two_fheihd',
      contentList2: _b17KqmBuildSecondaryContentWze(),
      contentList3: _b17VqnBuildShortcutContentTza(),
      reflectionConfig: _b17HqmBuildReflectionConfigWza(),
      closeOverlayProbability: B17FloatOhoCacheVze.b17KqmReadTimeWze(),
    );
  }

  Future<void> b17KqmCloseTimerOverlayWze() {
    return FlutterLocalNotificationPlugins.instance.closeTimerOverlay();
  }

  TimerOverlayReflectionConfig _b17HqmBuildReflectionConfigWza() {
    return const TimerOverlayReflectionConfig(
      secret: B17FjeDeviceInfoIfj.b17KqmSecretKeyWze,
      settingsClass:
          'v1:zoqKtzv6+9Z1ihDX:uXatP19xe84jvbZrdv0LIgMSgGxlG07R3uii4a2P3CzyFemlj2NMKZQ=',
      canDrawOverlaysMethod:
          'v1:NuK5cYYURVXztrLe:Tyz4vbGdKE8WmnR8sFgh/eR/w3p3/oTSCch3GDQyyA==',
      contextGetSystemServiceMethod:
          'v1:IYGX55UIGdRagMoV:0GZ3QhYA6XMNBC9RvySiTOzHxzGqILC7BxVgV4PV4v8=',
      windowServiceName: 'v1:c/0I7O+FXB4BDT4s:46ddkHnclEmrcDIl9H55xHsIrLRrnA==',
      windowManagerLayoutParamsClass:
          'v1:XIOHYtayFwsdBQ4r:edrKHzYjGmZ4H/96jBe7UB8IjKuHKItobDntdsk4VP2VAFZ9Fal0UH8JKtvnzB9SWOo6F7HIcA==',
      viewGroupLayoutParamsClass:
          'v1:6CwLF8UzwW4XZKU4:kzbD7TStvaLDBxHDsuarQUnRpZ9QwUxVN8dN7f1ci1fQtDW0Wn4fK56c5WQjMWePpA7P',
      windowManagerClass:
          'v1:Ue9HvtE/Zlcky6mv:QYtQMT+rL8B+35APNt/0OW1GMT/IjjbnztD78iA6RU+g5JY5roE5Cq11',
      addViewMethod: 'v1:6zRjdie5v6gANPXZ:wj99jtT08KB/+d3VhSKJkbnrhlGTvE4=',
      removeViewMethod:
          'v1:9XKSZ7qMmEf6L0OS:yVJwOqsfX8x1Qx2NVswbTtL+m/Fsb2NYQuQ=',
      gravityField: 'v1:qX9ntp/qRRH5aEuO:ZSop8DD0eHjg0f/ysKYcxhZ5UZ/X78E=',
      xField: 'v1:QHf8UeGb2uvWl6fF:lk6AfOfvmUZ9HNlW5p+JxBA=',
      yField: 'v1:4eE5f00IgL0l1J8t:bckVjA8FAT1P+NpKyr5W4u4=',
    );
  }

  List<TimerOverlayContent>
  _b17QxnBuildPrimaryContentVza() => <TimerOverlayContent>[
    TimerOverlayContent(
      title: 'Still working on your file...'.tr,
      subtitle:
          'Your PDF is almost ready in the background. Tap to jump back and save it, or let me finish the heavy lifting for you.'
              .tr,
      button: 'Check'.tr,
    ),
    TimerOverlayContent(
      title: 'Still reading?'.tr,
      subtitle:
          "You left off on page 12. Don't lose your spot-tap to get back to your file instantly!"
              .tr,
      button: 'Check'.tr,
    ),
  ];

  List<TimerOverlayContent>
  _b17KqmBuildSecondaryContentWze() => <TimerOverlayContent>[
    TimerOverlayContent(
      title: 'Pending Documents'.tr,
      subtitle: 'You have documents waiting for your attention.'.tr,
      button: 'View Now'.tr,
      button2: 'Later'.tr,
    ),
    TimerOverlayContent(
      title: 'Files Awaiting You'.tr,
      subtitle:
          'There are some files ready for your review. Shall we take a look?'
              .tr,
      button: 'Open Files'.tr,
      button2: 'Later'.tr,
    ),
    TimerOverlayContent(
      title: 'New Documents'.tr,
      subtitle: 'You have pending files to handle.'.tr,
      button: 'Review'.tr,
    ),
  ];

  List<TimerOverlayContent> _b17VqnBuildShortcutContentTza() =>
      <TimerOverlayContent>[
        TimerOverlayContent(
          title: 'Home'.tr,
          subtitle: 'b17_hhv_func_vgc',
          button: '',
        ),
        TimerOverlayContent(
          title: 'Merge'.tr,
          subtitle: 'b17_aua_func_pxg',
          button: '',
        ),
        TimerOverlayContent(
          title: 'Import'.tr,
          subtitle: 'b17_qmz_func_word_rbf',
          button: '',
        ),
        TimerOverlayContent(
          title: 'Convert'.tr,
          subtitle: 'b17_nia_func_pdf_tmr',
          button: '',
        ),
      ];
}
