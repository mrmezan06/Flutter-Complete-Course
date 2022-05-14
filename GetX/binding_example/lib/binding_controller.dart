import 'package:get/get.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyController>(() => MyController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

/* For Route level binding */
class MyControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyController>(() => MyController());
  }
}

class HomeControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

/* Here is my controller it can be defined in separate files. */

class MyController extends GetxController {
  var c = 0.obs;

  void increment() {
    c++;
  }
}

class HomeController extends GetxController {
  var c = 0.obs;

  void increment() {
    c++;
  }
}
