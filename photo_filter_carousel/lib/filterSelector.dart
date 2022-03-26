import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

@immutable
class FilterSelector extends StatefulWidget {
  const FilterSelector({
    Key? key,
    required this.onFilterChanged,
    required this.filters,
    this.padding = const EdgeInsets.symmetric(vertical: 24.0),
  }) : super(key: key);

  final List<Color> filters;

  final void Function(Color selectedColor) onFilterChanged;
  final EdgeInsets padding;

  @override
  State<FilterSelector> createState() => _FilterSelectorState();
}

class _FilterSelectorState extends State<FilterSelector> {
  static const _filtersPerScreen = 5;
  static const _viewportFractionPerItem = 1.0 / _filtersPerScreen;
  late final PageController _controller;
  late int _page;
  int get filterCount => widget.filters.length;
  Color itemColor(int index) => widget.filters[index % filterCount];

  @override
  void initState() {
    super.initState();
    _page = 0;
    _controller = PageController(
      initialPage: _page,
      viewportFraction: _viewportFractionPerItem,
    );
    _controller.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final page = (_controller.page ?? 0).round();
    if (page != _page) {
      _page = page;
      widget.onFilterChanged(widget.filters[page]);
    }
  }

  void _onFilterTapped(int index) {
    _controller.animateToPage(index,
        duration: const Duration(milliseconds: 450), curve: Curves.ease);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollable(
      controller: _controller,
      axisDirection: AxisDirection.right,
      physics: const PageScrollPhysics(),
      viewportBuilder: (context, viewportOffset) {
        return LayoutBuilder(builder: (context, constraints) {
          final itemSize = constraints.maxWidth * _viewportFractionPerItem;
          viewportOffset
            ..applyViewportDimension(constraints.maxWidth)
            ..applyContentDimensions(0.0, itemSize * (filterCount - 1));

          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _buildShadowGradient(itemSize),
              _buildCarousel(
                viewportOffset: viewportOffset,
                itemSize: itemSize,
              ),
              _buildSeletionRing(itemSize),
            ],
          );
        });
      },
    );
  }

  Widget _buildShadowGradient(double itemSize) {
    return SizedBox(
      height: itemSize * 2 + widget.padding.vertical,
      child: const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black,
              ]),
        ),
        child: SizedBox.expand(),
      ),
    );
  }

  Widget _buildCarousel(
      {required ViewportOffset viewportOffset, required double itemSize}) {
    return Container(
      height: itemSize,
      margin: widget.padding,
      child: Flow(
        delegate: CarouselFlowDelegate(
            viewportOffset: viewportOffset,
            filtersPerScreen: _filtersPerScreen),
        children: [
          for (int i = 0; i < filterCount; i++)
            FilterItem(
                onFilterSelected: () => _onFilterTapped(i), color: itemColor(i))
        ],
      ),
    );
  }

  Widget _buildSeletionRing(double itemSize) {
    return IgnorePointer(
      child: Padding(
        padding: widget.padding,
        child: SizedBox(
          width: itemSize,
          height: itemSize,
          child: const DecoratedBox(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(
                      BorderSide(width: 6.0, color: Colors.white)))),
        ),
      ),
    );
  }
}

class CarouselFlowDelegate extends FlowDelegate {
  CarouselFlowDelegate(
      {required this.viewportOffset, required this.filtersPerScreen})
      : super(repaint: viewportOffset);

  final ViewportOffset viewportOffset;
  final int filtersPerScreen;

  @override
  void paintChildren(FlowPaintingContext context) {
    final count = context.childCount;
    final size = context.size.width;
    final itemExtent = size / filtersPerScreen;
    final active = viewportOffset.pixels / itemExtent;

    final min = math.max(0, active.floor() - 3).toInt();
    final max = math.min(count - 1, active.ceil() + 3).toInt();
    for (var index = min; index <= max; index++) {
      final itemXFromCenter = itemExtent * index - viewportOffset.pixels;
      final percentFromCenter = 1.0 - (itemXFromCenter / (size / 2)).abs();
      final itemScale = .5 + (percentFromCenter * .5);
      final opacity = .25 + (percentFromCenter * .75);
      final itemTransform = Matrix4.identity()
        ..translate((size - itemExtent) / 2)
        ..translate(itemXFromCenter)
        ..translate(itemExtent / 2, itemExtent / 2)
        ..multiply(Matrix4.diagonal3Values(itemScale, itemScale, 1.0))
        ..translate(-itemExtent / 2, -itemExtent / 2);

      context.paintChild(index, transform: itemTransform, opacity: opacity);
    }
  }

  @override
  bool shouldRepaint(covariant CarouselFlowDelegate oldDelegate) {
    return oldDelegate.viewportOffset != viewportOffset;
  }
}

class FilterItem extends StatelessWidget {
  const FilterItem({Key? key, required this.color, this.onFilterSelected}) : super(key: key);

  final Color color;
  final VoidCallback? onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterSelected,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            'https://images.pexels.com/photos/10144357/pexels-photo-10144357.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
            color: color.withOpacity(0.5),
            colorBlendMode: BlendMode.hardLight,
            ),
        ),
      ),
    );
  }
}
