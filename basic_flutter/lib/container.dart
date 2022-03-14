import 'package:flutter/material.dart';

class MyContainer2 extends StatelessWidget {
  const MyContainer2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("AppBar", style: TextStyle(letterSpacing: 4, fontSize: 24, fontWeight: FontWeight.bold),)),
      ),
      body:
            Container(
              constraints: BoxConstraints.expand(
                height: Theme.of(context).textTheme.headline4!.fontSize! * 1.1 + 200.0,
              ),
              padding: const EdgeInsets.all(8.0),
              color: Colors.blue[600],
              alignment: Alignment.center,
              child: Text('Mejanur Rahman',
                style: Theme.of(context).textTheme.headline4!
                    .copyWith(color: Colors.white),
              ),
              transform: Matrix4.rotationZ(0.05),
        ),
    );
  }
}
