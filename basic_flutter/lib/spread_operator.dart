import 'package:flutter/material.dart';

class SpreadOperatorWidget extends StatefulWidget {
  const SpreadOperatorWidget({Key? key}) : super(key: key);

  @override
  State<SpreadOperatorWidget> createState() => _SpreadOperatorWidgetState();
}

class _SpreadOperatorWidgetState extends State<SpreadOperatorWidget> {
  @override
  Widget build(BuildContext context) {
    
    List<Widget> imagesList = [
      Image.asset('assets/wall.jpg', width: double.maxFinite, height: 100,fit: BoxFit.cover,),
      Image.asset('assets/wall.jpg', width: double.maxFinite, height: 100,fit: BoxFit.cover,),
      Image.asset('assets/wall.jpg', width: double.maxFinite, height: 100,fit: BoxFit.cover,),
      Image.asset('assets/wall.jpg', width: double.maxFinite, height: 100,fit: BoxFit.cover,),
    ];
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spread Operator'),
      ),
      body: Column(
        children: [
          Image.asset('assets/wall.jpg', width: double.maxFinite, height: 150,fit: BoxFit.cover,),
          const SizedBox(height: 10,),
          /*Column(
            children: imagesList,
          )*/ // Same works as Spread Operator
          ...imagesList
        ],
      ),
    );
  }
}
