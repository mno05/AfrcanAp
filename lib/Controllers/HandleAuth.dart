import 'package:african_ap/Vue/Auth/LoginVue.dart';
import 'package:african_ap/Vue/IntroductionScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HandleAuth extends StatelessWidget {
  const HandleAuth({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return const LoginVue();
        } else {
          return const IntroductionS();
        }
      }),
      stream: FirebaseAuth.instance.authStateChanges());
  }
}