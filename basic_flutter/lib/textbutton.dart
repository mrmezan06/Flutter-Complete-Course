import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("AppBar", style: TextStyle(letterSpacing: 4, fontSize: 24, fontWeight: FontWeight.bold),)),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20)
                ),
                onPressed: null,
                child: const Text('Disabled')
            ),
            const SizedBox(height: 30,),
            TextButton(
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20)
                ),
                onPressed: () {},
                child: const Text('Enabled')
            ),
            const SizedBox(height: 30,),
            OutlinedButton(
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20)
                ),
                onPressed: () {},
                child: const Text('Outlined')
            ),
            const SizedBox(height: 30,),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                          ),
                        ),
                      ),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text('Gradient')
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
