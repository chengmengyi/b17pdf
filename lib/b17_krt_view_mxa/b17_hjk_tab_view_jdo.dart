import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B17HjkTabViewJdo extends StatelessWidget {
  const B17HjkTabViewJdo({
    super.key,
    this.b17KqnTabControllerVze,
    this.b17QxnSelectedIndexVza = 0,
    this.b17PqmOnTapXze,
    this.b17HqmSelectedColorWza = const Color(0xFF202326),
    this.b17VqnUnselectedColorTza = const Color(0xFF6E7FA5),
    this.b17KqmLabelStyleWze,
    this.b17PqnUnselectedLabelStyleVze,
  });

  final TabController? b17KqnTabControllerVze;
  final int b17QxnSelectedIndexVza;
  final ValueChanged<int>? b17PqmOnTapXze;
  final Color b17HqmSelectedColorWza;
  final Color b17VqnUnselectedColorTza;
  final TextStyle? b17KqmLabelStyleWze;
  final TextStyle? b17PqnUnselectedLabelStyleVze;

  static const List<String> b17VqmTabTextListXza = <String>[
    'All',
    'PDF',
    'Word',
    'Excel',
  ];

  @override
  Widget build(BuildContext b17QxmContextVza) {
    final ExtendedTabBar b17KqnTabBarVze = ExtendedTabBar(
      controller: b17KqnTabControllerVze,
      onTap: b17PqmOnTapXze,
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: _B17QxnFixedWidthIndicatorVza(
        b17PqmIndicatorWidthVze: 16.w,
        b17HqmIndicatorHeightWza: 2,
        b17KqnIndicatorColorVze: const Color(0xFF242C3C),
      ),
      labelPadding: EdgeInsets.zero,
      dividerColor: Colors.transparent,
      labelColor: b17HqmSelectedColorWza,
      unselectedLabelColor: b17VqnUnselectedColorTza,
      labelStyle:
          b17KqmLabelStyleWze ??
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      unselectedLabelStyle:
          b17PqnUnselectedLabelStyleVze ??
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      tabs: b17VqmTabTextListXza
          .map(
            (String b17QxnTabTextVza) => Tab(
              child: SizedBox(
                width: 68.w,
                child: Center(child: Text(b17QxnTabTextVza.tr)),
              ),
            ),
          )
          .toList(),
    );

    if (b17KqnTabControllerVze != null) {
      return b17KqnTabBarVze;
    }
    final int b17VqnSafeSelectedIndexTza = b17QxnSelectedIndexVza.clamp(
      0,
      b17VqmTabTextListXza.length - 1,
    );
    return DefaultTabController(
      key: ValueKey<int>(b17VqnSafeSelectedIndexTza),
      length: b17VqmTabTextListXza.length,
      initialIndex: b17VqnSafeSelectedIndexTza,
      child: b17KqnTabBarVze,
    );
  }
}

class _B17QxnFixedWidthIndicatorVza extends Decoration {
  const _B17QxnFixedWidthIndicatorVza({
    required this.b17PqmIndicatorWidthVze,
    required this.b17HqmIndicatorHeightWza,
    required this.b17KqnIndicatorColorVze,
  });

  final double b17PqmIndicatorWidthVze;
  final double b17HqmIndicatorHeightWza;
  final Color b17KqnIndicatorColorVze;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _B17VqnFixedWidthIndicatorPainterTza(this);
  }
}

class _B17VqnFixedWidthIndicatorPainterTza extends BoxPainter {
  _B17VqnFixedWidthIndicatorPainterTza(this.b17QxnDecorationVza);

  final _B17QxnFixedWidthIndicatorVza b17QxnDecorationVza;

  @override
  void paint(
    Canvas b17KqnCanvasVze,
    Offset b17PqnOffsetVze,
    ImageConfiguration b17HqmConfigurationWza,
  ) {
    final Size? b17VqnSizeTza = b17HqmConfigurationWza.size;
    if (b17VqnSizeTza == null) {
      return;
    }
    final Paint b17QxnPaintVza = Paint()
      ..color = b17QxnDecorationVza.b17KqnIndicatorColorVze
      ..style = PaintingStyle.fill;
    final double b17PqnLeftVze =
        b17PqnOffsetVze.dx +
        (b17VqnSizeTza.width - b17QxnDecorationVza.b17PqmIndicatorWidthVze) / 2;
    final double b17HqmTopWza =
        b17PqnOffsetVze.dy +
        b17VqnSizeTza.height -
        b17QxnDecorationVza.b17HqmIndicatorHeightWza;
    final RRect b17KqnIndicatorRectVze = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        b17PqnLeftVze,
        b17HqmTopWza,
        b17QxnDecorationVza.b17PqmIndicatorWidthVze,
        b17QxnDecorationVza.b17HqmIndicatorHeightWza,
      ),
      Radius.circular(b17QxnDecorationVza.b17HqmIndicatorHeightWza / 2),
    );
    b17KqnCanvasVze.drawRRect(b17KqnIndicatorRectVze, b17QxnPaintVza);
  }
}
