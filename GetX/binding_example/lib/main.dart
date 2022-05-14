import 'package:binding_example/binding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  /* For available MyController in Get.find() method. */
  // MyControllerBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Binding',
      initialBinding: MyBinding(),
      /* Route level binding its not working somehow*/
      /* getPages: [
        GetPage(
            name: '/home',
            page: () => const Home(),
            binding: HomeControllerBinding())
      ], */

      /* Embedded binder its not working somehow*/
      // getPages: [
      //   GetPage(
      //       name: '/home',
      //       page: () => const Home(),
      //       binding: BindingsBuilder(
      //         () => {Get.lazyPut<HomeController>(() => HomeController())},
      //       ))
      // ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GetX Binding'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() =>
                Text('The current value is  ${Get.find<MyController>().c}')),
            OutlinedButton(
                onPressed: () {
                  Get.find<MyController>().increment();
                },
                child: const Text('Increment')),
            OutlinedButton(
                onPressed: () {
                  Get.to(() => const Home());
                },
                child: const Text('Home')),
          ],
        )),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Binding'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() =>
              Text('The current value is ${Get.find<HomeController>().c}')),
          OutlinedButton(
              onPressed: () {
                Get.find<HomeController>().increment();
              },
              child: const Text('Increment')),
          OutlinedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Back')),
        ],
      )),
    );
  }
}
