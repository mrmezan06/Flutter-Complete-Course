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
      appBar: AppBar(title: const Text('Dialog GetX')),
      body: Center(
        child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.teal,
              onSurface: Colors.grey,
            ),
            onPressed: () {
              //Get.defaultDialog();
              Get.defaultDialog(
                title: 'Custom Alert',
                titleStyle: const TextStyle(
                    color: Colors.black, backgroundColor: Colors.white),
                middleText: 'Custom Middle Text',
                middleTextStyle: const TextStyle(
                    color: Colors.red, backgroundColor: Colors.white),
                // textCancel: 'Clear',
                // textConfirm: 'Ok',
                // onCancel: () {
                //   Get.snackbar('Dialog', 'Clear', snackPosition: SnackPosition.BOTTOM);
                // },
                // onConfirm: () {
                //   Get.snackbar('Dialog', 'Ok', snackPosition: SnackPosition.BOTTOM);
                // },
                confirm: IconButton(
                    onPressed: () {
                      // Get.snackbar('Dialog', 'Ok',
                      //     snackPosition: SnackPosition.BOTTOM);
                      // Close the dialog
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.done,
                      color: Colors.green,
                    )),
                cancel: IconButton(
                    onPressed: () {
                      Get.snackbar('Dialog', 'Clear',
                          snackPosition: SnackPosition.BOTTOM);
                    },
                    icon: const Icon(
                      Icons.cancel,
                      color: Colors.red,
                    )),
                    actions: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
                                onPressed: (){
                                  Get.snackbar('Action', 'Add',
                              snackPosition: SnackPosition.BOTTOM);
                                },
                                 child: const Icon(Icons.add, color: Colors.white,)
                                 ),
                            ),
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                              onPressed: (){
                                  Get.snackbar('Action', 'Remove',
                            snackPosition: SnackPosition.BOTTOM);
                              },
                                 child: const Icon(Icons.remove, color: Colors.white,)
                                 ),
                               ),
                          ],
                        ),
                      )
                    ]
              );
            },
            child: const Text(
              'Show Dialog',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
