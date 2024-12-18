import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_week_2/pages/cart_page.dart';
import 'package:motion_week_2/pages/home_page.dart';
import 'package:motion_week_2/pages/invoice_page.dart';
import 'package:motion_week_2/pages/login_page.dart';
import 'package:motion_week_2/pages/register_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login_page',
      getPages: [
        GetPage(name: '/login_page', page: () => const LoginPage()),
        GetPage(name: '/register_page', page: () => const RegisterPage()),
        GetPage(name: '/home_page', page: () => const HomePage()),
        GetPage(name: '/cart_page', page: () => const CartPage()),
        GetPage(name: '/invoice_page', page: () => const InvoicePage()),
      ],
    );
  }
}
