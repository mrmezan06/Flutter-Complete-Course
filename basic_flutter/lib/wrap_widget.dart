import 'package:flutter/material.dart';

class WrapWidget extends StatelessWidget {
  const WrapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _image = Padding(
    padding: const EdgeInsets.all(9.0),
    child: Image.asset(
      'assets/wall.jpg',
      height: 100,
      width: 100,
      fit: BoxFit.cover,
    ),
    );

    List<Widget> _list = [_image,_image,_image,_image,_image];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrap Widget'),
      ),
      body: Center(
        child: Wrap(
          children: _list,
        ),
      ),
    );
  }
}
