import 'dart:convert';
import 'dart:developer';

import 'package:doctor_booking/service/app_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../service/local_storage.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Login post function::::::::::
  bool isLoading = false;

  Future<void> login(String email, String password) async {
    var url = Uri.parse("${AppServices.baseUrl}Login");
    var request = http.MultipartRequest('POST', url)
      ..fields['username'] = email
      ..fields['password'] = password;

    try {
      isLoading = true;
      update();
      var response = await request.send();

      var responseData = await http.Response.fromStream(response);

      if (responseData.statusCode == 200) {
        isLoading = false;
        update();

        print("Correct");
        final jsonResponse = jsonDecode(responseData.body);
        if (jsonResponse['status'] == true) {
          Get.toNamed('/home');
          String token = jsonResponse['token'];
          await LocalStorage.saveToken(token);
          isLoading = false;
          update();
        } else {
          Get.snackbar(
            "Login Failed",
            "Credentials are wrong. Please try again.",
            margin: const EdgeInsets.all(8),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red[400],
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          "Error",
          "Something went wrong.",
          margin: const EdgeInsets.all(8),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.yellow[300],
          colorText: Colors.black,
        );
      }
    } catch (e) {
      log("Error occurred: $e");
    }
  }
}
