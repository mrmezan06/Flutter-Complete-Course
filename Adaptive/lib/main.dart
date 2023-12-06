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
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var val = 1.0;
  var isOn = true;
  var sOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Adaptive Widget"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Slider.adaptive(
                  value: val,
                  onChanged: (double newValue){
                   setState(() {
                     val = newValue;
                   });
                  }
              ),
              SwitchListTile.adaptive(
                  title: const Text("Switch List Tile"),
                  value: isOn,
                  onChanged: (bool newValue){
                    setState(() {
                      isOn = newValue;
                    });
                  }
              ),
              Switch.adaptive(value: sOn, onChanged: (bool newValue){
                setState(() {
                  sOn = newValue;
                });
              }),
              Icon(Icons.adaptive.share),
              const CircularProgressIndicator.adaptive()
            ],
          ),
        )
    );


  }
}

