import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Widgets/BoutonCusm.dart';
import 'package:african_ap/Vue/Widgets/ImageProfil.dart';
import 'package:african_ap/Vue/Widgets/InscriptionTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  @override
  Widget build(BuildContext context) {
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
                    ImageProfil(),
                    SizedBox(
                      height: Media.height(context) * 0.03,
                    ),
                    InscriptionTf(hintText: "Prenom"),
                    InscriptionTf(hintText: "Nom"),
                    InscriptionTf(hintText: "Adresse E-mail"),
                    InscriptionTf(
                      hintText: "Téléphone",
                      isNumber: true,
                    ),
                    InscriptionTf(hintText: "Mot de passe"),
                    InscriptionTf(hintText: "Confirmation mot de passe"),
                    ButtonCusm(text: 'Inscription', onPressed: () {})
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
