import 'package:flutter/material.dart';
import 'package:photo_filter_carousel/filterSelector.dart';

class InstagramFilterSelection extends StatefulWidget {
  const InstagramFilterSelection({Key? key}) : super(key: key);

  @override
  State<InstagramFilterSelection> createState() =>
      _InstagramFilterSelectionState();
}

class _InstagramFilterSelectionState extends State<InstagramFilterSelection> {
  final _filters = [
    Colors.white,
    ...List.generate(Colors.primaries.length,
        (index) => Colors.primaries[(index * 4) % Colors.primaries.length])
  ];
  final _filterColor = ValueNotifier<Color>(Colors.white);
  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(
            child: _buildPhotoWithFIlter(),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: _buildFilterSelector(),
          )
        ],
      ),
    );
  }

  Widget _buildPhotoWithFIlter() {
    return ValueListenableBuilder(
        valueListenable: _filterColor,
        builder: (context, value, child) {
          final color = value as Color;
          return Image.network(
            'https://images.pexels.com/photos/10144357/pexels-photo-10144357.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
            color: color.withOpacity(0.5),
            colorBlendMode: BlendMode.color,
            fit: BoxFit.cover,
          );
        });
  }

  Widget _buildFilterSelector() {
    return FilterSelector(onFilterChanged: _onFilterChanged, filters: _filters);
  }
}
