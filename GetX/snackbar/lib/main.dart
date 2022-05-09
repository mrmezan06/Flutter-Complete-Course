import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar GetX')),
      body: Center(
        child: TextButton(
            style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  onSurface: Colors.grey,
                    ),
            onPressed: () {
              Get.snackbar('title', 'message',
              // titleText: const Text('Another Title', 
               //style: TextStyle(color: Colors.white),
              // ),
              // messageText: const Text('Another Message',
                //style: TextStyle(color: Colors.white),
                //),
               snackPosition: SnackPosition.BOTTOM,
               colorText: Colors.white,
               backgroundColor: Colors.black,
                borderRadius: 30,
                margin: const EdgeInsets.all(10),
                //maxWidth: 100,
                animationDuration: const Duration(seconds: 3),
                //backgroundGradient: const LinearGradient(colors: [Colors.green, Colors.red, Colors.orange]),
                icon: const Icon(Icons.message, color: Colors.white,),
                shouldIconPulse: true,
                //isDismissible: false,
                mainButton: TextButton(onPressed: (){}, child: const Icon(Icons.send, color: Colors.white,))
               );
            },
            child: const Text('Show Snackbar', style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}
