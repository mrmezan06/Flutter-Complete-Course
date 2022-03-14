import 'package:flutter/material.dart';

class AppBarApp extends StatelessWidget {
  const AppBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("AppBar", style: TextStyle(letterSpacing: 4, fontSize: 24, fontWeight: FontWeight.bold),)),
      ),
      body: const Center(
        child: Text('App Bar Application', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
