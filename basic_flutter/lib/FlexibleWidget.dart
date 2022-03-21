import 'package:flutter/material.dart';

class FlexibleWithFit extends StatefulWidget {
  const FlexibleWithFit({Key? key}) : super(key: key);

  @override
  State<FlexibleWithFit> createState() => _FlexibleWithFitState();
}

class _FlexibleWithFitState extends State<FlexibleWithFit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible With Fit'),
      ),body: Center(
      child: Column(
        children: [
          Flexible(
              fit: FlexFit.tight, //Height Doesn't matter
              child: Container(
            color: Colors.blue,
            height: 50,
          )),
          Flexible(
              fit: FlexFit.tight,
              child: Container(
            color: Colors.orange,
            height: 150,
          )),
          Flexible(
              fit: FlexFit.tight,
              child: Container(
            color: Colors.red,
            height: 150,
          )),
        ],
      ),
    ),
    );
  }
}

class FlexibleWithoutFit extends StatefulWidget {
  const FlexibleWithoutFit({Key? key}) : super(key: key);

  @override
  State<FlexibleWithoutFit> createState() => _FlexibleWithoutFitState();
}

class _FlexibleWithoutFitState extends State<FlexibleWithoutFit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible Without Fit'),
      ),body: Center(
      child: Column(
        children: [
          Flexible(
              child: Container(
                color: Colors.blue,
                height: 50, //without fit height is matter
              )),
          Flexible(
              child: Container(
                color: Colors.orange,
                height: 150,
              )),
          Flexible(
              child: Container(
                color: Colors.red,
                height: 150,
              )),
        ],
      ),
    ),
    );
  }
}

class FlexibleWithoutFitAndHeight extends StatefulWidget {
  const FlexibleWithoutFitAndHeight({Key? key}) : super(key: key);

  @override
  State<FlexibleWithoutFitAndHeight> createState() => _FlexibleWithoutFitAndHeightState();
}

class _FlexibleWithoutFitAndHeightState extends State<FlexibleWithoutFitAndHeight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible Without Fit And Height'),
      ),body: Center(
      child: Column(
        children: [
          Flexible(
              child: Container(
                color: Colors.blue,

              )),
          Flexible(
              child: Container(
                color: Colors.orange,

              )),
          Flexible(
              child: Container(
                color: Colors.red,

              )),
        ],
      ),
    ),
    );
  }
}


