import 'package:b17pdf/b17_fje_pages_ifj/b17_qmx_home_vza/b17_rqm_delete_file_vza/b17_kqn_delete_file_page_vxe.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_qxm_choose_language_vza/b17_kqn_choose_language_page_vze.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_qmx_home_vza/b17_kpn_home_page_yra.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_qxn_images_result_vza/b17_vqn_images_result_page_tza.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_feo_launcher_fke/b17_fje_launcher_page_iji.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_rqm_open_notification_page_vza/b17_kqm_open_notification_page_xve.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_kxm_open_overlay_permission_page_qva/b17_zqt_open_overlay_permission_page_wne.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_qxm_preview_pdf_vza/b17_kqn_preview_pdf_page_vze.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_vqn_preview_word_tza/b17_pqm_preview_word_page_xze.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_rqm_preview_excel_wza/b17_xqn_preview_excel_page_vze.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_vqn_process_result_tza/b17_kqn_process_result_page_vze.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_hqm_process_waiting_wza/b17_rqm_process_waiting_page_xze.dart';
import 'package:b17pdf/b17_fje_pages_ifj/b17_qxn_unstall_vza/b17_kqm_unstall_page_wze.dart';
import 'package:get/get.dart';

abstract final class B17FjeRoutersAddressIfj {
  static const String b17KfmLauncherRouteOqa = '/b16_launcher';
  static const String b17NqvOverlayPermissionRouteWza =
      '/b16_open_overlay_permission';
  static const String b17HqmNotificationRouteWza = '/b16_open_notification';
  static const String b17VqmHomeRouteXza = '/b16_home';
  static const String b17KqnDeleteFileRouteVze = '/b16_delete_file';
  static const String b17HqmChooseLanguageRouteWza = '/b16_choose_language';
  static const String b17QxmPreviewPdfRouteVza = '/b16_preview_pdf';
  static const String b17VqnPreviewWordRouteTza = '/b16_preview_word';
  static const String b17RqmPreviewExcelRouteWza = '/b16_preview_excel';
  static const String b17KqmUnstallRouteWze = '/b16_unstall';
  static const String b17VqnImagesResultRouteTza = '/b16_images_result';
  static const String b17HqmProcessWaitingRouteWza = '/b16_process_waiting';
  static const String b17PqnProcessResultRouteVze = '/b16_process_result';

  static final List<GetPage<dynamic>> b17RxqPagesTma = [
    GetPage(name: b17KfmLauncherRouteOqa, page: B17FjeLauncherPageIji.new),
    GetPage(
      name: b17NqvOverlayPermissionRouteWza,
      page: B17ZqtOpenOverlayPermissionPageWne.new,
    ),
    GetPage(
      name: b17HqmNotificationRouteWza,
      page: B17KqmOpenNotificationPageXve.new,
    ),
    GetPage(name: b17VqmHomeRouteXza, page: B17KpnHomePageYra.new),
    GetPage(name: b17KqnDeleteFileRouteVze, page: B17KqnDeleteFilePageVxe.new),
    GetPage(
      name: b17HqmChooseLanguageRouteWza,
      page: B17KqnChooseLanguagePageVze.new,
    ),
    GetPage(name: b17QxmPreviewPdfRouteVza, page: B17KqnPreviewPdfPageVze.new),
    GetPage(
      name: b17VqnPreviewWordRouteTza,
      page: B17PqmPreviewWordPageXze.new,
    ),
    GetPage(
      name: b17RqmPreviewExcelRouteWza,
      page: B17XqnPreviewExcelPageVze.new,
    ),
    GetPage(name: b17KqmUnstallRouteWze, page: B17KqmUnstallPageWze.new),
    GetPage(
      name: b17VqnImagesResultRouteTza,
      page: B17VqnImagesResultPageTza.new,
    ),
    GetPage(
      name: b17HqmProcessWaitingRouteWza,
      page: B17RqmProcessWaitingPageXze.new,
    ),
    GetPage(
      name: b17PqnProcessResultRouteVze,
      page: B17KqnProcessResultPageVze.new,
    ),
  ];
}
