import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  initServices();

  /// AWAIT SERVICES INITIALIZATION.
  runApp(const MyApp());
}

void initServices() async {
  print('starting services ...');

  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
  /// GetXService works on get: 4.6.1
  await Get.putAsync(() => DbService().init());
  await Get.putAsync(
    () async => Services(),
  );
  //await Get.putAsync(SettingsService()).init();
  print('All services started...');
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
      appBar: AppBar(title: const Text('GetX Service')),
      body: Center(
        child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.teal,
              onSurface: Colors.grey,
            ),
            onPressed: () {
              Get.find<Services>().incCounter();
            },
            child: const Text(
              'Increment',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}

class DbService extends GetxService {
  Future<DbService> init() async {
    print('$runtimeType delays 2 sec');
    await 2.delay();
    print('$runtimeType ready!');
    return this;
  }
}

class Services extends GetxService {
  Future<void> incCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int c = (prefs.getInt('c') ?? 0) + 1;
    print('Pressed $c times.');
    await prefs.setInt('c', c);
  }
}
