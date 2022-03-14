import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("AppBar", style: TextStyle(letterSpacing: 4, fontSize: 24, fontWeight: FontWeight.bold),)),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:  [
            const ElevatedButton(onPressed: null, child: Text('Disabled')),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: () {}, child: const Text('Enabled')),
          ],
        )
      ),
    );
  }
}
