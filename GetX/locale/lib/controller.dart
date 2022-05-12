import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {'hello': 'Hello'},
        'bd_BD': {'hello': 'হ্যালো'},
        'fr_FR': {'hello': 'salut'}
      };
}

class MyController extends GetxController {
  void change_language(var param1, var param2) {
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
  }
}
