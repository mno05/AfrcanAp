import 'dart:convert';
import 'dart:io';

import 'package:african_ap/Controllers/MessageController.dart';
import 'package:african_ap/Controllers/UpdateController.dart';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Models/Message.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Models/User.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/LocalApp/Message.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:african_ap/Vue/Widgets/BoutonC.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class ProfileModif extends StatefulWidget {
  final SuperUser? superUser;
  final User? user;

  const ProfileModif({
    super.key,
    this.superUser,
    this.user,
  });

  @override
  State<ProfileModif> createState() => _ProfileModifState();
}

class _ProfileModifState extends State<ProfileModif> {
  late TextEditingController prenom;
  late TextEditingController nom;
  late TextEditingController noms;
  late TextEditingController paysOrgine;
  late TextEditingController adresse;
  late TextEditingController codePostal;
  late TextEditingController Localite;
  late TextEditingController pays;
  late TextEditingController fonction;
  late TextEditingController domainesExpertise;
  late TextEditingController statutpro;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prenom = TextEditingController(
      text: widget.superUser!.prenom,
    );
    nom = TextEditingController(
      text: widget.superUser!.nom,
    );
    noms = TextEditingController(
      text: "${widget.superUser!.prenom} ${widget.superUser!.nom}",
    );
    paysOrgine = TextEditingController(
      text: widget.superUser!.paysOrgine,
    );
    adresse = TextEditingController(
      text: widget.superUser!.adresse,
    );
    codePostal = TextEditingController(
      text: widget.superUser!.codePostal,
    );
    Localite = TextEditingController(
      text: widget.superUser!.localite,
    );
    pays = TextEditingController(
      text: widget.superUser!.pays,
    );
    fonction = TextEditingController(
      text: widget.superUser!.fonction,
    );
    statutpro = TextEditingController(
      text: widget.superUser!.statutpro,
    );
    domainesExpertise = TextEditingController(
      text: widget.superUser!.domainesExpertise,
    );
  }

  XFile? _imageFile;
  ImagePicker _imagePicker = ImagePicker();
  late String imgdata;
  String imgName = "";
  File img = File("");
  takePhoto(ImageSource source) async {
    final pickedfile = await _imagePicker.pickImage(source: source);
    setState(() {
      _imageFile = pickedfile;
      img = File(_imageFile!.path);
      imgName = _imageFile!.path.split("/").last;
      imgdata = base64Encode(img.readAsBytesSync());
    });
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    double h = Media.height(context);
    double w = Media.width(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon Profile"),
        backgroundColor: AppData.BasicColor,
      ),
      body: Container(
        height: h,
        width: w,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.user == null
                    ? Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ImageProfil()),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    BasicsWidgets.BoitInfo(context, noms, () {
                                      setState(() {
                                        prenom.text =
                                            noms.text.split(" ").first;
                                        nom.text = noms.text.split(" ")[1];
                                      });
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    "${prenom.text} ${nom.text}",
                                    style: GoogleFonts.nunito(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Icon(
                                  Icons.edit,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Membre ${widget.superUser!.type != "Honneur" ? widget.superUser!.type : "d'" + widget.superUser!.type}",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                // Icon(Icons.edit),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "${widget.superUser!.adresseMail}",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          infoBulle(
                              height: h,
                              width: w,
                              type: "Pays d'origine",
                              // value: widget.superUser!.paysOrgine,
                              value: paysOrgine),
                          infoBulle(
                            height: h,
                            width: w,
                            type: "Adresse physique",
                            value: adresse,
                          ),
                          infoBulle(
                            height: h,
                            width: w,
                            type: "Code Postal",
                            value: codePostal,
                          ),
                          infoBulle(
                            height: h,
                            width: w,
                            type: "Localité",
                            value: Localite,
                          ),
                          infoBulle(
                            height: h,
                            width: w,
                            type: "Pays",
                            value: pays,
                          ),
                          infoBulle(
                            height: h,
                            width: w,
                            type: "Statut pro",
                            value: statutpro,
                          ),
                          infoBulle(
                            height: h,
                            width: w,
                            type: "Fonction",
                            value: fonction,
                          ),
                          infoBulle(
                            height: h,
                            width: w,
                            type: "Domaines d'exp.",
                            value: domainesExpertise,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ButtonC(
                              text: "Valider",
                              onPressed: () {
                                UpdateController.UpdateSuperUser(context: context, superUser: SuperUser(prenom: prenom.text, nom: nom.text, paysOrgine: paysOrgine.text, adresse: adresse.text, codePostal: codePostal.text, localite: Localite.text, pays: pays.text, telephone: " ", adresseMail: widget.superUser!.adresseMail, type: " ", statutpro: statutpro.text, autreStatut: " ", fonction: fonction.text, domainesExpertise: domainesExpertise.text, imagePath: " "), imageData: img, imageName: imgName);
                              },
                            ),
                          )
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoBulle({
    required double height,
    required double width,
    required String type,
    required TextEditingController value,
  }) {
    String v = value.text;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          BasicsWidgets.BoitInfo(context, value, () {
            setState(() {
              v = value.text;
            });
            Navigator.pop(context);
          });
        },
        child: Container(
          padding: EdgeInsets.all(height * .01),
          width: width / 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.lightBlue.shade300,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${type} : ",
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${v}",
                maxLines: 3,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.edit),
            ],
          ),
        ),
      ),
    );
  }

  Widget ImageProfil() {
    return Container(
      child: Stack(children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: Media.height(context) / 12,
          backgroundImage: _imageFile == null
              ? NetworkImage(widget.superUser!.imagePath)
              : FileImage(File(_imageFile!.path)) as ImageProvider,
        ),
        Positioned(
          bottom: 18.0,
          right: 12.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: (builder) => bottomSheet(context));
            },
            child: Icon(
              Icons.edit,
              color: Colors.lightBlue,
              size: 30.0,
            ),
          ),
        )
      ]),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100,
      width: Media.width(context),
      margin: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Text("Photo de Profil", style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                icon: Icon(
                  Icons.camera,
                  color: AppData.BasicColor,
                ),
                onPressed: () {
                  setState(() {
                    takePhoto(ImageSource.camera);
                  });
                  Navigator.pop(context);
                },
                label: Text(
                  "Caméra",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
              TextButton.icon(
                icon: Icon(
                  Icons.image,
                  color: AppData.BasicColor,
                ),
                onPressed: () {
                  setState(() {
                    takePhoto(ImageSource.gallery);
                  });
                  Navigator.pop(context);
                },
                label: Text(
                  "Galerie",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
