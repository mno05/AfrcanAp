import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/LocalApp/Parametre.dart';
import 'package:flutter/material.dart';

class DrawerC extends StatelessWidget {
  const DrawerC({super.key});

  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    return Padding(
      padding: EdgeInsets.only(top: h * 0.11, bottom: h * 0.01),
      child: Drawer(
        // width: w/2,
        elevation: 5,
        backgroundColor: Colors.white70,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                padding: EdgeInsets.only(top: h * 0.07),
                height: h * 0.32,
                width: w,
                // color: Colors.black,
                child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("img/profil.png"),
                        radius: h * 0.07,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "CHRISTIAN MATONDO",
                        style: TextStyle(
                          color: AppData.BasicColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Voir le profil',
                          style: TextStyle(color: Colors.black54),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  print("Accueil");
                },
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                minLeadingWidth: -4,
                dense: true,
                minVerticalPadding: 0,
                style: ListTileStyle.drawer,
                contentPadding:
                    EdgeInsets.only(left: w * 0.09, top: -4, bottom: -4),
                leading: Icon(
                  Icons.home,
                  color: AppData.BasicColor,
                  size: 30,
                ),
                title: Text(
                  "Accueil",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  print("A propos");
                },
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                minLeadingWidth: -4,
                dense: true,
                minVerticalPadding: 0,
                style: ListTileStyle.drawer,
                contentPadding:
                    EdgeInsets.only(left: w * 0.09, top: -4, bottom: -4),
                leading: Icon(
                  Icons.info,
                  color: AppData.BasicColor,
                  size: 30,
                ),
                title: Text(
                  "A propos",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  print("Nous contactez");
                },
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                minLeadingWidth: -4,
                dense: true,
                minVerticalPadding: 0,
                style: ListTileStyle.drawer,
                contentPadding:
                    EdgeInsets.only(left: w * 0.09, top: -4, bottom: -4),
                leading: Icon(
                  Icons.mark_as_unread_sharp,
                  color: AppData.BasicColor,
                  size: 30,
                ),
                title: Text(
                  "Nous contactez",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  print("Invitation");
                },
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                minLeadingWidth: -4,
                dense: true,
                minVerticalPadding: 0,
                style: ListTileStyle.drawer,
                contentPadding:
                    EdgeInsets.only(left: w * 0.09, top: -4, bottom: -4),
                leading: Icon(
                  Icons.share,
                  color: AppData.BasicColor,
                  size: 30,
                ),
                title: Text(
                  "Invitation",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  print("Trouvez un membre");
                },
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                minLeadingWidth: -4,
                dense: true,
                minVerticalPadding: 0,
                style: ListTileStyle.drawer,
                contentPadding:
                    EdgeInsets.only(left: w * 0.09, top: -4, bottom: -4),
                leading: Icon(
                  Icons.place,
                  color: AppData.BasicColor,
                  size: 30,
                ),
                title: Text(
                  "Trouvez un membre",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Parametre(),));
                },
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                minLeadingWidth: -4,
                dense: true,
                minVerticalPadding: 0,
                style: ListTileStyle.drawer,
                contentPadding:
                    EdgeInsets.only(left: w * 0.09, top: -4, bottom: -4),
                leading: Icon(
                  Icons.settings,
                  color: AppData.BasicColor,
                  size: 30,
                ),
                title: Text(
                  "Paramètres",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              
              ),
              ListTile(
                onTap: () {
                  print("Déconnexion");
                },
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                minLeadingWidth: -4,
                dense: true,
                minVerticalPadding: 0,
                style: ListTileStyle.drawer,
                contentPadding:
                    EdgeInsets.only(left: w * 0.09, top: -4, bottom: -4),
                leading: Icon(
                  Icons.output,
                  color: AppData.BasicColor,
                  size: 30,
                ),
                title: Text(
                  "Déconnexion",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}