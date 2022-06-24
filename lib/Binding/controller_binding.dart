import 'package:get/get.dart';
import 'package:word_bank/Controller/word_controller.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<WordController>(WordController());
  }

}