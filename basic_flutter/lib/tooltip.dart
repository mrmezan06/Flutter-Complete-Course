import 'package:flutter/material.dart';

class ToolTipWidget extends StatefulWidget {
  const ToolTipWidget({Key? key}) : super(key: key);

  @override
  State<ToolTipWidget> createState() => _ToolTipWidgetState();
}

class _ToolTipWidgetState extends State<ToolTipWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tool Tip'),
      ),
      body: Center(
        child: Tooltip(
          message: 'Wallpaper From PEXELS',
          child: Image.asset(
            'assets/wall.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
