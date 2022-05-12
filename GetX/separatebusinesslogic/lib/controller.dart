import 'package:get/get.dart';

class MyController extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
    // Everything Update
    //update();
    // Unique Id Update
    update(['txtCount']);
  }

  @override
  void onInit() {
    /* It is override the
     Init function and best 
     place of use overriding 
     the init function Inside
      the Controller class. */

    /* Ever is called whenever change the value of count */
    // ever(count, (_) => print(count));

    /* List of observable variable to observe */
    // everAll([count], (_) => print(count));

    /* Once is called only one time */
    // once(count, (_) => print(count));

    /* debounce called always for a specific time user stops typing */
    // Mostly use for searching
    //debounce(count, (_) => print(count), time: const Duration(seconds: 1));

    // Ignore all changes within 3 second
    interval(count, (_) => print('Ignore all changes'),
        time: const Duration(seconds: 3));
    super.onInit();
  }
}
