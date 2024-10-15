import 'package:get/get.dart';

import 'connectivity_controller.dart';

class ConnectivityInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
