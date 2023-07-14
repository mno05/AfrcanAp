import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Services/dbServices.dart';
import 'package:african_ap/Vue/LocalApp/Principal.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class SuperUserServices {
  static becomeSuperUser(
      {required UserM superUser, required BuildContext context}) async {
    BasicsWidgets.Load(context);
    await dbServices().UpdateUserDamandeAdh(superUser).then((_) {
      setValue(AppData.demandeAdh, true);
      Navigator.pop(context);
      toast("Votre demande d'adhésion a été envoyé",
          textColor: CupertinoColors.white);
      Get.off(() => Principal());
    });
    // dbServices().UserGet(superUser.Uid).then((docS) async {
    //   UserM u = UserM.fromFirestor(docS);
    //   await SaveSuperUser.Sauvegarde(user: u);
    //   BasicsWidgets.Done(context);
    //   Get.off(()=>Principal());
    // });
    // final doc = await ref.get();
    // final sup = doc.data();
    // log(sup.toString());
  }

  static Adhesion({
    required adresse,
    required codePostal,
    required Localite,
    required autreStatut,
    required prenom,
    required nom,
    required paysOrgine,
    required SelectedItem,
    required datevalue,
    required pays,
    required telephone,
    required adresseMail,
    required fonction,
    required domainesExpertise,
    required checkboxValue,
    required BuildContext context,
    required userId,
    required userimageName,
  }) {
    // log("dlskjfffffffffffffffffffffffffffffff");
    String adr, code, local;
    // aute;
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
    // if (autreStatut.text.isEmpty) {
    //   aute = "vide";
    // } else {
    //   aute = autreStatut.text;
    // }
    if (prenom.text.isNotEmpty &&
        nom.text.isNotEmpty &&
        paysOrgine.text.isNotEmpty &&
        SelectedItem != "Statut professionnel*" &&
        datevalue.isNotEmpty &&
        pays.text.isNotEmpty &&
        telephone.text.isNotEmpty &&
        adresseMail.text.isNotEmpty &&
        fonction.text.isNotEmpty &&
        domainesExpertise.text.isNotEmpty &&
        checkboxValue) {
      // late String tp;
      Save(tp) {
        becomeSuperUser(
            context: context,
            superUser: UserM(
              isLambda: false,
              Uid: userId,
              prenom: prenom.text,
              nom: nom.text,
              paysOrgine: paysOrgine.text,
              adresse: adr,
              codePostal: code,
              localite: local,
              pays: pays.text,
              telephone: telephone.text,
              adresseMail: adresseMail.text,
              type: tp,
              statutpro:
                  SelectedItem == "Autre" ? autreStatut.text : SelectedItem,
              fonction: fonction.text,
              domainesExpertise: domainesExpertise.text,
              imagePath: userimageName,
              dateAdhesion: datevalue,
            ));
      }

      BasicsWidgets.ThreeActions(
        "J'adhére en tant que Membre?",
        context,
        Titre: "Mode d'adhésion",
        YesText: "Adhérent",
        YesPressed: () {
          Save("Adhérent");
        },
        NoText: "Effectif",
        NonPressed: () {
          Save("Effectif");
        },
        CancelText: "D'honneur",
        CancelPressed: () {
          Save("Honneur");
        },
      );
    } else {
      toast(
          "Veuillez renseigner tous les champs obligatoires et cocher la case");
    }
  }
}
