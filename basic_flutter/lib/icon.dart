import 'package:flutter/material.dart';

class MyIcon extends StatelessWidget {
  const MyIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("AppBar", style: TextStyle(letterSpacing: 4, fontSize: 24, fontWeight: FontWeight.bold),)),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility mode',
          ),
          Icon(
            Icons.audiotrack,
            color: Colors.green,
            size: 30,
          ),
          Icon(
            Icons.beach_access,
            color: Colors.blue,
            size: 36.0,
          )
        ],
      ),
    );
  }
}
