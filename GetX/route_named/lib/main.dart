import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_named/next.dart';

import 'home.dart';
import 'unknown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Route Navigation',
      initialRoute: "/",
      defaultTransition: Transition.zoom,
      getPages: [
        GetPage(name: '/', page: () => const MyApp()),
        GetPage(name: '/home', page: () => const Home()),
        // GetPage(
        //     name: '/next',
        //     page: () => const NextScreen(),
        //     transition: Transition.rightToLeft),
        GetPage(
            name: '/next/:someValue',
            page: () => const NextScreen(),
            transition: Transition.rightToLeft),
      ],
      // Not working Unknown route in windows application
      // unknownRoute:
      //     GetPage(
      //       name: '/x',
      //       page: () => const Home()
      //     ),
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
      appBar: AppBar(title: const Text('Named Route GetX')),
      body: Center(
        child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.teal,
              onSurface: Colors.grey,
            ),
            onPressed: () {
              //Get.toNamed('/home');
               Get.toNamed('/home?channel=Akash Khan&content=Flutter Dev');
               // Not working unknown route
             // Get.toNamed('/x');
            },
            child: const Text(
              'Go to Home',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
