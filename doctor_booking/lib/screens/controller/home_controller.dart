import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:doctor_booking/service/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../service/app_services.dart';
import '../model/home_screen_model.dart';

class HomeController extends GetxController {
  bool isLoading = false;
  final searchController = TextEditingController();

  String? get token => LocalStorage.token;

  PatientListModel patientListModel = PatientListModel();

  List<Patient>? patientList = [];
  List<PatientdetailsSet>? patientListSet = [];

  fetchPatientList() async {
    var url = Uri.parse("${AppServices.baseUrl}PatientList");

    try {
      isLoading = true;
      update();
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
      });
      print(response.body.toString);

      if (response.statusCode == 200) {
        log('Success');
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        patientListModel = PatientListModel.fromJson(jsonData);
        patientList = patientListModel.patient;
        // patientListSet = patientList![0].patientdetailsSet;
        isLoading = false;
        update();
      } else {
        log('Error');
      }
    } on SocketException {
      throw 'No internet connection';
    } catch (e) {
      log('error:$e');
    } finally {
      isLoading = false;
      update();
    }
  }
}
