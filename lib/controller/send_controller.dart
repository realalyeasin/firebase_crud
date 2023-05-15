
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TransactionController extends GetxController {
  static TransactionController get instance => Get.find();


  /// TextField Controllers to get data from TextFields
  final id = TextEditingController();
  final create = TextEditingController();
  final sname = TextEditingController();
  final ssurname = TextEditingController();
  final smidname = TextEditingController();
  final snum = TextEditingController();
  final sadress = TextEditingController();
  final rname = TextEditingController();
  final rsurname = TextEditingController();
  final rmidname = TextEditingController();
  final rnum = TextEditingController();
  final radress = TextEditingController();
  final smontant = TextEditingController();
  final pmontant = TextEditingController();
  final sdevise = TextEditingController();
  final pdevise = TextEditingController();

  
}
