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
import 'package:google_fonts/google_fonts.dart';
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
  TextEditingController autreStatut = TextEditingController(text: "n");
  TextEditingController domainesExpertise = TextEditingController();

  List<String> itmes = [
    "Employé(e)",
    "Indépendant(e)",
    "Etudiant(e)",
    "Autre",
  ];

  DateTime date = DateTime.now();
  bool selectedDate = false;
  String datevalue = "";

  String SelectedItem = "Statut professionnel*";
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
                "Obligatoires *",
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
              Container(
                padding: EdgeInsets.only(left: 15),
                width: w * 0.8,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: SelectedItem,
                    hintMaxLines: 1,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  items: itmes
                      .map((e) =>
                          DropdownMenuItem<String>(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (str) => setState(() => SelectedItem = str!),
                ),
              ),
              SizedBox(height: h * 0.01),
              SelectedItem == "Autre"
                  ? TextFildC(
                      hintText: "Si autre, lequel", Tcontroller: autreStatut)
                  : Container(),
              SizedBox(height: SelectedItem == "Autre" ? h * 0.01 : 0),
              TextFildC(hintText: "Fonction *", Tcontroller: fonction),
              SizedBox(height: h * 0.01),
              TextFildC(
                  hintText: "Domaine d'experse *",
                  Tcontroller: domainesExpertise),
              SizedBox(height: h * 0.01),
              InkWell(
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  width: w * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 14.0, bottom: 14.0, left: 0),
                    child: Text(
                      selectedDate ? datevalue : "Date d'adhésion*",
                      style: TextStyle(
                        fontSize: 16,
                        color: selectedDate ? Colors.black : Colors.black54,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  showDatePicker(
                          helpText: "Heure",
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1990),
                          lastDate: DateTime(2024))
                      .then((value) {
                    setState(() {
                      date = value!;
                      selectedDate = true;
                      datevalue = "${date.day}/${date.month}/${date.year}";
                    });
                  });
                },
              ),
              SizedBox(height: h * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    width: w * .8,
                    child: Text(
                      "Je confirme avoir pris connaissance et m’engage à respecter le Règlement d’Ordre Intérieur de l’A.S.B.L African Professionals *",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ],
              ),
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
                      SelectedItem != "Statut professionnel*" &&
                      datevalue.isNotEmpty &&
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
                            statutpro: SelectedItem == "Autre"
                                ? autreStatut.text
                                : SelectedItem,
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
                                statutpro: SelectedItem == "Autre"
                                    ? autreStatut.text
                                    : SelectedItem,
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
                              statutpro: SelectedItem == "Autre"
                                  ? autreStatut.text
                                  : SelectedItem,
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
