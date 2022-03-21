import 'package:flutter/material.dart';

class StackWidget extends StatefulWidget {
  const StackWidget({Key? key}) : super(key: key);

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack'),
      ),
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Image.asset('assets/wall.jpg', width: double.maxFinite,),
            ),
            const Center(
              child: Icon(Icons.home_max_outlined,color: Colors.blue,size: 128,),
            )
          ],
        ),
      ),
    );
  }
}
