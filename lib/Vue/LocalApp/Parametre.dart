import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/LocalApp/Adhesion.dart';
import 'package:african_ap/Vue/LocalApp/Compte.dart';
import 'package:flutter/material.dart';

class Parametre extends StatelessWidget {
  const Parametre({super.key});

  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppData.BasicColor,
        title: Text("Parametre"),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: h / 12,
              decoration: BoxDecoration(
                // color: Colors.black,
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.black12),
                ),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.black45,
                ),
                title: Text(
                  "Compte",
                  style: TextStyle(fontSize: w * 0.045, color: Colors.black54),
                ),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Compte(),)),
              ),
            ),
            Container(
              height: h / 12,
              decoration: BoxDecoration(
                // color: Colors.black,
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.black12),
                ),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.people,
                  size: 50,
                  color: Colors.black45,
                ),
                title: Text(
                  "Adhésion",
                  style: TextStyle(fontSize: w * 0.045, color: Colors.black54),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Adhesion(),));
                },
              ),
            ),
            Container(
              height: h / 12,
              decoration: BoxDecoration(
                // color: Colors.black,
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.black12),
                ),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.lock,
                  size: 50,
                  color: Colors.black12,
                ),
                title: Text(
                  "Confidentialités des données",
                  style: TextStyle(fontSize: w * 0.045, color: Colors.black12),
                ),
              ),
            ),
            Container(
              height: h / 12,
              decoration: BoxDecoration(
                // color: Colors.black,
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.black12),
                ),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.note_alt_outlined,
                  size: 50,
                  color: Colors.black12,
                ),
                title: Text(
                  "ROI et Charte",
                  style: TextStyle(fontSize: w * 0.045, color: Colors.black12),
                ),
              ),
            ),
            SizedBox(height: h * 0.2),
           
          ],
        ),
      ),
      bottomSheet: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Version 1.0.0"),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Quitter",
                        style: TextStyle(
                          color: AppData.BasicColor,
                        ),
                      ))
                ],
              ),
            ) ,
    );
  }
}
