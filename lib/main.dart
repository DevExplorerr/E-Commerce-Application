import '../controller/user_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../provider/favorite_provider.dart';
import '../pages/splash_screen.dart';

Future main() async {
  Get.put(UserController());

  // Fire Base Web
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDuTHnAiU5mwKfHiGNeDVEk5WVO3-Cj7Do",
            appId: "1:767405167817:web:b9386506efe616e1112918",
            messagingSenderId: "767405167817",
            projectId: "e-commerce-app-48d39"));
  } else {
    await Firebase.initializeApp();
  }
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FavoriteProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Glitz Mart",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const SplashScreen());
  }
}
