
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Data/Instantane.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Services/SuperUserServices.dart';
import 'package:african_ap/Vue/LocalApp/Principal.dart';
import 'package:african_ap/Vue/LocalApp/Roi&charte.dart';
import 'package:african_ap/Vue/Widgets/TextFieldC.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:toast/toast.dart';

class FormAdh extends StatefulWidget {
  final UserM user;
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
  String msgDemandeEnvoyee =
      "Vous avez déjà envoyé une demande d'adhésion\nVeuillez patienter le temps que cela soit approuvé";
  String msgDemandeAccpetee =
      "Vous avez déjà envoyé une demande d'adhésion\nEt elle a été acceptée";
  String msgDemandeRefusee =
      "Vous avez déjà envoyé une demande d'adhésion\nEt elle a été refusée";

  DateTime date = DateTime.now();
  bool selectedDate = false;
  String datevalue = "";
  String SelectedItem = "Statut professionnel*";
  bool checkboxValue = false;
  bool roiValue = false;

  @override
  void initState() {
    prenom.text = widget.user.prenom;
    nom.text = widget.user.nom;
    telephone.text =
        (widget.user.telephone == null) ? "" : widget.user.telephone!;
    adresseMail.text = widget.user.adresseMail;
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
    print(widget.user);
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulaire d'adhésion"),
        backgroundColor: AppData.BasicColor,
      ),
      body: getBoolAsync(AppData.demandeAdh)
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Instantane.getUser().isLambda
                          ? msgDemandeEnvoyee
                          : msgDemandeAccpetee,
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        Get.offAll(()=>Principal());
                      },
                      child: Text("Home"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppData.BasicColor)),
                    )
                  ],
                ),
              ),
            )
          : Padding(
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
                    TextFildC(
                        hintText: "Pays d'origine *", Tcontroller: paysOrgine),
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
                    TextFildC(
                        hintText: "Adresse mail *", Tcontroller: adresseMail),
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
                            .map((e) => DropdownMenuItem<String>(
                                value: e, child: Text(e)))
                            .toList(),
                        onChanged: (str) => setState(() => SelectedItem = str!),
                      ),
                    ),
                    SizedBox(height: h * 0.01),
                    SelectedItem == "Autre"
                        ? TextFildC(
                            hintText: "Si autre, lequel",
                            Tcontroller: autreStatut)
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
                          padding: const EdgeInsets.only(
                              top: 14.0, bottom: 14.0, left: 0),
                          child: Text(
                            selectedDate ? datevalue : "Date d'adhésion*",
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  selectedDate ? Colors.black : Colors.black54,
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
                            datevalue =
                                "${date.day}/${date.month}/${date.year}";
                          });
                        });
                      },
                    ),
                    SizedBox(height: h * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Checkbox(
                          value: checkboxValue,
                          onChanged: (value) {
                            setState(() {
                              checkboxValue = value!;
                            });
                          },
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
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Checkbox(
                          value: roiValue,
                          onChanged: (value) {
                            setState(() {
                              roiValue = value!;
                            });
                          },
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          width: w * .8,
                          child: Wrap(
                            children: [
                              Text(
                                "Je confirme d'avoir lu le R.O.I et la charte*",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () => Get.to(()=>RoiCharte()),
                                child: Text(
                                  "(Lire le R.O.I et la charte)",
                                  textAlign: TextAlign.start,
                                  
                                  style: GoogleFonts.nunito(
                                    color: Colors.blue,
                              
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                    SizedBox(height: h * 0.02),
                    ElevatedButton(
                      onPressed: () {
                        if (roiValue && checkboxValue) {
                        SuperUserServices.Adhesion(
                            adresse: adresse,
                            codePostal: codePostal,
                            Localite: Localite,
                            autreStatut: autreStatut,
                            prenom: prenom,
                            nom: nom,
                            paysOrgine: paysOrgine,
                            SelectedItem: SelectedItem,
                            datevalue: datevalue,
                            pays: pays,
                            telephone: telephone,
                            adresseMail: adresseMail,
                            fonction: fonction,
                            domainesExpertise: domainesExpertise,
                            checkboxValue: checkboxValue,
                            context: context,
                            userId: widget.user.Uid,
                            userimageName: widget.user.imagePath);
                        } else {
                          if (checkboxValue) {
                            toast("Veuillez cocher que vous avez lu le ROI et Charte"); 
                          } else {
                            toast("Veuillez cocher que vous avez pris connaissance du réglement d'ordre");
                          }
                        }
                        // log(widget.user.Uid!);
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
