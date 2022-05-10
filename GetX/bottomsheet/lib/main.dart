import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      appBar: AppBar(title: const Text('BottomSheet GetX')),
      body: Center(
        child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.teal,
              onSurface: Colors.grey,
            ),
            onPressed: () {
              Get.bottomSheet(
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.red,
                  ),
                height: 100,
                
                margin: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Do you agree our terms and policy?',textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 18),),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton.icon(style: ElevatedButton.styleFrom(primary: Colors.purple, onPrimary: Colors.red),onPressed: (){}, icon: const Icon(Icons.cancel, color: Colors.white,), label: const Text('Cancel', style: TextStyle(color: Colors.white),)),
                        TextButton.icon(style: ElevatedButton.styleFrom(primary: Colors.purple, onPrimary: Colors.red),onPressed: (){}, icon: const Icon(Icons.cancel, color: Colors.white,), label: const Text('Confirm', style: TextStyle(color: Colors.white),)),
                      ],
                    )
                  ],
                ),
              ));
            },
            child: const Text(
              'Show BottomSheet',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
