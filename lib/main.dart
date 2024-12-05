import 'package:flutter/material.dart';
import 'package:motion_week_2/pages/home_page.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login_page',
      routes: {
        '/login_page': (context) => const LoginPage(),
        '/register_page': (context) => const RegisterPage(),
        '/home_page': (context) => const HomePage(),
      },
    );
  }
}
