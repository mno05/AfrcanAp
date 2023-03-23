import 'package:african_ap/Vue/Auth/LoginVue.dart';
import 'package:african_ap/Vue/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'African AP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.grey,
        inputDecorationTheme: InputDecorationTheme(
          iconColor: Colors.grey,
          focusColor: Colors.grey,
          
        )
      ),
      // home: Principal(email: "",img: "",nom: "",prenom: "",telephone: ""),
      home: SplashScreen(),
    );
  }
}
