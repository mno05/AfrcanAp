import 'dart:convert';
import 'dart:io';

import 'package:african_ap/Controllers/LoginController.dart';
import 'package:african_ap/Controllers/SingInWith.dart';
import 'package:african_ap/Models/User.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Auth/Inscription.dart';
import 'package:african_ap/Vue/LocalApp/Principal.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:african_ap/Vue/Widgets/BoutonCusm.dart';
import 'package:african_ap/Vue/Widgets/LoginTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class LoginVue extends StatefulWidget {
  const LoginVue({super.key});
  @override
  State<LoginVue> createState() => _LoginVueState();
}

class _LoginVueState extends State<LoginVue> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  final _key = GlobalKey<FormState>();
  TextEditingController emailTelephone = TextEditingController();
  TextEditingController passW = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: Color(0xffEB7D30),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 25, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 45,
                      child: Image.asset("img/logo.png"),
                    ),
                    SizedBox(height: Media.height(context) * 0.03),
                    SizedBox(height: Media.height(context) * 0.03),
                    Container(
                      height: Media.height(context) * 0.6,
                      width: Media.width(context),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Form(
                        key: _key,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LoginTf(
                              Tcontroller: emailTelephone,
                              hintText: "Email/Téléphone",
                              err: "Veuillez entrer un e-mail ou téléphone SVP",
                            ),
                            SizedBox(
                              height: Media.height(context) * 0.02,
                            ),
                            LoginTf(
                              Tcontroller: passW,
                              hintText: "Mot de passe",
                              err: "Veuillez mettre un mot de passe",
                              isPassW: true,
                            ),
                            SizedBox(height: Media.height(context) * 0.03),
                            Container(
                              padding: EdgeInsets.all(2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      SignWith.google();
                                    },
                                    // icon: Image.asset('img/google_logo.webp'),
                                    icon: Icon(FontAwesomeIcons.google,size: 40,),

                                    iconSize: 55,
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                    icon: Icon(FontAwesomeIcons.facebook),

                                      // icon: Icon(Icons.facebook,
                                      //     color: Colors.blue),
                                      iconSize: 50),
                                  IconButton(
                                    onPressed: () {},
                                    // icon: Image.asset('img/linkedin.png'),
                                    icon: Icon(FontAwesomeIcons.linkedinIn),
                                    iconSize: 47,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: Media.height(context) * 0.03),
                            ButtonCusm(
                              text: "Connexion",
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  LoginController.UserLogin(
                                    context,
                                    User(
                                      prenom: "",
                                      nom: "",
                                      telephone: "",
                                      email: emailTelephone.text,
                                      passw: passW.text,
                                      imageName: "",
                                      imageData: File(""),
                                    ),
                                  );
                                }
                              },
                            ),
                            SizedBox(height: Media.height(context) * 0.02),
                            ButtonCusm(
                              text: "Inscription",
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Inscription(),
                                    ));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
