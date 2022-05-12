import 'package:class_observale/student.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}
/* 
To update the widget which uses Rx variable must use 
Obx(()=>Your widget which uses Rx)
The widget will only update if and only if the Rx variable value changes.
Other ways of making Rx variable -
1. The first is using Rx{type}(value) -
====================================
Initial value is recommended but not mandatory

final name = RxString('Akash');
final isLogged = RxBool(false);
final count = RxInt(100);
final Balance = RxDouble(0.0);
final items = RxList<String>([]);
final myMap = RxMap<String,int>({});

2. Uses dart generics Rx<types>(value)
final name = Rx<String>('Akash');
final isLogged = Rx<Bool>(false);
final count = Rx<Int>(100);
final Balance = Rx<Double>(0.0);
final number = Rx<Num>(0);
final items = Rx<List<String>>([]);
final myMap = Rx<Map<String,int>>({});

// Custom Classes
final user = Rx<User>();

 */

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  // individual variable obs
  // final student = Student();
  // class obs
  final student = Student(name: 'Tom', age: 25).obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rx State Management GetX')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text(
              // individual variable obs
                  //'Student name is ${student.name.value}',
                  // clas obs
                  'Student name is ${student.value.name}',
                  style: const TextStyle(fontSize: 25, color: Colors.red),
                )),
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
                  // Individual variable obs
                  // student.name.value = student.name.value.toUpperCase();
                  // class obs
                  student.update((student) {
                    student!.name = student.name.toString().toUpperCase();
                  });
                },
                child: const Text(
                  'Upper Case',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
