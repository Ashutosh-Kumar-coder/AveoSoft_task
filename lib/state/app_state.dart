import 'package:get/get.dart';

class AppState extends GetxController{
  @override
  void onInit() { // called immediately after the widget is allocated memory

    super.onInit();
  }

  @override
  void onReady() { // called after the widget is rendered on screen

    super.onReady();
  }

  @override
  void onClose() { // called just before the Controller is deleted from memory
    super.onClose();
  }

  int counter = 0;

  void increment() {
    counter++;
    update(); // look here!
  }
}