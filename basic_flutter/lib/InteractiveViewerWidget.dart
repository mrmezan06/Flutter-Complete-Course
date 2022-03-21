import 'package:flutter/material.dart';

class InteractiveViewerWidget extends StatefulWidget {
  const InteractiveViewerWidget({Key? key}) : super(key: key);

  @override
  State<InteractiveViewerWidget> createState() => _InteractiveViewerWidgetState();
}

class _InteractiveViewerWidgetState extends State<InteractiveViewerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Viewer Widget'),
      ),
      body: Center(
        child: InteractiveViewer(
          maxScale: 5,
          child: Image.asset('assets/wall.jpg', width: double.maxFinite, height: double.maxFinite,fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
