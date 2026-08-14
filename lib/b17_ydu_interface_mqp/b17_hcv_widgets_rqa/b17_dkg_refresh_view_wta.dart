import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

enum B17KqvRefreshOutcomeZma {
  b17HqmSucceededWza,
  b17VxtFailedQke,
  b17CjrNoMoreDataPyn,
}

void b17HnqRequestRefreshWze(RefreshController b17PxtControllerMva) {
  if (b17PxtControllerMva.isRefresh) {
    return;
  }
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!b17PxtControllerMva.isRefresh &&
        b17PxtControllerMva.position != null) {
      b17PxtControllerMva.requestRefresh();
    }
  });
}

void b17GmwFinishRefreshXra(
  RefreshController b17VqzControllerTne,
  B17KqvRefreshOutcomeZma b17JfcOutcomeYpu,
) {
  if (b17VqzControllerTne.isRefresh) {
    switch (b17JfcOutcomeYpu) {
      case B17KqvRefreshOutcomeZma.b17HqmSucceededWza:
      case B17KqvRefreshOutcomeZma.b17CjrNoMoreDataPyn:
        b17VqzControllerTne.refreshCompleted(resetFooterState: true);
      case B17KqvRefreshOutcomeZma.b17VxtFailedQke:
        b17VqzControllerTne.refreshFailed();
    }
  }

  if (!b17VqzControllerTne.isLoading) {
    return;
  }
  switch (b17JfcOutcomeYpu) {
    case B17KqvRefreshOutcomeZma.b17HqmSucceededWza:
      b17VqzControllerTne.loadComplete();
    case B17KqvRefreshOutcomeZma.b17VxtFailedQke:
      b17VqzControllerTne.loadFailed();
    case B17KqvRefreshOutcomeZma.b17CjrNoMoreDataPyn:
      b17VqzControllerTne.loadNoData();
  }
}

class B17DkgRefreshViewWta extends StatelessWidget {
  const B17DkgRefreshViewWta({
    super.key,
    required this.b17XqmControllerVta,
    required this.b17JkzChildNwe,
    this.b17CqpOnRefreshYdu,
    this.b17VfmOnLoadMoreXra,
    this.b17HqtEnableRefreshWze = true,
    this.b17NpkEnableLoadMoreXvu = false,
    this.b17GzrScrollControllerQma,
    this.b17LwcHeaderVpe,
    this.b17TqnFooterXya,
  });

  final RefreshController b17XqmControllerVta;
  final Widget b17JkzChildNwe;
  final VoidCallback? b17CqpOnRefreshYdu;
  final VoidCallback? b17VfmOnLoadMoreXra;
  final bool b17HqtEnableRefreshWze;
  final bool b17NpkEnableLoadMoreXvu;
  final ScrollController? b17GzrScrollControllerQma;
  final Widget? b17LwcHeaderVpe;
  final Widget? b17TqnFooterXya;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: b17XqmControllerVta,
      scrollController: b17GzrScrollControllerQma,
      enablePullDown: b17HqtEnableRefreshWze,
      enablePullUp: b17NpkEnableLoadMoreXvu,
      onRefresh: b17CqpOnRefreshYdu,
      onLoading: b17VfmOnLoadMoreXra,
      header: b17LwcHeaderVpe ?? const ClassicHeader(),
      footer: b17TqnFooterXya ?? const ClassicFooter(),
      child: b17JkzChildNwe,
    );
  }
}
