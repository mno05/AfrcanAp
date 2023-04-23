import 'package:african_ap/Controllers/MessageController.dart';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Models/Message.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/LocalApp/Message.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:african_ap/Vue/Widgets/BoutonC.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPersoView extends StatefulWidget {
  final idEx;
  final SuperUser superUser;
  const ContactPersoView({
    super.key,
    required this.superUser,
    required this.idEx,
  });

  @override
  State<ContactPersoView> createState() => _ContactPersoViewState();
}

class _ContactPersoViewState extends State<ContactPersoView> {
  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
        backgroundColor: AppData.BasicColor,
      ),
      body: Container(
        height: h,
        width: w,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.superUser.imagePath),
                    radius: h / 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    "${widget.superUser.prenom} ${widget.superUser.nom}",
                    style: GoogleFonts.nunito(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                      "Membre ${widget.superUser.type!="Honneur"?widget.superUser.type!="Effectif"?widget.superUser.type!="Adherent"?widget.superUser.type:"adhérent":"effectif":"d'honneur"}",

                    // "Membre ${widget.superUser.type!="Honneur"?widget.superUser.type:"d'"+widget.superUser.type}",
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "${widget.superUser.adresseMail}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                infoBulle(
                  height: h,
                  width: w,
                  type: "Pays d'origine",
                  value: widget.superUser.paysOrgine,
                ),
                infoBulle(
                  height: h,
                  width: w,
                  type: "Adresse physique",
                  value: widget.superUser.adresse,
                ),
                infoBulle(
                  height: h,
                  width: w,
                  type: "Code Postal",
                  value: widget.superUser.codePostal,
                ),
                infoBulle(
                  height: h,
                  width: w,
                  type: "Localité",
                  value: widget.superUser.paysOrgine,
                ),
                infoBulle(
                  height: h,
                  width: w,
                  type: "Pays",
                  value: widget.superUser.pays,
                ),
                infoBulle(
                  height: h,
                  width: w,
                  type: "Statut pro",
                  value: widget.superUser.statutpro,
                ),
                infoBulle(
                  height: h,
                  width: w,
                  type: "Fonction",
                  value: widget.superUser.fonction,
                ),
                infoBulle(
                  height: h,
                  width: w,
                  type: "Domaines d'exp.",
                  value: widget.superUser.domainesExpertise,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ButtonC(
                    text: "Contacter",
                    onPressed: () {
                      BasicsWidgets.YesOrNoDialogue(
                        msg:
                            "Envoyer une demande de discussion à ${widget.superUser.prenom} ${widget.superUser.nom} ?",
                        context: context,
                        Titre: "Demande de Discussion",
                        YesText: "Oui",
                        NoText: "Non",
                        NonPressed: () => Navigator.pop(context),
                        YesPressed: () {
                          MessageController.Envoyer(
                              context,
                              Messages(
                                  idMessage: "",
                                  idEx: widget.idEx,
                                  idDes: widget.superUser.idSuper!,
                                  text:
                                      "Le membre ${widget.superUser.prenom} ${widget.superUser.nom} souhaite vous contacter.\nRépondez lui pour continuer",
                                  dateTime: DateTime.now()));
                        },
                      );
                    },
                  ),
                )
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
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                fontSize: width*.035,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${value}",
              maxLines: 3,
              style: GoogleFonts.nunito(
                fontSize: width*.035,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
