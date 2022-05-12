import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(sum(Get.arguments).toString()),
            TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  onSurface: Colors.grey,
                ),
                onPressed: () {
                  Get.back(result: 'Back From Home');
                },
                child: const Text(
                  'Back to Main',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}

int sum(var x) {
  int a = 0;
  for (int y in x) {
    a += y;
  }
  return a;
}
