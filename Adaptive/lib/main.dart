import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Adaptive Widget Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Slider.adaptive(
                value: 1,
                onChanged: (double newValue){

                }
                ),
            SwitchListTile.adaptive(
              title: const Text("Switch List Tile"),
                value: true,
                onChanged: (bool newValue){
                }
            ),
            Switch.adaptive(value: true, onChanged: (bool newValue){}),
            Icon(Icons.adaptive.share),
            const CircularProgressIndicator.adaptive()
          ],
        ),
      )
    );
  }
}
