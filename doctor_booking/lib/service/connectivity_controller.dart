import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared_widget/custom_text.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  bool _showingNoInternetDialog = false;

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      if (!_showingNoInternetDialog) {
        _showNoInternetDialog();
      }
    } else {
      if (_showingNoInternetDialog) {
        Get.back();
        _showingNoInternetDialog = false;
      }
    }
  }

  void _showNoInternetDialog() {
    _showingNoInternetDialog = true;
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        actionsPadding: const EdgeInsets.all(0),
        buttonPadding: const EdgeInsets.all(0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            Text(
              'No Internet',
              style: GoogleFonts.poppins(
                  fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 7),
            const Icon(
              Icons.wifi_off_outlined,
              size: 25,
              color: Colors.red,
            ),
          ],
        ),
        content: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child:
                  Text('Please check the internet connection and try again.'),
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0, bottom: 8.0),
            child: TextButton(
              child: Text(
                'Retry',
                style: GoogleFonts.poppins(
                    color: Colors.green[300],
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                Get.back();
                _checkInternetStatus();
              },
            ),
          ),
        ],
      ),
    );
  }

  void _checkInternetStatus() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showNoInternetDialog();
    } else {
      Get.back();
      _showingNoInternetDialog = false;
    }
  }
}
