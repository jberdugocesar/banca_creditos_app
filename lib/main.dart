import 'package:banca_creditos_app/domain/repositories/credit_repository.dart';
import 'package:banca_creditos_app/domain/repositories/user_repository.dart';
import 'package:banca_creditos_app/firebase_options.dart';
import 'package:banca_creditos_app/ui/bottom_navbar.dart';
import 'package:banca_creditos_app/ui/controllers/auth_controller.dart';
import 'package:banca_creditos_app/ui/controllers/credit_controller.dart';
import 'package:banca_creditos_app/ui/controllers/user_controller.dart';
import 'package:banca_creditos_app/ui/pages/home_page.dart';
import 'package:banca_creditos_app/ui/pages/login.dart';
import 'package:banca_creditos_app/ui/pages/register.dart';
import 'package:banca_creditos_app/ui/pages/start_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

void main() async {
  Loggy.initLoggy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthenticationController());
  //Get.put(CreditRepository());
  //Get.put(UserRepository());
  Get.put(UserController());
  Get.put(CreditController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => const StartPage()),
        GetPage(name: "/login", page: () => const LoginPage()),
        GetPage(name: "/register", page: () => const RegisterPage()),
        GetPage(name: "/homepage", page: () => const BottomNavBar())
      ],
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
