import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Data/AppData.dart';

class RoiCharte extends StatelessWidget {
  const RoiCharte({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppData.BasicColor,
        title: Text("Roi & Charte"),
      ),
      body: Container(
        height: Media.height(context),
        width: Media.width(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("img/roi.png"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Règlement d’ordre intérieur",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: Media.width(context) * .05,
                  ),
                ),
              ),
              RoiContainer(
                context,
                "Notre règlement d’ordre d’intérieur",
                "AP est un groupe de professionnels, ayant des origines africaines, dont le but est d’améliorer et soutenir l'expérience des africains de la diaspora par la mise en réseau (Network), les affaires (Business), le développement professionnel et l’engagement envers la Communauté (Community).\nL’Asbl entend promouvoir et faire partager les valeurs universelles de tolérance, de solidarité, de démocratie et de citoyenneté.\nElle est un espace de partage de savoir et de participation.\nLa prise de responsabilités, d’initiatives et de décisions y est possible.La règle d’or est le respect des autres, individuellement ou collectivement.\nChacun s’abstiendra de comportements, de paroles ou d’actes pouvant être considérés comme manquant de respect pour quiconque, même absent.\nLe réseau n’est PAS :\n➢ Un parti politique\n➢ Une organisation religieuse\n➢ Une institution gouvernementale\n➢ Un groupe dans lequel on poste ou fait suivre des blagues reçues des réseaux sociaux",
              ),
              RoiContainer(
                context,
                "Règles générales",
                "Le présent règlement est applicable en tout temps, son respect est de la responsabilité de l’ensemble des membres.",
              ),
              RoiContainer(context, "Rôle du Conseil d’administration",
                  "Le conseil d'administration a vocation à gérer les grandes orientations de l’asbl.\nIl est généralement l'organe compétent pour déterminer les choix stratégiques.\nIl gère toute question nécessaire au bon fonctionnement de l’asbl.\nIl contrôle et vérifie tous les points qu'il estime devoir surveiller.\nIl peut traiter des questions suivantes :\n- Préparation\n- Vote du budget\n- Organisation de l’élection des membres du conseil d’administration"),
              RoiContainer(context, "L’Assemblée Générale",
                  "Elle est composée de tous les membres effectifs et adhérents qui y ont un droit de vote. Ses attributionssont :\n«\nUne délibération de l'assemblée générale est requise pour :\n1° la modification des statuts ;\n2° la nomination et la révocation des administrateurs ;\n3° l'approbation des budgets et des comptes ;\n4° la dissolution de l’association ;\n5° l'exclusion d'un membre ;\n6° tous les cas où les statuts l'exigent.\n»"),
              RoiContainer(context, "Les membres",
                  "Il y a une distinction qui est faite entre deux types de membres :\n\n•Effectifs\n\t\t\t\to Se compose des membres du conseil d’administration\n\t\t\t\to Fréquence de réunion ;\n\t\t\t\t\t\t- Assemblée générale\n\t\t\t\t\t\t- Réunion du conseil d’administration\n\t\t\t\t\t\t- Autres réunions extraordinaires\n\n•Adhérents\n\t\t\t\to Ce sont les membres qui ont leurs droits et obligations fixés par les statuts (voir charte des AP)\n\t\t\t\to Fréquence de réunion : tous les 2 mois, des réunions supplémentaires seront organisés si nécessaire\n\n•Honneur ou donateurs\n\t\t\t\to Ce sont des personnes choisies ou admises en raison de leur personnalité et qui sont susceptibles d’aider moralement, scientifiquement, matériellement, ou de toute autre manière, l’association à la réalisation de ses objectifs\n\t\t\t\to Aucune fréquence de réunion n’est requise\n\nLa liste des membres effectifs et adhérents se trouve dans la base de données des AP sur un réseau partagé.\nConditions d’admission d’un membre effectif :\n\t\t\t\t\t\t• Avoir une origine africaine\n\t\t\t\t\t\t• Être en ordre de cotisation\n\t\t\t\t\t\t• Être en accord avec la charte et le présent ROI\n\t\t\t\t\t\t• Faire preuve d’exemplarité et d’engagement vis-à-vis de l’asbl\nConditions d’admission d’un membre adhérent :\n\t\t\t\t\t\t• Avoir une origine africaine\n\t\t\t\t\t\t• Être en ordre de cotisation\n\t\t\t\t\t\t• Être en accord avec la charte et le présent ROI\nConditions d’admission d’un membre d’honneur :\n\t\t\t\t\t\t• L’origine africaine n’est pas requise\n\t\t\t\t\t\t• Être en accord avec les conditions définies dans la charte"),
              RoiContainer(context, "Financement",
                  "Chaque personne qui désire devenir membre devra s’acquitter d’une cotisation de 50 EUR à son entrée via le numéro de compte de AFRICAN PROFESSIONALS asbl BE90 1431 0866 2232. Il s’agit d’une cotisation annuelle.\n\nChaque sortie de fonds de l’association nécessite les signatures du président et du trésorier et en l’absence de l’un et/ou de l’autre, le conseil d’administration désigne un ou deux administrateurs à cet effet.\n\nLes moyens de fonctionnement de l’association proviennent : des cotisations, dons, services divers des membres ou des tiers (sponsors) ou versements anticipés d’un des membres."),
            RoiContainer(context, "Une dernière consigne", "Une dernière consigne Appropriez-vous notre réseau en y partageant les infos nécessaires à son épanouissement et tout enveillant aux consignes de ce présent règlement.Le présent règlement d’ordre intérieur prend effet le 08 avril 2019.Il peut faire l’objet de modifications si les membres du conseil d’administration le demandent.\n\nLe R.O.I. est accessible via le réseau partagé des AP et chaque membre peut en obtenir une copie sursimple demande."),
           SizedBox(height: Media.height(context)*.04,),
            ],
          ),
        ),
      ),
    );
  }

  Padding RoiContainer(
    BuildContext context,
    String titre,
    String text,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            titre,
            style: GoogleFonts.nunito(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: Media.width(context) * .035,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            text,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: Media.width(context) * .03,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
