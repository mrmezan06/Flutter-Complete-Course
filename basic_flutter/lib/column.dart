import 'package:flutter/material.dart';

class MyColumn extends StatelessWidget {
  const MyColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("AppBar", style: TextStyle(letterSpacing: 4, fontSize: 24, fontWeight: FontWeight.bold),)),
      ),
      body: Column(
        children: const [
          Text('Deliver features faster'),
          Text('Craft beautiful UIs'),
          Expanded(child: FittedBox(
            fit: BoxFit.contain,
            child: FlutterLogo(),
          ))
        ],
      ),
    );
  }
}
