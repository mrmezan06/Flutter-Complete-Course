import 'package:flutter/material.dart';

class AnimationFaded extends StatefulWidget {
  const AnimationFaded({Key? key}) : super(key: key);

  @override
  State<AnimationFaded> createState() => _AnimationFadedState();
}

class _AnimationFadedState extends State<AnimationFaded> {
  bool _bool = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Faded'),
        actions: [
          TextButton(onPressed: (){
            setState(() {
              _bool = !_bool;
            });
          }, child: const Text('Switch', style: TextStyle(color: Colors.white),)
          )
        ],
      ),
      body: Center(
        child: AnimatedCrossFade(
          firstChild: Image.asset('assets/wall.jpg', width: 350, height: 200,),
          secondChild: Image.asset('assets/wall1.jpg', width: 200, height: 350,),
          crossFadeState: _bool ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}
