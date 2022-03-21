import 'package:flutter/material.dart';

class VisibilitySetup extends StatefulWidget {
  const VisibilitySetup({Key? key}) : super(key: key);

  @override
  _VisibilitySetupState createState() => _VisibilitySetupState();
}

class _VisibilitySetupState extends State<VisibilitySetup> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Visibility'), actions: [
        TextButton(onPressed: (){
          setState(() {
            _isVisible = !_isVisible;
          });
        },
            child: const Text(
              'Switch',
              style: TextStyle(color: Colors.white),
            )
        )
      ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/wall.jpg', height: 100,width: 100,),
              Visibility(
                child: Image.asset('assets/wall.jpg', height: 100,width: 100,),
                visible: _isVisible,
              ),
              Image.asset('assets/wall.jpg', height: 100,width: 100,)
            ],
          ),
        ),
      ),
    );
  }
}
