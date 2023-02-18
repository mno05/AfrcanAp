import 'dart:developer';

import 'package:african_ap/Controllers/SuperUserController.dart';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Models/User.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:african_ap/Vue/Widgets/BoutonCusm.dart';
import 'package:african_ap/Vue/Widgets/InscriptionTextField.dart';
import 'package:african_ap/Vue/Widgets/LoginTextField.dart';
import 'package:african_ap/Vue/Widgets/TextFieldC.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class FormAdh extends StatefulWidget {
  final User user;
  const FormAdh({super.key, required this.user});

  @override
  State<FormAdh> createState() => _FormAdhState();
}

class _FormAdhState extends State<FormAdh> {
  TextEditingController prenom = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController paysOrgine = TextEditingController();
  TextEditingController adresse = TextEditingController(text: "n");
  TextEditingController codePostal = TextEditingController(text: "n");
  TextEditingController Localite = TextEditingController(text: "n");
  TextEditingController pays = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController adresseMail = TextEditingController();
  TextEditingController fonction = TextEditingController();
  TextEditingController statutpro = TextEditingController();
  TextEditingController autreStatut = TextEditingController(text: "n");
  TextEditingController domainesExpertise = TextEditingController();

  @override
  void initState() {
    prenom.text = widget.user.prenom;
    nom.text = widget.user.nom;
    telephone.text = widget.user.telephone;
    adresseMail.text = widget.user.email;

    adresse.text = "";
    codePostal.text = "";
    Localite.text = "";
    autreStatut.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulaire d'adhésion"),
        backgroundColor: AppData.BasicColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: h * 0.02),
              Text(
                "Les champs marqués d'un * sont obligatoires",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: h * 0.02),
              TextFildC(hintText: "Prenom *", Tcontroller: prenom),
              SizedBox(height: h * 0.01),
              TextFildC(hintText: "Nom *", Tcontroller: nom),
              SizedBox(height: h * 0.01),
              TextFildC(hintText: "Pays d'origine *", Tcontroller: paysOrgine),
              SizedBox(height: h * 0.01),
              TextFildC(hintText: "Adresse", Tcontroller: adresse),
              SizedBox(height: h * 0.01),
              TextFildC(hintText: "Code postal", Tcontroller: codePostal),
              SizedBox(height: h * 0.01),
              TextFildC(hintText: "Localité", Tcontroller: Localite),
              SizedBox(height: h * 0.01),
              TextFildC(hintText: "Pays *", Tcontroller: pays),
              SizedBox(height: h * 0.01),
              TextFildC(
                  hintText: "Telephone *",
                  Tcontroller: telephone,
                  isNumber: true),
              SizedBox(height: h * 0.01),
              TextFildC(hintText: "Adresse mail *", Tcontroller: adresseMail),
              SizedBox(height: h * 0.01),
              TextFildC(
                  hintText: "Statut professionnel *", Tcontroller: statutpro),
              SizedBox(height: h * 0.01),
              TextFildC(hintText: "Si autre, lequel", Tcontroller: autreStatut),
              SizedBox(height: h * 0.01),
              TextFildC(hintText: "Fonction *", Tcontroller: fonction),
              SizedBox(height: h * 0.01),
              TextFildC(
                  hintText: "Domaine(s) d'experse(s) *",
                  Tcontroller: domainesExpertise),
              SizedBox(height: h * 0.02),
              ElevatedButton(
                onPressed: () {
                  String adr, code, local, aute;
                  if (adresse.text.isEmpty) {
                    adr = "vide";
                  } else {
                    adr = adresse.text;
                  }
                  if (codePostal.text.isEmpty) {
                    code = "vide";
                  } else {
                    code = codePostal.text;
                  }
                  if (Localite.text.isEmpty) {
                    local = "vide";
                  } else {
                    local = Localite.text;
                  }
                  if (autreStatut.text.isEmpty) {
                    aute = "vide";
                  } else {
                    aute = autreStatut.text;
                  }
                  if (prenom.text.isNotEmpty &&
                      nom.text.isNotEmpty &&
                      paysOrgine.text.isNotEmpty &&
                      pays.text.isNotEmpty &&
                      telephone.text.isNotEmpty &&
                      adresseMail.text.isNotEmpty &&
                      fonction.text.isNotEmpty &&
                      domainesExpertise.text.isNotEmpty) {
                    BasicsWidgets.ThreeActions(
                      "J'adhére en tant que Membre?",
                      context,
                      Titre: "Mode d'adhésion",
                      YesText: "Adhérent",
                      YesPressed: () {
                        log(Localite.text);
                        SuperUser superUser = SuperUser(
                            idSuper: "vide",
                            mtp: widget.user.passw,
                            prenom: prenom.text,
                            nom: nom.text,
                            paysOrgine: paysOrgine.text,
                            adresse: adr,
                            codePostal: code,
                            localite: local,
                            pays: pays.text,
                            telephone: telephone.text,
                            adresseMail: adresseMail.text,
                            type: "Adherent",
                            statutpro: statutpro.text,
                            autreStatut: aute,
                            fonction: fonction.text,
                            domainesExpertise: domainesExpertise.text,
                            imagePath: widget.user.imageName);
                        SuperUserController.Inscription(context, superUser);
                      },
                      NoText: "Effectif",
                      NonPressed: () {
                        SuperUserController.Inscription(
                            context,
                            SuperUser(
                                idSuper: "vide",
                                mtp: widget.user.passw,
                                prenom: prenom.text,
                                nom: nom.text,
                                paysOrgine: paysOrgine.text,
                                adresse: adr,
                                codePostal: code,
                                localite: local,
                                pays: pays.text,
                                telephone: telephone.text,
                                adresseMail: adresseMail.text,
                                type: "Effectif",
                                statutpro: statutpro.text,
                                autreStatut: aute,
                                fonction: fonction.text,
                                domainesExpertise: domainesExpertise.text,
                                imagePath: widget.user.imageName));
                      },
                      CancelText: "D'honneur",
                      CancelPressed: () {
                        SuperUserController.Inscription(
                          context,
                          SuperUser(
                              idSuper: "vide",
                              mtp: widget.user.passw,
                              prenom: prenom.text,
                              nom: nom.text,
                              paysOrgine: paysOrgine.text,
                              adresse: adr,
                              codePostal: code,
                              localite: local,
                              pays: pays.text,
                              telephone: telephone.text,
                              adresseMail: adresseMail.text,
                              type: "Honneur",
                              statutpro: statutpro.text,
                              autreStatut: aute,
                              fonction: fonction.text,
                              domainesExpertise: domainesExpertise.text,
                              imagePath: widget.user.imageName),
                        );
                      },
                    );
                  } else {
                    Toast.show(
                        "Veuillez renseigner tous les champs obligatoires");
                  }
                },
                child: Text("Adhérer"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppData.BasicColor)),
              ),
              SizedBox(height: h * 0.02),
            ]),
          ),
        ),
      ),
    );
  }
}
