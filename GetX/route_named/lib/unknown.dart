import 'package:flutter/material.dart';

class UnknownRoute extends StatelessWidget {
  const UnknownRoute({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unknown Route'),),
      body: const Center(
        child:Text(
          'Route not found!',
           style: TextStyle(color: Colors.red, fontSize: 18),
           )
           ),
      
    );
  }
}