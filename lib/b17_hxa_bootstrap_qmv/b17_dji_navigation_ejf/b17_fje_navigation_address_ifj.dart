import 'package:b17pdf/b17_rke_documents_wpt/b17_qmx_workspace_vza/b17_rqm_remove_document_vza/b17_kqn_remove_document_page_vxe.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_qxm_select_locale_vza/b17_kqn_select_locale_page_vze.dart';
import 'package:b17pdf/b17_rke_documents_wpt/b17_qmx_workspace_vza/b17_kpn_dashboard_page_yra.dart';
import 'package:b17pdf/b17_ncu_conversion_fsz/b17_ejw_workflow_oeo/b17_qxn_pictures_output_vza/b17_vqn_pictures_output_page_tza.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_kfm_startup_oqa/b17_fje_startup_page_iji.dart';
import 'package:b17pdf/b17_mye_messaging_kra/b17_rqm_notice_access_vza/b17_kqm_open_notice_page_xve.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_kxm_overlay_access_qva/b17_zqt_open_overlay_access_page_wne.dart';
import 'package:b17pdf/b17_rke_documents_wpt/b17_gpf_viewers_tpd/b17_qxm_viewer_pdf_vza/b17_kqn_viewer_pdf_page_vze.dart';
import 'package:b17pdf/b17_rke_documents_wpt/b17_gpf_viewers_tpd/b17_vqn_viewer_word_tza/b17_pqm_viewer_word_page_xze.dart';
import 'package:b17pdf/b17_rke_documents_wpt/b17_gpf_viewers_tpd/b17_rqm_viewer_excel_wza/b17_xqn_viewer_excel_page_vze.dart';
import 'package:b17pdf/b17_ncu_conversion_fsz/b17_ejw_workflow_oeo/b17_vqn_task_output_tza/b17_kqn_task_output_page_vze.dart';
import 'package:b17pdf/b17_ncu_conversion_fsz/b17_ejw_workflow_oeo/b17_hqm_task_progress_wza/b17_rqm_task_progress_page_xze.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_qxn_uninstall_vza/b17_kqm_uninstall_page_wze.dart';
import 'package:b17pdf/b17_hxa_bootstrap_qmv/b17_kfm_startup_oqa/b17_rqm_open_ad_loading_page_xza.dart';
import 'package:b17pdf/b17_pwo_preferences_cjn/b17_pqn_guide_vze/b17_kqn_guide_page_vze.dart';
import 'package:get/get.dart';

abstract final class B17FjeNavigationAddressIfj {
  static const String b17KfmLauncherRouteOqa = '/b17_kfm_startup_oqa';
  static const String b17NqvOverlayPermissionRouteWza =
      '/b17_nqv_open_overlay_access_wza';
  static const String b17HqmNotificationRouteWza = '/b17_hqm_open_notice_wza';
  static const String b17VqmHomeRouteXza = '/b17_vqm_dashboard_xza';
  static const String b17KqnDeleteFileRouteVze = '/b17_kqn_remove_document_vze';
  static const String b17HqmChooseLanguageRouteWza =
      '/b17_hqm_select_locale_wza';
  static const String b17QxnGuideRouteVza = '/b17_qxn_guide_vza';
  static const String b17QxmPreviewPdfRouteVza = '/b17_qxm_viewer_pdf_vza';
  static const String b17VqnPreviewWordRouteTza = '/b17_vqn_viewer_word_tza';
  static const String b17RqmPreviewExcelRouteWza = '/b17_rqm_viewer_excel_wza';
  static const String b17KqmUnstallRouteWze = '/b17_kqm_uninstall_wze';
  static const String b17VqnImagesResultRouteTza =
      '/b17_vqn_pictures_output_tza';
  static const String b17HqmProcessWaitingRouteWza =
      '/b17_hqm_task_progress_wza';
  static const String b17PqnProcessResultRouteVze = '/b17_pqn_task_output_vze';
  static const String b17RqmOpenAdLoadingRouteXza =
      '/b17_rqm_open_ad_loading_xza';

  static final List<GetPage<dynamic>> b17RxqPagesTma = [
    GetPage(name: b17KfmLauncherRouteOqa, page: B17FjeStartupPageIji.new),
    GetPage(
      name: b17NqvOverlayPermissionRouteWza,
      page: B17ZqtOpenOverlayAccessPageWne.new,
    ),
    GetPage(
      name: b17HqmNotificationRouteWza,
      page: B17KqmOpenNoticePageXve.new,
    ),
    GetPage(name: b17VqmHomeRouteXza, page: B17KpnDashboardPageYra.new),
    GetPage(
      name: b17KqnDeleteFileRouteVze,
      page: B17KqnRemoveDocumentPageVxe.new,
    ),
    GetPage(
      name: b17HqmChooseLanguageRouteWza,
      page: B17KqnSelectLocalePageVze.new,
    ),
    GetPage(name: b17QxnGuideRouteVza, page: B17KqnGuidePageVze.new),
    GetPage(name: b17QxmPreviewPdfRouteVza, page: B17KqnViewerPdfPageVze.new),
    GetPage(name: b17VqnPreviewWordRouteTza, page: B17PqmViewerWordPageXze.new),
    GetPage(
      name: b17RqmPreviewExcelRouteWza,
      page: B17XqnViewerExcelPageVze.new,
    ),
    GetPage(name: b17KqmUnstallRouteWze, page: B17KqmUninstallPageWze.new),
    GetPage(
      name: b17VqnImagesResultRouteTza,
      page: B17VqnPicturesOutputPageTza.new,
    ),
    GetPage(
      name: b17HqmProcessWaitingRouteWza,
      page: B17RqmTaskProgressPageXze.new,
    ),
    GetPage(
      name: b17PqnProcessResultRouteVze,
      page: B17KqnTaskOutputPageVze.new,
    ),
    GetPage(
      name: b17RqmOpenAdLoadingRouteXza,
      page: B17RqmOpenAdLoadingPageXza.new,
    ),
  ];
}
