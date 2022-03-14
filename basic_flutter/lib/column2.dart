import 'package:flutter/material.dart';

class MyColumn2 extends StatelessWidget {
  const MyColumn2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("AppBar", style: TextStyle(letterSpacing: 4, fontSize: 24, fontWeight: FontWeight.bold),)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('We move under cover and we move as one'),
          Text('Through the night, we have one shot to live another day'),
          Text('We cannot let a stray gunshot give us away'),
          Text('We will fight up close, seize the moment and stay in it'),
          Text('It’s either that or meet the business end of a bayonet'),
          Text('The code word is ‘Rochambeau,’ dig me?'),
          Text('Mejanur',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red,fontSize: 28, letterSpacing: 4.2)
          )
        ],
      )
    );
  }
}