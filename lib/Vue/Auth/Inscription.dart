import 'dart:convert';
import 'dart:math';

import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:african_ap/Vue/Widgets/BoutonCusm.dart';
import 'package:african_ap/Vue/Widgets/ImageProfil.dart';
import 'package:african_ap/Vue/Widgets/InscriptionTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:toast/toast.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  TextEditingController prenom = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController email = TextEditingController();
  late PhoneNumber telephone;
  TextEditingController passw = TextEditingController();
  TextEditingController conPassW = TextEditingController();
  final _key = GlobalKey<FormState>();
  ImageProfil img = ImageProfil();

//Inscription Méthode

  void Inscription(
    String prenom,
    String nom,
    String telephone,
    String email,
    String passw,
    String image,
  ) async {
    final Response = await http
        .post(Uri.parse("http://10.0.2.2/African_Ap/inscription.php/"), body: {
      "prenom": prenom,
      "nom": nom,
      "telephone": telephone,
      "email": email,
      "passw": passw,
      "image": image,
    });
    if (Response.statusCode == 200) {
      try {
        BasicsWidgets.Load(context);
        String rs = Response.body.toString().replaceAll("\n", "");
        var data = jsonDecode(rs);
        var resultat = data["data"];
        int succes = resultat[1];
        if(succes==1){
          //Passer à Main
        }else{
          Navigator.pop(context);
          Toast.show(resultat[0],duration: 3);
        }
        print(succes);
      } catch (e) {
        print(e);

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    double h = Media.height(context);
    return Scaffold(
      backgroundColor: Color(0xffEB7D30),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Création de compte",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: Media.height(context) * 0.03,
                    ),
                    img,
                    SizedBox(
                      height: Media.height(context) * 0.03,
                    ),
                    Form(
                      key: _key,
                      child: Column(
                        children: [
                          InscriptionTf(
                            hintText: "Prenom",
                            Tcontroller: prenom,
                            err: "Veuillez renseigner votre prenom",
                          ),
                          InscriptionTf(
                            hintText: "Nom",
                            Tcontroller: nom,
                            err: "Veuillez renseigner votre nom",
                          ),
                          InscriptionTf(
                            hintText: "Adresse E-mail",
                            Tcontroller: email,
                            err: "Veuillez renseigner votre email",
                            isEmail: true,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 8),
                              margin: EdgeInsets.only(bottom: 6),
                              width: Media.width(context) * 0.7,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: InternationalPhoneNumberInput(
                                onInputChanged: (value) {
                                  telephone = value;
                                },
                                textStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                inputBorder: InputBorder.none,
                                cursorColor: Colors.white,
                                formatInput: false,
                                selectorConfig: SelectorConfig(
                                  selectorType:
                                      PhoneInputSelectorType.BOTTOM_SHEET,
                                ),
                                inputDecoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Téléphone",
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                          InscriptionTf(
                            hintText: "Mot de passe",
                            Tcontroller: passw,
                            err: "Veuillez renseigner un mot de passe",
                            isPassW: true,
                          ),
                          InscriptionTf(
                            hintText: "Confirmation mot de passe",
                            Tcontroller: conPassW,
                            err: "Confirme le mot de passe",
                            isPassW: true,
                          ),
                          ButtonCusm(
                              text: 'Inscription',
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  if(passw.text==conPassW.text){
                                  Inscription(
                                      prenom.text,
                                      nom.text,
                                      email.text,
                                      telephone.phoneNumber!,
                                      passw.text,
                                      "img");
                                  }else{
                                    Toast.show("Le mot de passe diffère sa confirmation",duration: 3);
                                  }
                                }
                              }),
                        ],
                      ),
                    )
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
