import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:separatebusinesslogic/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MyController myController = Get.put(MyController());
    return Scaffold(
      appBar: AppBar(title: const Text('Controller of GetX')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<MyController>(
                id: 'txtCount',
                builder: (controller) {
                  return Text(
                    'Current Counter Value is ${controller.count}',
                    style: const TextStyle(color: Colors.green, fontSize: 18),
                  );
                }),
            GetBuilder<MyController>(builder: (controller) {
              return Text(
                'Start Counter Value is ${controller.count}',
                style: const TextStyle(color: Colors.red, fontSize: 18),
              );
            }),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  onSurface: Colors.grey,
                ),
                onPressed: () {
                  myController.increment();
                },
                child: const Text(
                  'Increment',
                  style: TextStyle(color: Colors.white),
                )),

                TextField(
                  onChanged: (value) => myController.increment(),
                )
          ],
        ),
      ),
    );
  }
}
