import 'package:doctor_booking/service/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final searchController = TextEditingController();

  String? get token => LocalStorage.token;

  
}
