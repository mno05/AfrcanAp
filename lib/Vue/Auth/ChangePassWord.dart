import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:african_ap/Controllers/LoginController.dart';
import 'package:african_ap/Controllers/SingInWith.dart';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Models/User.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Auth/Inscription.dart';
import 'package:african_ap/Vue/Auth/LoginVue.dart';
import 'package:african_ap/Vue/Auth/RecupOTP.dart';
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

class ChangePassWord extends StatefulWidget {
  final email;
  const ChangePassWord({
    super.key,
    required this.email,
  });
  @override
  State<ChangePassWord> createState() => _ChangePassWordState();
}

class _ChangePassWordState extends State<ChangePassWord> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  final _key = GlobalKey<FormState>();
  TextEditingController passW = TextEditingController();
  TextEditingController ConfpassW = TextEditingController();
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
                      "Entrez le nouveau mot de passe",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: w / 15),
                    ),
                  ),
                  Form(
                    key: _key,
                    child: Column(
                      children: [
                        TxtFc(
                          hintText: "Entrez le nouveau mot de passe",
                          Tcontroller: passW,
                          isPassW: true,
                          icon: Icons.lock,
                          err: "Entrez le nouveau mot de passe",
                        ),
                        SizedBox(height: h / 50),
                        TxtFc(
                          icon: Icons.lock,
                          hintText: "Confirmez le nouveau mot de passe",
                          Tcontroller: ConfpassW,
                          err: "Confirmez le nouveau mot de passe",
                          isPassW: true,
                        ),
                        SizedBox(height: h / 50),
                        ButtonC(
                          text: "Valider",
                          onPressed: () async {
                            if (_key.currentState!.validate()) {
                              BasicsWidgets.Load(context);
                              if (passW.text != ConfpassW.text) {
                                Toast.show(
                                    "La confiramtion du mot de passe ne conrespond pas au mot de passe");
                              } else {
                                final reponse = await http.post(
                                    Uri.parse(
                                        "https://myap.moglich.net/api/UpdatePassWord.php/"),
                                    body: {"email": widget.email,"passW":passW.text});
                                if (reponse.statusCode == 200) {
                                  // String rs = reponse.body
                                  //     .toString()
                                  //     .replaceAll("\n", "");
                                  // var data = jsonDecode(rs);
                                  // var resultat = data["data"];
                                  // int recupOtp = resultat[1];
                                  // String succes = resultat[0];
                                  Toast.show("Mot de passe modifié");
                                  ChangePage.SliderPush(
                                      context: context, push: LoginVue());
                                }
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Container(
                  //       height: h / 15,
                  //       width: w / 3,
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           width: 1,
                  //           color: Colors.black54,
                  //         ),
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //       child: Center(
                  //           child: Row(
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Container(
                  //             height: 40,
                  //             width: 40,
                  //             child: Image.asset("img/google_logo.webp"),
                  //           ),
                  //           Text("Google"),
                  //         ],
                  //       )),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: h / 45),
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
