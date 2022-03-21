import 'package:basic_flutter/appbar.dart';
import 'package:flutter/material.dart';


class PositionedWidget extends StatefulWidget {
  const PositionedWidget({Key? key}) : super(key: key);

  @override
  State<PositionedWidget> createState() => _PositionedWidgetState();
}

class _PositionedWidgetState extends State<PositionedWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Positioned'),
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
                left: 40,
                top: 40,
                child: Image.asset('assets/wall.jpg', width: 250, height: 200,)
            ),
            Positioned(
                left: 80,
                top: 80,
                child: Image.asset('assets/wall.jpg', width: 250, height: 200,)
            ),
            Positioned(
                left: 120,
                top: 120,
                child: Image.asset('assets/wall.jpg', width: 250, height: 200,)
            ),
          ],
        ),
      ),
    );
  }
}
