import 'dart:convert';

import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Auth/Inscription.dart';
import 'package:african_ap/Vue/LocalApp/Principal.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:african_ap/Vue/Widgets/BoutonCusm.dart';
import 'package:african_ap/Vue/Widgets/LoginTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class LoginVue extends StatefulWidget {
  const LoginVue({super.key});

  @override
  State<LoginVue> createState() => _LoginVueState();
}

class _LoginVueState extends State<LoginVue> {
  final _key = GlobalKey<FormState>();
  TextEditingController emailTelephone = TextEditingController();
  TextEditingController passW = TextEditingController();

  void Login(BuildContext context,String Email_phoneNumber, String motDepasse) async {
    //localhost http://10.0.2.2/African_Ap/login.php/
        BasicsWidgets.Load(context);
    final reponse = await http.post(
        Uri.parse("https://africanap.000webhostapp.com/african_ap/login.php/"),
        body: {"email_telephone": Email_phoneNumber, "passw": motDepasse});
    if (reponse.statusCode == 200) {
      
      try {
        String rs = reponse.body.toString().replaceAll("\n", "");
        var data = jsonDecode(rs);
        var resultat = data["data"];
        var user = resultat[2];
        int succes = resultat[1];
        if(succes==1){
        // print(user["email"]);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Principal(prenom: user["Prenom"], nom: user["nom"], telephone: user["telephone"], email: user["email"], img: user["image"]),));
        }else{
          Navigator.pop(context);
          Toast.show(resultat[0],duration: 3);
        }
        print(succes);
      } catch (e) {
        Navigator.pop(context);
          Toast.show(e.toString(),duration: 3);
        print(e);

      }
    //   var data = jsonDecode(reponse.body);
    //   print(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      
      backgroundColor: Color(0xffEB7D30),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 25, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                CupertinoIcons.arrowshape_turn_up_left,
                size: 35,
                color: Colors.white,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 45,
                    child: Text("LOGO"),
                  ),
                  SizedBox(height: Media.height(context) * 0.03),
                  Text(
                    "Navigation flow",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
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
                            err: "Veuilez entrer un email ou un numéro svp",
                          ),
                          SizedBox(
                            height: Media.height(context) * 0.02,
                          ),
                          LoginTf(
                            Tcontroller: passW,
                            hintText: "Mot de passe",
                            err: "Vous devez entrer un mot de passe",
                            isPassW: true,
                          ),
                          SizedBox(height: Media.height(context) * 0.03),
                          ButtonCusm(
                            text: "Connexion",
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                // BasicsWidgets.Load(context);
                                Login(context,emailTelephone.text, passW.text);
                              }
                            },
                          ),
                          SizedBox(height: Media.height(context) * 0.02),
                          ButtonCusm(
                            text: "Inscrription",
                            onPressed: () {
                              Navigator.push(
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
    );
  }
}
