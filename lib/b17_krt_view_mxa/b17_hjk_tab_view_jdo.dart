import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B17HjkTabViewJdo extends StatelessWidget {
  const B17HjkTabViewJdo({
    super.key,
    this.apex09TabController,
    this.apex09OnTap,
    this.apex09SelectedColor = const Color(0xFFDA2929),
    this.apex09UnselectedColor = const Color(0xFF8C8E9C),
    this.apex09LabelStyle,
    this.apex09UnselectedLabelStyle,
  });

  final TabController? apex09TabController;
  final ValueChanged<int>? apex09OnTap;
  final Color apex09SelectedColor;
  final Color apex09UnselectedColor;
  final TextStyle? apex09LabelStyle;
  final TextStyle? apex09UnselectedLabelStyle;
  static const List<String> apex09TabTextList = <String>[
    'All',
    'PDF',
    'Word',
    'Excel',
  ];

  @override
  Widget build(BuildContext context) {
    return ExtendedTabBar(
      controller: apex09TabController,
      onTap: apex09OnTap,
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: _Apex09FixedWidthIndicator(
        apex09IndicatorWidth: 16.w,
        apex09IndicatorHeight: 2,
        apex09IndicatorColor: const Color(0xFFDA2929),
      ),
      labelPadding: EdgeInsets.zero,
      dividerColor: Colors.transparent,
      labelColor: apex09SelectedColor,
      unselectedLabelColor: apex09UnselectedColor,
      labelStyle:
          apex09LabelStyle ??
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      unselectedLabelStyle:
          apex09UnselectedLabelStyle ??
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      tabs: apex09TabTextList
          .map(
            (String apex09TabText) => Tab(
              child: SizedBox(
                width: 68.w,
                child: Center(child: Text(apex09TabText.tr)),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _Apex09FixedWidthIndicator extends Decoration {
  const _Apex09FixedWidthIndicator({
    required this.apex09IndicatorWidth,
    required this.apex09IndicatorHeight,
    required this.apex09IndicatorColor,
  });

  final double apex09IndicatorWidth;
  final double apex09IndicatorHeight;
  final Color apex09IndicatorColor;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _Apex09FixedWidthIndicatorPainter(this);
  }
}

class _Apex09FixedWidthIndicatorPainter extends BoxPainter {
  _Apex09FixedWidthIndicatorPainter(this.apex09Decoration);

  final _Apex09FixedWidthIndicator apex09Decoration;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Size? apex09Size = configuration.size;
    if (apex09Size == null) {
      return;
    }
    final Paint apex09Paint = Paint()
      ..color = apex09Decoration.apex09IndicatorColor
      ..style = PaintingStyle.fill;
    final double apex09Left =
        offset.dx +
        (apex09Size.width - apex09Decoration.apex09IndicatorWidth) / 2;
    final double apex09Top =
        offset.dy + apex09Size.height - apex09Decoration.apex09IndicatorHeight;
    final RRect apex09RRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        apex09Left,
        apex09Top,
        apex09Decoration.apex09IndicatorWidth,
        apex09Decoration.apex09IndicatorHeight,
      ),
      Radius.circular(apex09Decoration.apex09IndicatorHeight / 2),
    );
    canvas.drawRRect(apex09RRect, apex09Paint);
  }
}
