import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:african_ap/Controllers/LoginController.dart';
import 'package:african_ap/Controllers/SingInWith.dart';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Models/User.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Auth/ChangePassWord.dart';
import 'package:african_ap/Vue/Auth/Inscription.dart';
import 'package:african_ap/Vue/LocalApp/Principal.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:african_ap/Vue/Widgets/BoutonC.dart';
import 'package:african_ap/Vue/Widgets/BoutonCusm.dart';
import 'package:african_ap/Vue/Widgets/ChangePage.dart';
import 'package:african_ap/Vue/Widgets/LoginTextField.dart';
import 'package:african_ap/Vue/Widgets/TextFieldC.dart';
import 'package:african_ap/Vue/Widgets/TxtFC.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class RecupOTP extends StatefulWidget {
  final int recupOTP;
  final String email;
  const RecupOTP({
    super.key,
    required this.recupOTP,
    required this.email,
  });
  @override
  State<RecupOTP> createState() => _RecupOTPState();
}

class _RecupOTPState extends State<RecupOTP> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  final _key = GlobalKey<FormState>();
  TextEditingController otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    ToastContext().init(context);
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("img/image_back.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        height: h / 8,
                        child: Image.asset("img/logo.png"),
                      ),
                    ],
                  ),
                  SizedBox(height: h / 45),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nous vous avons envoyé le code de récupétion sur votre mail",
                      // maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: w / 20),
                    ),
                  ),
                  SizedBox(height: h / 45),
                  Form(
                    key: _key,
                    child: Column(
                      children: [
                        TxtFc(
                          icon: Icons.security,
                          hintText: "Entrez le code envoyé",
                          Tcontroller: otp,
                          isNumber: true,
                          err: "Entrez le code envoyé",
                        ),
                        SizedBox(height: h / 50),
                        ButtonC(
                          text: "Valider",
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              int otpEnint = int.parse(otp.text);
                              if (otpEnint == widget.recupOTP) {
                                Toast.show("Code Vérifié");
                                ChangePage.SliderPush(
                                    context: context, push: ChangePassWord(email : widget.email));
                              } else {
                                Toast.show("Code invalide");
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: h / 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 0.4,
                        color: Colors.black54,
                        width: w / 4,
                      ),
                      Container(
                        child: Text(
                          "Connectez-vous avec",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Container(
                        height: 0.4,
                        color: Colors.black54,
                        width: w / 4,
                      ),
                    ],
                  ),
                  SizedBox(height: h / 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: h / 15,
                        width: w / 3,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.black54,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              child: Image.asset("img/google_logo.webp"),
                            ),
                            Text("Google"),
                          ],
                        )),
                      ),
                    ],
                  ),
                  SizedBox(height: h / 45),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nouveau chez AP ?  "),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Inscription(),
                      ));
                },
                child: Text(
                  "Créez un compte",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppData.BasicColorNew,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
