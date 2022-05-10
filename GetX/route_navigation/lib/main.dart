import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_navigation/home.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text('Route GetX')),
      body: Center(
        child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.teal,
              onSurface: Colors.grey,
            ),
            onPressed: () async {
              // Get.to(
              //   const HomeRoute(),
              //   //fullscreenDialog: true,
              //   transition: Transition.zoom,
              //   duration: const Duration(seconds: 1),
              //   curve: Curves.easeInCubic,
              //   );
              var data =
                  await Get.to(const HomeRoute(), arguments: [1, 2, 3, 4]);
              //print('The received data is $data');
              if (data != null) {
                Get.snackbar('Received Data', data,
                    snackPosition: SnackPosition.BOTTOM);
              }
              //
              // Get.off(const HomeRoute());
              // Get.offAll(const HomeRoute());
            },
            child: const Text(
              'Home Screen',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
