import 'package:doctor_booking/screens/view/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/view/home_screen.dart';
import 'screens/view/login_screen.dart';
import 'screens/view/splash_screen.dart';
import 'service/connectivity_injection.dart';

void main() {
  runApp(const MyApp());
  ConnectivityInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Country Cue',
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const SplashScreen()),
          GetPage(name: '/login', page: () => const LoginScreen()),
          GetPage(name: '/home', page: () => const HomeScreen()),
          GetPage(name: '/register', page: () => const RegisterScreen())
        ]);
  }
}
