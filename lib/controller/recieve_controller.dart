import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecController extends GetxController {
  static RecController get instance => Get.find();

  /// TextField Controllers to get data from TextFields
  final code = TextEditingController();
  final name = TextEditingController();
  final surname = TextEditingController();
  final midname = TextEditingController();
  

}
