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

class InteractiveViewerWithWindow extends StatefulWidget {
  const InteractiveViewerWithWindow({Key? key}) : super(key: key);

  @override
  State<InteractiveViewerWithWindow> createState() => _InteractiveViewerWithWindowState();
}

class _InteractiveViewerWithWindowState extends State<InteractiveViewerWithWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(double.infinity),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Interactive Window'),
          ),
        ),
      ),
    );
  }
}

